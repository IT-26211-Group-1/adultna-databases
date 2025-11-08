import { mysqlTable, varchar, int, json } from "drizzle-orm/mysql-core";
import { resumes } from "./resumes";

export const resumeSkills = mysqlTable("resume_skills", {
  id: varchar("id", { length: 36 }).primaryKey(),
  resumeId: varchar("resume_id", { length: 36 })
    .notNull()
    .references(() => resumes.id, { onDelete: "cascade" }),
  skill: json("skill").notNull(),
  order: int("order").notNull().default(0),
});
