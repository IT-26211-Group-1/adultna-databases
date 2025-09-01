import { mysqlTable, varchar, date } from "drizzle-orm/mysql-core";
import { resumeSections } from "./resumeSections";

export const resumeEntries = mysqlTable("resume_entries", {
  id: varchar("id", { length: 36 }).primaryKey(),
  sectionId: varchar("section_id", { length: 36 }).notNull().references(() => resumeSections.id),
  description: varchar("description", { length: 2000 }),
  company: varchar("company", { length: 255 }),
  location: varchar("location", { length: 255 }),
  startDate: date("start_date"),
  endDate: date("end_date"),
});
