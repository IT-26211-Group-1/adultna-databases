import { mysqlTable, varchar } from "drizzle-orm/mysql-core";

export const features = mysqlTable("features", {
  id: varchar("id", { length: 36 }).primaryKey(),
  name: varchar("name", {
    length: 255,
    enum: [
      "govmap",
      "filebox",
      "process_guides",
      "ai_gabay_agent",
      "mock_interview_coach",
    ],
  }).notNull(),
});
