import { mysqlTable, varchar, timestamp, mysqlEnum } from "drizzle-orm/mysql-core";
import { users } from "./users";
import { uploadedFiles } from "./uploadedFiles";


export const documentOtps = mysqlTable("document_otp", {
  id: varchar("id", { length: 36 }).primaryKey(),
  userId: varchar("user_id", { length: 36 })
    .notNull()
    .references(() => users.id, { onDelete: "cascade" }),
  fileId: varchar("file_id", { length: 36 })
    .notNull()
    .references(() => uploadedFiles.id, { onDelete: "cascade" }),
  otp: varchar("otp", { length: 6 }).notNull(),
  action: mysqlEnum("action", ["preview", "download", "delete"]).notNull().default("download"),
  createdAt: timestamp("created_at").defaultNow().notNull(),
  expiresAt: timestamp("expires_at").notNull(),
});