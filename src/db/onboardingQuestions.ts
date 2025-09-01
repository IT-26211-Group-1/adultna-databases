import { mysqlTable, varchar, timestamp } from "drizzle-orm/mysql-core";

export const onboardingQuestions = mysqlTable("onboarding_questions", {
  id: varchar("id", { length: 36 }).primaryKey(),
  question: varchar("question", { length: 255 }).notNull(),
  status: varchar("status", { length: 50 }).notNull(),
  createdAt: timestamp("created_at").defaultNow(),
  updatedAt: timestamp("updated_at").defaultNow(),
});
