import { mysqlTable, varchar, timestamp } from "drizzle-orm/mysql-core";
import { users } from "./users";
import { jobRole } from "./jobRole";

export const interviewSession = mysqlTable("interview_session", {
  id: varchar("id", { length: 36 }).primaryKey(),
  userId: varchar("user_id", { length: 36 }).notNull().references(() => users.id),
  jobRoleId: varchar("job_role_id", { length: 36 }).notNull().references(() => jobRole.id),
  createdAt: timestamp("created_at").defaultNow().notNull(),
});
