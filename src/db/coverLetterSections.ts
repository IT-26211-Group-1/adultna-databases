import { mysqlTable, varchar, text, int, timestamp } from "drizzle-orm/mysql-core";
import { coverLetters } from "./coverLetters";

export const coverLetterSections = mysqlTable("cover_letter_sections", {
  id: varchar("id", { length: 36 }).primaryKey(),
  coverLetterId: varchar("cover_letter_id", { length: 36 })
    .notNull()
    .references(() => coverLetters.id, { onDelete: "cascade" }),
  sectionType: varchar("section_type", { length: 50 }).notNull(),
  content: text("content"),
  order: int("order").notNull().default(0),
  createdAt: timestamp("created_at").defaultNow().notNull(),
});
