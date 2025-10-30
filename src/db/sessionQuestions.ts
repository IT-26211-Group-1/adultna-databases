import { mysqlTable, varchar, timestamp, int } from "drizzle-orm/mysql-core";
import { interviewSession } from "./interviewSession";
import { interviewQuestions } from "./interviewQuestions";

export const sessionQuestions = mysqlTable("session_questions", {
  id: varchar("id", { length: 36 }).primaryKey(),
  sessionId: varchar("session_id", { length: 36 })
    .notNull()
    .references(() => interviewSession.id),
  questionId: varchar("question_id", { length: 36 })
    .notNull()
    .references(() => interviewQuestions.id),
  order: int("order").notNull(),
  isGeneral: int("is_general").notNull().default(0), // 1 for general, 0 for role-specific
  createdAt: timestamp("created_at").defaultNow().notNull(),
});
