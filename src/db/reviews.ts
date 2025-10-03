import {
  mysqlTable,
  varchar,
  timestamp,
  serial,
  mysqlEnum,
  bigint,
  text,
} from "drizzle-orm/mysql-core";
import { onboardingQuestions } from "./onboardingQuestions";
import { users } from "./users";

export const reviews = mysqlTable("reviews", {
  id: serial("id").primaryKey(),
  questionId: bigint("question_id", { mode: "number", unsigned: true })
    .notNull()
    .references(() => onboardingQuestions.id, { onDelete: "cascade" }),
  reviewerId: varchar("reviewer_id", { length: 36 })
    .notNull()
    .references(() => users.id, { onDelete: "cascade" }),
  status: mysqlEnum("status", [
    "pending",
    "accepted",
    "rejected",
    "to_revise",
  ]).notNull(),
  reason: text("reason"),
  createdAt: timestamp("created_at").defaultNow(),
});
