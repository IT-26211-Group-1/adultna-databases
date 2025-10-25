import {
  mysqlTable,
  varchar,
  timestamp,
  mysqlEnum,
  text,
} from "drizzle-orm/mysql-core";
import { users } from "./users";

export const interviewQuestions = mysqlTable("interview_questions", {
  id: varchar("id", { length: 36 }).primaryKey(),
  question: text("question").notNull(),
  category: mysqlEnum("category", [
    "behavioral",
    "technical",
    "situational",
  ]).notNull(),
  source: mysqlEnum("source", ["ai", "manual"]).notNull(),
  status: mysqlEnum("status", ["approved", "rejected", "pending", "to_revise"])
    .notNull()
    .default("pending"),
  reason: varchar("reason", { length: 255 }),

  // Admin tracking
  createdBy: varchar("created_by", { length: 36 })
    .notNull()
    .references(() => users.id),
  updatedBy: varchar("updated_by", { length: 36 }).references(() => users.id),
  deletedBy: varchar("deleted_by", { length: 36 }).references(() => users.id),

  // Timestamps
  createdAt: timestamp("created_at").defaultNow().notNull(),
  updatedAt: timestamp("updated_at").defaultNow().onUpdateNow().notNull(),
  deletedAt: timestamp("deleted_at"),
});
