import { mysqlTable, varchar, timestamp } from "drizzle-orm/mysql-core";
import { users } from "./users";
import { resumes } from "./resumes";

export const coverLetters = mysqlTable("cover_letters", {
  id: varchar("id", { length: 36 }).primaryKey(),
  userId: varchar("user_id", { length: 36 })
    .notNull()
    .references(() => users.id),
  resumeId: varchar("resume_id", { length: 36 }).references(() => resumes.id),
  title: varchar("title", { length: 255 }).notNull(),
  status: varchar("status", { length: 20 }).notNull().default("draft"),
  style: varchar("style", { length: 20 }).notNull().default("formal"),
  createdAt: timestamp("created_at").defaultNow().notNull(),
  updatedAt: timestamp("updated_at").defaultNow().onUpdateNow().notNull(),
});
