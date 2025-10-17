import {
  mysqlTable,
  varchar,
  timestamp,
  bigint,
  int,
} from "drizzle-orm/mysql-core";
import { fileboxFolders } from "./fileboxFolders";

export const uploadedFiles = mysqlTable("uploaded_files", {
  id: varchar("id", { length: 36 }).primaryKey(),
  folderId: varchar("folder_id", { length: 36 })
    .notNull()
    .references(() => fileboxFolders.id),
  sourceId: varchar("source_id", { length: 36 }).notNull(),
  fileName: varchar("file_name", { length: 512 }).notNull(),
  s3Url: varchar("s3_url", { length: 1024 }).notNull(),
  mimeType: varchar("mime_type", { length: 100 }).notNull(),
  fileSize: bigint("file_size", { mode: "number" }),
  uploadedAt: timestamp("uploaded_at").defaultNow().notNull(),
  version: int("version").default(1),
});
