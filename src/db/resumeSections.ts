import { mysqlTable, varchar } from "drizzle-orm/mysql-core";
import { resumes } from "./resumes";

export const resumeSections = mysqlTable("resume_sections", {
  id: varchar("id", { length: 36 }).primaryKey(),
  resumeId: varchar("resume_id", { length: 36 }).notNull().references(() => resumes.id),
  name: varchar("name", { length: 255 }).notNull(),
  order: varchar("order", { length: 10 }),
});
