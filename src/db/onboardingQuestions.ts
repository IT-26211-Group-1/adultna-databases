import {
  mysqlTable,
  varchar,
  timestamp,
  serial,
  mysqlEnum,
} from "drizzle-orm/mysql-core";
import { users } from "./users";

export const onboardingQuestions = mysqlTable("onboarding_questions", {
  id: serial("id").primaryKey(),
  question: varchar("question", { length: 255 }).notNull(),
  category: varchar("category", { length: 50 }).notNull(),
  status: mysqlEnum("status", ["pending", "accepted", "rejected", "to_revise"])
    .default("pending")
    .notNull(),
  createdBy: varchar("created_by", { length: 36 }).references(() => users.id),
  updatedBy: varchar("updated_by", { length: 36 }).references(() => users.id),
  deletedBy: varchar("deleted_by", { length: 36 }).references(() => users.id),
  createdAt: timestamp("created_at").defaultNow(),
  updatedAt: timestamp("updated_at").defaultNow().onUpdateNow(),
  deletedAt: timestamp("deleted_at"),
});
