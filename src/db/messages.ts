import {
  mysqlTable,
  varchar,
  timestamp,
  text,
  int,
  index,
} from "drizzle-orm/mysql-core";
import { users } from "./users";
import { conversations } from "./conversations";

export const messages = mysqlTable(
  "messages",
  {
    id: varchar("id", { length: 36 }).primaryKey(),
    conversationId: varchar("conversation_id", { length: 36 })
      .notNull()
      .references(() => conversations.id, { onDelete: "cascade" }),
    userId: varchar("user_id", { length: 36 })
      .notNull()
      .references(() => users.id, { onDelete: "cascade" }),
    role: varchar("role", { length: 20 }).notNull(),
    s3Bucket: varchar("s3_bucket", { length: 255 }).notNull(),
    s3KeyEncrypted: text("s3_key_encrypted").notNull(),

    // Encryption & Security
    kmsKeyId: varchar("kms_key_id", { length: 255 }).notNull(),
    contentHash: varchar("content_hash", { length: 64 }),
    contentSize: int("content_size"),

    // Metadata
    metadata: text("metadata"),

    // Timestamps
    createdAt: timestamp("created_at").defaultNow().notNull(),
    deletedAt: timestamp("deleted_at"),
  },
  (table) => ({
    // Index for fetching conversation messages (primary query pattern)
    conversationIdIdx: index("conversation_id_idx").on(table.conversationId),

    // Composite index for conversation messages ordered by time
    conversationIdCreatedAtIdx: index("conversation_id_created_at_idx").on(
      table.conversationId,
      table.createdAt
    ),

    // Index for user queries and analytics
    userIdIdx: index("user_id_idx").on(table.userId),

    // Index for cleanup/retention queries
    deletedAtIdx: index("deleted_at_idx").on(table.deletedAt),
  })
);
