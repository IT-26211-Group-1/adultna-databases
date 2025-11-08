import { mysqlTable, varchar, date, text, boolean, int } from "drizzle-orm/mysql-core";
import { resumes } from "./resumes";

export const resumeWorkExperiences = mysqlTable("resume_work_experiences", {
  id: varchar("id", { length: 36 }).primaryKey(),
  resumeId: varchar("resume_id", { length: 36 })
    .notNull()
    .references(() => resumes.id, { onDelete: "cascade" }),
  jobTitle: varchar("job_title", { length: 100 }),
  employer: varchar("employer", { length: 100 }),
  startDate: date("start_date"),
  endDate: date("end_date"),
  isCurrentlyWorkingHere: boolean("is_currently_working_here").default(false),
  description: text("description"),
  order: int("order").notNull().default(0),
});
