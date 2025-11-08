import { mysqlTable, varchar, int } from "drizzle-orm/mysql-core";
import { resumes } from "./resumes";
import { skills } from "./skills";

export const resumeSkills = mysqlTable("resume_skills", {
  id: varchar("id", { length: 36 }).primaryKey(),
  resumeId: varchar("resume_id", { length: 36 })
    .notNull()
    .references(() => resumes.id, { onDelete: "cascade" }),
  skillId: varchar("skill_id", { length: 36 })
    .notNull()
    .references(() => skills.id, { onDelete: "cascade" }),
  order: int("order").notNull().default(0),
});
