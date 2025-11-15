import {
  mysqlTable,
  varchar,
  date,
  text,
  timestamp,
  int,
  boolean,
} from "drizzle-orm/mysql-core";
import { users } from "./users";

export const milestones = mysqlTable("milestones", {
  id: varchar("id", { length: 36 }).primaryKey(),
  userId: varchar("user_id", { length: 36 })
    .notNull()
    .references(() => users.id, {
      onDelete: "cascade",
      onUpdate: "cascade",
    }),
  title: varchar("title", { length: 255 }).notNull(),
  description: text("description"),
  category: varchar("category", { length: 50 }).notNull(),
  status: varchar("status", { length: 20 }).notNull().default("pending"),
  priority: varchar("priority", { length: 255 }),
  positionNumber: int("position_number").notNull(),
  isActive: boolean("is_active").notNull().default(true),
  deadline: date("deadline"),
  createdAt: timestamp("created_at").defaultNow(),
  updatedAt: timestamp("updated_at").defaultNow().onUpdateNow(),
  completedAt: timestamp("completed_at"),
});
