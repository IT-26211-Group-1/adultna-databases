import { mysqlTable, varchar, text, int, timestamp, mysqlEnum } from "drizzle-orm/mysql-core";
import { coverLetters } from "./coverLetters";

export const coverLetterSections = mysqlTable("cover_letter_sections", {
  id: varchar("id", { length: 36 }).primaryKey(),
  coverLetterId: varchar("cover_letter_id", { length: 36 })
    .notNull()
    .references(() => coverLetters.id, { onDelete: "cascade" }),
  sectionType: mysqlEnum("section_type", ["intro", "body", "conclusion", "signature"]).notNull(),
  content: text("content"),
  order: int("order").notNull().default(0),
  createdAt: timestamp("created_at").defaultNow().notNull(),
});
