import { mysqlTable, varchar, timestamp } from "drizzle-orm/mysql-core";
import { coverLetters } from "./coverLetters";

export const coverLetterSuggestions = mysqlTable("cover_letter_suggestions", {
  id: varchar("id", { length: 36 }).primaryKey(),
  coverLetterId: varchar("cover_letter_id", { length: 36 }).notNull().references(() => coverLetters.id),
  suggestedContent: varchar("suggested_content", { length: 2000 }),
  modelUsed: varchar("model_used", { length: 255 }).notNull(),
  generatedAt: timestamp("generated_at").defaultNow().notNull(),
});
