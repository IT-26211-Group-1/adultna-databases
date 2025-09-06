import { mysqlTable, varchar, timestamp, serial } from "drizzle-orm/mysql-core";

export const onboardingQuestions = mysqlTable("onboarding_questions", {
  id: serial("id").primaryKey(),
  question: varchar("question", { length: 255 }).notNull(),
  category: varchar("category", { length: 50 }).notNull(),
  createdAt: timestamp("created_at").defaultNow(),
  updatedAt: timestamp("updated_at").defaultNow(),
});
