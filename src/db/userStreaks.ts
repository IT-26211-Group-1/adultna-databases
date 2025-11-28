import { mysqlTable, varchar, int, timestamp } from "drizzle-orm/mysql-core";
import { users } from "./users";

export const userStreaks = mysqlTable("user_streaks", {
  userId: varchar("user_id", { length: 36 })
    .primaryKey()
    .references(() => users.id),
  currentStreak: int("current_streak").notNull().default(0),
  lastStreakDate: timestamp("last_streak_date"),
  longestStreak: int("longest_streak").notNull().default(0),
  createdAt: timestamp("created_at").defaultNow(),
  updatedAt: timestamp("updated_at").defaultNow().onUpdateNow(),
});
