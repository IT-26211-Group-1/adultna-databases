import { mysqlTable, varchar, date, timestamp } from "drizzle-orm/mysql-core";
import { resumes } from "./resumes";

export const resumeContactInfo = mysqlTable("resume_contact_info", {
  id: varchar("id", { length: 36 }).primaryKey(),
  resumeId: varchar("resume_id", { length: 36 })
    .notNull()
    .unique()
    .references(() => resumes.id, { onDelete: "cascade" }),
  firstName: varchar("first_name", { length: 100 }).notNull(),
  lastName: varchar("last_name", { length: 100 }).notNull(),
  jobPosition: varchar("job_position", { length: 100 }),
  email: varchar("email", { length: 100 }).notNull(),
  phone: varchar("phone", { length: 20 }).notNull(),
  city: varchar("city", { length: 50 }),
  region: varchar("region", { length: 100 }),
  birthDate: date("birth_date"),
  linkedin: varchar("linkedin", { length: 255 }),
  portfolio: varchar("portfolio", { length: 255 }),
  createdAt: timestamp("created_at").defaultNow().notNull(),
  updatedAt: timestamp("updated_at").defaultNow().notNull().onUpdateNow(),
});
