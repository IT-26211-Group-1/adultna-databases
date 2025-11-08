import { mysqlTable, varchar, int } from "drizzle-orm/mysql-core";
import { resumes } from "./resumes";
import { certifications } from "./certifications";
import { organizations } from "./organizations";

export const resumeCertifications = mysqlTable("resume_certifications", {
  id: varchar("id", { length: 36 }).primaryKey(),
  resumeId: varchar("resume_id", { length: 36 })
    .notNull()
    .references(() => resumes.id, { onDelete: "cascade" }),
  certificationId: varchar("certification_id", { length: 36 })
    .notNull()
    .references(() => certifications.id, { onDelete: "cascade" }),
  organizationId: varchar("organization_id", { length: 36 })
    .references(() => organizations.id, { onDelete: "set null" }),
  order: int("order").notNull().default(0),
});
