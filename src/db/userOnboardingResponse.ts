import { mysqlTable, int, timestamp } from "drizzle-orm/mysql-core";
import { users } from "./users";
import { onboardingQuestions } from "./onboardingQuestions";
import { answerOptions } from "./answerOptions";

export const userOnboardingResponse = mysqlTable("user_onboarding_response", {
  userId: int("user_id").notNull().references(() => users.id),
  questionId: int("question_id").notNull().references(() => onboardingQuestions.id),
  optionId: int("option_id").notNull().references(() => answerOptions.id),
  answeredAt: timestamp("answered_at").defaultNow(),
});
