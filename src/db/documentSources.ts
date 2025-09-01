import { mysqlTable, varchar } from "drizzle-orm/mysql-core";
import { uploadedFiles } from "./uploadedFiles";

export const documentSources = mysqlTable("document_sources", {
  id: varchar("id", { length: 36 }).primaryKey(),
  fileId: varchar("file_id", { length: 36 }).notNull().references(() => uploadedFiles.id), 
  sourceType: varchar("source_type", { length: 100 }).notNull(),
  entityId: varchar("entity_id", { length: 36 }).notNull(),
});
