import { mysqlTable, varchar, timestamp } from "drizzle-orm/mysql-core";
import { fileboxFolders } from "./fileboxFolders";
import { documentSources } from "./documentSources";


export const uploadedFiles = mysqlTable("uploaded_files", {
  id: varchar("id", { length: 36 }).primaryKey(),
  folderId: varchar("folder_id", { length: 36 }).notNull().references(() => fileboxFolders.id),
  sourceId: varchar("source_id", { length: 36 }).notNull().references(() => documentSources.id),
  fileName: varchar("file_name", { length: 255 }).notNull(),
  s3Url: varchar("s3_url", { length: 255 }).notNull(),
  mimeType: varchar("mime_type", { length: 100 }).notNull(),
  uploadedAt: timestamp("uploaded_at").defaultNow().notNull(),
});
