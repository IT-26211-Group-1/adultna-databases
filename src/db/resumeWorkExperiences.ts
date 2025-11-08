import { mysqlTable, varchar, date, text, boolean, int } from "drizzle-orm/mysql-core";
import { resumes } from "./resumes";
import { jobTitles } from "./jobTitles";
import { employers } from "./employers";

export const resumeWorkExperiences = mysqlTable("resume_work_experiences", {
  id: varchar("id", { length: 36 }).primaryKey(),
  resumeId: varchar("resume_id", { length: 36 })
    .notNull()
    .references(() => resumes.id, { onDelete: "cascade" }),
  jobTitleId: varchar("job_title_id", { length: 36 })
    .references(() => jobTitles.id, { onDelete: "set null" }),
  employerId: varchar("employer_id", { length: 36 })
    .references(() => employers.id, { onDelete: "set null" }),
  startDate: date("start_date"),
  endDate: date("end_date"),
  isCurrentlyWorkingHere: boolean("is_currently_working_here").default(false),
  description: text("description"),
  order: int("order").notNull().default(0),
});
