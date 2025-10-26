import {
  mysqlTable,
  serial,
  varchar,
  timestamp,
  int,
} from "drizzle-orm/mysql-core";

export const conversations = mysqlTable("conversations", {
  id: serial("id").primaryKey(),
  userId: varchar("user_id", { length: 255 }).notNull(),
  sessionId: varchar("session_id", { length: 255 }).notNull().unique(),
  s3Key: varchar("s3_key", { length: 512 }).notNull(),
  startedAt: timestamp("started_at").defaultNow().notNull(),
  endedAt: timestamp("ended_at"),
  topic: varchar("topic", { length: 255 }),
  messageCount: int("message_count").default(0).notNull(),
});
