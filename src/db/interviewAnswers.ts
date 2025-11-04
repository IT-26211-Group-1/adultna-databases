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
  transcriptJobName: varchar("transcript_job_name", { length: 255 }),

  // S3 storage keys (content stored in S3, not DB)
  contentS3Key: varchar("content_s3_key", { length: 512 }), // S3 key for answer content JSON (userAnswer, feedback, strengths, improvements)
  audioS3Key: varchar("audio_s3_key", { length: 512 }), // S3 key for audio file

  // Individual dimension scores (1-5 whole numbers) - kept in DB for queries/analytics
  starCompletenessScore: int("star_completeness_score"),
  actionSpecificityScore: int("action_specificity_score"),
  resultQuantificationScore: int("result_quantification_score"),
  relevanceToRoleScore: int("relevance_to_role_score"),
  deliveryFluencyScore: int("delivery_fluency_score"),

  // Total weighted score (decimal with 1 decimal place) - kept in DB for queries/analytics
  totalScore: decimal("total_score", { precision: 3, scale: 1 }),

  // Timestamps
  createdAt: timestamp("created_at").defaultNow().notNull(),
  evaluatedAt: timestamp("evaluated_at"),
});
