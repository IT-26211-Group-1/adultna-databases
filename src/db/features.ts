import { mysqlTable, varchar } from "drizzle-orm/mysql-core";

export const features = mysqlTable("features", {
  id: varchar("id", { length: 36 }).primaryKey(),
  name: varchar("name", {
    length: 255,
    enum: [
      "dashboard",
      "roadmap",
      "ai_gabay_agent",
      "gov_guides",
      "filebox",
      "resume_builder",
      "cover_letter",
      "mock_interview_coach",
      "job_board",
      "profile",
      "general",
    ],
  }).notNull(),
  description: varchar("description", { length: 255 }),
});
