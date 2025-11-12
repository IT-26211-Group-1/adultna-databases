import { mysqlTable, varchar, timestamp, boolean, text } from "drizzle-orm/mysql-core";
import { users } from "./users";
import { resumes } from "./resumes";

export const coverLetters = mysqlTable("cover_letters", {
  id: varchar("id", { length: 36 }).primaryKey(),
  userId: varchar("user_id", { length: 36 }).notNull().references(() => users.id),
  resumeId: varchar("resume_id", { length: 36 }).references(() => resumes.id),
  title: varchar("title", { length: 255 }).notNull(),
  templateId: varchar("template_id", { length: 50 }).notNull().default("modern"),
  status: varchar("status", { length: 20 }).notNull().default("draft"),
  style: varchar("style", { length: 20 }).notNull().default("formal"),
  targetCompany: varchar("target_company", { length: 255 }),
  targetPosition: varchar("target_position", { length: 255 }),
  jobDescription: text("job_description"),
  content: text("content"),
  aiGenerated: boolean("ai_generated").default(false).notNull(),
  createdAt: timestamp("created_at").defaultNow().notNull(),
  updatedAt: timestamp("updated_at").defaultNow().onUpdateNow().notNull(),
});
