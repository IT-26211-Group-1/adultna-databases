import { mysqlTable, varchar, timestamp, boolean } from "drizzle-orm/mysql-core";
import { users } from "./users";
import { resumes } from "./resumes";
import { title } from "process";

export const coverLetters = mysqlTable("cover_letters", {
  id: varchar("id", { length: 36 }).primaryKey(),
  userId: varchar("user_id", { length: 36 }).notNull().references(() => users.id),
  resumeId: varchar("resume_id", { length: 36 }).notNull().references(() => resumes.id),
  title: varchar("title", { length: 255 }).notNull(),
  templateName: varchar("template_name", { length: 255 }).notNull(),
  content: varchar("content", { length: 4000 }),
  aiGenerated: boolean("ai_generated").default(false).notNull(), //Not sure if final
  createdAt: timestamp("created_at").defaultNow().notNull(),
  updatedAt: timestamp("updated_at").defaultNow().onUpdateNow().notNull(),
});
