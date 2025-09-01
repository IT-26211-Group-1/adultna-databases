import { mysqlTable, varchar, timestamp } from "drizzle-orm/mysql-core";
import { interviewSession } from "./interviewSession";
import { mockQuestions } from "./mockQuestions";

export const sessionQuestions = mysqlTable("session_questions", {
  id: varchar("id", { length: 36 }).primaryKey(),
  sessionId: varchar("session_id", { length: 36 }).notNull().references(() => interviewSession.id),
  questionId: varchar("question_id", { length: 36 }).notNull().references(() => mockQuestions.id),
  order: varchar("order", { length: 10 }).notNull(),
});
