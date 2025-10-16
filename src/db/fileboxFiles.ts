import {
  mysqlTable,
  varchar,
  timestamp,
  bigint,
  int,
} from "drizzle-orm/mysql-core";

export const fileboxFiles = mysqlTable("filebox_files", {
  id: varchar("id", { length: 36 }).primaryKey(),
  userId: varchar("user_id", { length: 36 }).notNull(),
  fileName: varchar("file_name", { length: 255 }).notNull(),
  fileKey: varchar("file_key", { length: 512 }).notNull(),
  category: varchar("category", { length: 50 }).notNull(),
  contentType: varchar("content_type", { length: 100 }).notNull(),
  fileSize: bigint("file_size", { mode: "number" }).notNull(),
  uploadDate: timestamp("upload_date").defaultNow().notNull(),
  lastModified: timestamp("last_modified").defaultNow().notNull(),
  version: int("version").default(1),
});
