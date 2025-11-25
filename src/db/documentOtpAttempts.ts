import { mysqlTable, varchar, timestamp, int } from "drizzle-orm/mysql-core";
import { users } from "./users";
import { uploadedFiles } from "./uploadedFiles";

export const documentOtpAttempts = mysqlTable("document_otp_attempts", {
  id: varchar("id", { length: 36 }).primaryKey(),
  userId: varchar("user_id", { length: 36 })
    .notNull()
    .references(() => users.id, { onDelete: "cascade" }),
  fileId: varchar("file_id", { length: 36 })
    .notNull()
    .references(() => uploadedFiles.id, { onDelete: "cascade" }),
  action: varchar("action", { length: 20 }).notNull(),
  attempts: int("attempts").notNull().default(0),
  lastAttemptAt: timestamp("last_attempt_at").notNull(),
  lockedUntil: timestamp("locked_until"),
});
