import { mysqlTable, varchar, serial, unique } from "drizzle-orm/mysql-core";
import { interviewQuestions } from "./interviewQuestions";
import { jobRole } from "./jobRole";

export const interviewQuestionJobRoles = mysqlTable(
  "question_job_roles",
  {
    id: serial("id").primaryKey(),
    questionId: varchar("question_id", { length: 36 })
      .notNull()
      .references(() => interviewQuestions.id, {
        onDelete: "cascade",
        onUpdate: "no action",
      }),
    jobRoleId: varchar("job_role_id", { length: 36 })
      .notNull()
      .references(() => jobRole.id, {
        onDelete: "cascade",
        onUpdate: "no action",
      }),
  },
  (table) => {
    return {
      uniqueQuestionRole: unique().on(table.questionId, table.jobRoleId),
    };
  }
);
