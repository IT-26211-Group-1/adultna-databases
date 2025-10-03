import {
  mysqlTable,
  varchar,
  timestamp,
  serial,
  mysqlEnum,
} from "drizzle-orm/mysql-core";

export const onboardingQuestions = mysqlTable("onboarding_questions", {
  id: serial("id").primaryKey(),
  question: varchar("question", { length: 255 }).notNull(),
  category: varchar("category", { length: 50 }).notNull(),
  status: mysqlEnum("status", ["pending", "accepted", "rejected", "to_revise"])
    .default("pending")
    .notNull(),
  createdAt: timestamp("created_at").defaultNow(),
  updatedAt: timestamp("updated_at").defaultNow().onUpdateNow(),
});
