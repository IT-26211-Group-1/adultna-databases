import { mysqlTable, timestamp, varchar, bigint } from "drizzle-orm/mysql-core";
import { users } from "./users";
import { onboardingQuestions } from "./onboardingQuestions";
import { answerOptions } from "./answerOptions";

export const userOnboardingResponse = mysqlTable("user_onboarding_response", {
  id: varchar("id", { length: 36 }).primaryKey(),
  userId: varchar("user_id", { length: 36 })
    .notNull()
    .references(() => users.id, {
      onDelete: "cascade",
      onUpdate: "cascade",
    }),
  questionId: bigint("question_id", { mode: "number", unsigned: true })
    .notNull()
    .references(() => onboardingQuestions.id, {
      onDelete: "cascade",
      onUpdate: "cascade",
    }),
  optionId: bigint("option_id", { mode: "number", unsigned: true })
    .notNull()
    .references(() => answerOptions.id, {
      onDelete: "cascade",
      onUpdate: "cascade",
    }),
  answeredAt: timestamp("answered_at").defaultNow(),
});
