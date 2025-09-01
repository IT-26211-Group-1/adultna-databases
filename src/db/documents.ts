import { mysqlTable, varchar } from "drizzle-orm/mysql-core";
import { users } from "./users";
import { uploadedFiles } from "./uploadedFiles";

export const documents = mysqlTable("documents", {
  id: varchar("id", { length: 36 }).primaryKey(),
  userId: varchar("user_id", { length: 36 }).notNull().references(() => users.id),
  fileId: varchar("file_id", { length: 36 }).notNull().references(() => uploadedFiles.id),
  documentType: varchar("document_type", { length: 100 }),
});
