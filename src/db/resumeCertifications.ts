import { mysqlTable, varchar, int } from "drizzle-orm/mysql-core";
import { resumes } from "./resumes";

export const resumeCertifications = mysqlTable("resume_certifications", {
  id: varchar("id", { length: 36 }).primaryKey(),
  resumeId: varchar("resume_id", { length: 36 })
    .notNull()
    .references(() => resumes.id, { onDelete: "cascade" }),
  certificate: varchar("certificate", { length: 100 }).notNull(),
  issuingOrganization: varchar("issuing_organization", { length: 100 }),
  order: int("order").notNull().default(0),
});
