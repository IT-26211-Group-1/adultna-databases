import { mysqlTable, varchar, timestamp, boolean } from "drizzle-orm/mysql-core";
import { resumeEntries } from "./resumeEntries";

export const resumeSuggestions = mysqlTable("resume_suggestions", {
  id: varchar("id", { length: 36 }).primaryKey(),
  entryId: varchar("entry_id", { length: 36 }).notNull().references(() => resumeEntries.id),
  suggestedContent: varchar("suggested_content", { length: 2000 }),
  isAccepted: boolean("is_accepted").default(false).notNull(),
  generatedAt: timestamp("generated_at").defaultNow().notNull(),
});
