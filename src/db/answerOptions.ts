import { mysqlTable, serial, varchar, int, timestamp } from "drizzle-orm/mysql-core";
import { outcomeTag } from "./outcomeTag";
import { onboardingQuestions } from "./onboardingQuestions";

export const answerOptions = mysqlTable("answer_options", {
  id: serial("id").primaryKey(),
  questionId: int("question_id").notNull().references(() => onboardingQuestions.id),
  outcomeTagId: int("outcome_tag_id").references(() => outcomeTag.id),
  optionText: varchar("option_text", { length: 255 }).notNull(),
  createdAt: timestamp("created_at").defaultNow(),
  updatedAt: timestamp("updated_at").defaultNow(),
});
