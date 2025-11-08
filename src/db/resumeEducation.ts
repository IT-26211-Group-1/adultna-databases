import { mysqlTable, varchar, date, int } from "drizzle-orm/mysql-core";
import { resumes } from "./resumes";
import { schools } from "./schools";
import { degrees } from "./degrees";
import { fieldsOfStudy } from "./fieldsOfStudy";

export const resumeEducation = mysqlTable("resume_education", {
  id: varchar("id", { length: 36 }).primaryKey(),
  resumeId: varchar("resume_id", { length: 36 })
    .notNull()
    .references(() => resumes.id, { onDelete: "cascade" }),
  schoolId: varchar("school_id", { length: 36 })
    .references(() => schools.id, { onDelete: "set null" }),
  degreeId: varchar("degree_id", { length: 36 })
    .references(() => degrees.id, { onDelete: "set null" }),
  fieldOfStudyId: varchar("field_of_study_id", { length: 36 })
    .references(() => fieldsOfStudy.id, { onDelete: "set null" }),
  graduationDate: date("graduation_date"),
  order: int("order").notNull().default(0),
});
