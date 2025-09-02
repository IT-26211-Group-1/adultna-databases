import {
  mysqlTable,
  serial,
  bigint,
  varchar,
  timestamp,
} from "drizzle-orm/mysql-core";
import { onboardingQuestions } from "./onboardingQuestions";
import { outcomeTag } from "./outcomeTag";

export const answerOptions = mysqlTable("answer_options", {
  id: serial("id").primaryKey(),
  questionId: bigint("question_id", { mode: "number", unsigned: true })
    .notNull()
    .references(() => onboardingQuestions.id, {
      onDelete: "cascade",
      onUpdate: "cascade",
    }),
  outcomeTagId: bigint("outcome_tag_id", {
    mode: "number",
    unsigned: true,
  }).references(() => outcomeTag.tag_id, {
    onDelete: "set null",
    onUpdate: "cascade",
  }),
  optionText: varchar("option_text", { length: 255 }).notNull(),
  createdAt: timestamp("created_at").defaultNow(),
  updatedAt: timestamp("updated_at").defaultNow(),
});
