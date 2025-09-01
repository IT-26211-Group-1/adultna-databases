import { mysqlTable, varchar } from "drizzle-orm/mysql-core";
import { jobRole } from "./jobRole";

export const mockQuestions = mysqlTable("mock_questions", {
  id: varchar("id", { length: 36 }).primaryKey(),
  jobRoleId: varchar("job_role_id", { length: 36 }).references(() => jobRole.id),
  question: varchar("question", { length: 500 }).notNull(),
  category: varchar("category", { length: 100 }).notNull(),
});
