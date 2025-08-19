import { mysqlTable, varchar } from "drizzle-orm/mysql-core";

export const userProfile = mysqlTable("user_profile", {
  id: varchar("id", { length: 36 }).primaryKey(),
  userId: varchar("user_id", { length: 36 }).notNull(),
  firstName: varchar("first_name", { length: 100 }).notNull(),
  lastName: varchar("last_name", { length: 100 }).notNull(),
  displayName: varchar("display_name", { length: 100 }).unique(),
  lifeStage: varchar("life_stage", { length: 100 }),
});
