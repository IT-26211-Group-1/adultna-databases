import { mysqlTable, varchar, mysqlEnum } from "drizzle-orm/mysql-core";

export const userProfile = mysqlTable("user_profile", {
  id: varchar("id", { length: 36 }).primaryKey(),
  userId: varchar("user_id", { length: 36 }).notNull(),
  firstName: varchar("first_name", { length: 100 }).notNull(),
  lastName: varchar("last_name", { length: 100 }).notNull(),
  displayName: varchar("display_name", { length: 100 }),
  profilePictureUrl: varchar("profile_picture_url", { length: 500 }),
  lifeStage: varchar("life_stage", { length: 100 }),
  onboardingStatus: mysqlEnum("onboarding_status", [
    "not_started",
    "in_progress",
    "completed",
  ]).default("not_started"),
});
