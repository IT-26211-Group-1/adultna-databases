import { mysqlTable, varchar } from "drizzle-orm/mysql-core";

export const jobRole = mysqlTable("job_role", {
  id: varchar("id", { length: 36 }).primaryKey(),
  title: varchar("title", { length: 255 }).notNull(),
});
