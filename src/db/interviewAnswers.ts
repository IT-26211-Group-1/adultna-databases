import {
  mysqlTable,
  varchar,
  timestamp,
  text,
  int,
  decimal,
  json,
} from "drizzle-orm/mysql-core";
import { sessionQuestions } from "./sessionQuestions";
import { users } from "./users";

export const interviewAnswers = mysqlTable("interview_answers", {
  id: varchar("id", { length: 36 }).primaryKey(),
  sessionQuestionId: varchar("session_question_id", { length: 36 })
    .notNull()
    .references(() => sessionQuestions.id),
  userId: varchar("user_id", { length: 36 })
    .notNull()
    .references(() => users.id),
  userAnswer: text("user_answer"),
  transcriptJobName: varchar("transcript_job_name", { length: 255 }),

  // Individual dimension scores (1-5 whole numbers)
  starCompletenessScore: int("star_completeness_score"),
  actionSpecificityScore: int("action_specificity_score"),
  resultQuantificationScore: int("result_quantification_score"),
  relevanceToRoleScore: int("relevance_to_role_score"),
  deliveryFluencyScore: int("delivery_fluency_score"),

  // Total weighted score (decimal with 1 decimal place)
  totalScore: decimal("total_score", { precision: 3, scale: 1 }),

  // STAR feedback components
  situationFeedback: text("situation_feedback"),
  taskFeedback: text("task_feedback"),
  actionFeedback: text("action_feedback"),
  resultFeedback: text("result_feedback"),

  // Overall feedback
  overallFeedback: text("overall_feedback"),

  // Strengths and improvements (stored as JSON arrays)
  strengths: json("strengths").$type<string[]>(),
  improvements: json("improvements").$type<string[]>(),

  // Timestamps
  createdAt: timestamp("created_at").defaultNow().notNull(),
  evaluatedAt: timestamp("evaluated_at"),
});
