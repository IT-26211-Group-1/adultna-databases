import { mysqlTable, varchar, date, int } from "drizzle-orm/mysql-core";
import { resumes } from "./resumes";

export const resumeEducation = mysqlTable("resume_education", {
  id: varchar("id", { length: 36 }).primaryKey(),
  resumeId: varchar("resume_id", { length: 36 })
    .notNull()
    .references(() => resumes.id, { onDelete: "cascade" }),
  schoolName: varchar("school_name", { length: 100 }),
  schoolLocation: varchar("school_location", { length: 100 }),
  degree: varchar("degree", { length: 100 }),
  fieldOfStudy: varchar("field_of_study", { length: 100 }),
  graduationDate: date("graduation_date"),
  order: int("order").notNull().default(0),
});
