import { mysqlTable, varchar, timestamp } from "drizzle-orm/mysql-core";
import { sessionQuestions } from "./sessionQuestions";

export const interviewAnswers = mysqlTable("interview_answers", {
  id: varchar("id", { length: 36 }).primaryKey(),
  sessionQuestionId: varchar("session_question_id", { length: 36 }).notNull().references(() => sessionQuestions.id),
  userAnswer: varchar("user_answer", { length: 2000 }),
  aiFeedback: varchar("ai_feedback", { length: 2000 }),
  score: varchar("score", { length: 5 }),
  evaluatedAt: timestamp("evaluated_at").defaultNow().notNull(),
});
