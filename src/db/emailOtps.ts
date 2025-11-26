import { mysqlTable, varchar, timestamp, int } from "drizzle-orm/mysql-core";
import { users } from "./users";

export const emailOtps = mysqlTable("email_otp", {
  id: varchar("id", { length: 36 }).primaryKey(),
  userId: varchar("user_id", { length: 36 })
    .notNull()
    .references(() => users.id),
  otp: varchar("otp", { length: 6 }).notNull(),
  attempts: int("attempts").notNull().default(0),
  createdAt: timestamp("created_at").defaultNow(),
  expiresAt: timestamp("expires_at").notNull(),
});
