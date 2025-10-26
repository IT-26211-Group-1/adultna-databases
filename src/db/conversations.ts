import {
  mysqlTable,
  varchar,
  timestamp,
  int,
  index,
} from "drizzle-orm/mysql-core";
import { users } from "./users";

export const conversations = mysqlTable(
  "conversations",
  {
    id: varchar("id", { length: 36 }).primaryKey(),
    userId: varchar("user_id", { length: 36 })
      .notNull()
      .references(() => users.id, { onDelete: "cascade" }),
    title: varchar("title", { length: 255 }),

    messageCount: int("message_count").default(0).notNull(),
    lastActivityAt: timestamp("last_activity_at").defaultNow().notNull(),

    // Audit & timestamps
    createdAt: timestamp("created_at").defaultNow().notNull(),
    updatedAt: timestamp("updated_at").defaultNow().onUpdateNow().notNull(),
    deletedAt: timestamp("deleted_at"),
  },
  (table) => ({
    userIdIdx: index("user_id_idx").on(table.userId),

    // Index for active conversation queries (excludes soft-deleted)
    userIdDeletedAtIdx: index("user_id_deleted_at_idx").on(
      table.userId,
      table.deletedAt
    ),

    // Index for sorting by activity
    lastActivityIdx: index("last_activity_idx").on(table.lastActivityAt),
  })
);
