import { mysqlTable, varchar, timestamp } from "drizzle-orm/mysql-core";
import { users } from "./users";

export const interviewSession = mysqlTable("interview_session", {
  id: varchar("id", { length: 36 }).primaryKey(),
  userId: varchar("user_id", { length: 36 })
    .notNull()
    .references(() => users.id),
  industry: varchar("industry", { length: 255 }).notNull(),
  jobRole: varchar("job_role", { length: 255 }).notNull(),
  createdAt: timestamp("created_at").defaultNow().notNull(),
});
