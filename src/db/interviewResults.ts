import {
  mysqlTable,
  varchar,
  timestamp,
  int,
  json,
  mysqlEnum,
} from "drizzle-orm/mysql-core";
import { users } from "./users";

export const interviewResults = mysqlTable("interview_results", {
  id: varchar("id", { length: 36 }).primaryKey(),
  userId: varchar("user_id", { length: 36 })
    .notNull()
    .references(() => users.id),
  sessionId: varchar("session_id", { length: 36 }).notNull(),
  status: mysqlEnum("status", ["pending", "processing", "completed", "failed"])
    .notNull()
    .default("pending"),
  totalAnswers: int("total_answers").notNull().default(0),
  processedAnswers: int("processed_answers").notNull().default(0),
  failedAnswers: int("failed_answers").notNull().default(0),
  results: json("results").$type<
    Array<{
      sessionQuestionId: string;
      answerId?: string;
      success: boolean;
      error?: string;
    }>
  >(),
  createdAt: timestamp("created_at").defaultNow().notNull(),
  updatedAt: timestamp("updated_at").defaultNow().notNull(),
  completedAt: timestamp("completed_at"),
});
