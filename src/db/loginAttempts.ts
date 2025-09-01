import { mysqlTable, varchar, timestamp } from "drizzle-orm/mysql-core";
import { users } from "./users";

export const loginAttempts = mysqlTable("login_attempts", {
  id: varchar("id", { length: 36 }).primaryKey(),
  userId: varchar("user_id", { length: 36 }).references(() => users.id),
  inputEmail: varchar("input_email", { length: 255 }).notNull(),
  status: varchar("status", { length: 50 }).notNull(), //Not sure what to use here
  loginMethod: varchar("login_method", { length: 50 }), //Not sure what to use here
  attemptedAt: timestamp("attempted_at").defaultNow(),
});
