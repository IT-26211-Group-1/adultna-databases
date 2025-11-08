import { mysqlTable, varchar, timestamp, text } from "drizzle-orm/mysql-core";
import { users } from "./users";

export const resumes = mysqlTable("resumes", {
  id: varchar("id", { length: 36 }).primaryKey(),
  userId: varchar("user_id", { length: 36 })
    .notNull()
    .references(() => users.id),
  title: varchar("title", { length: 255 }).notNull(),
  templateId: varchar("template_id", { length: 50 }).notNull(),
  status: varchar("status", { length: 20 }).notNull().default("draft"),
  summary: text("summary"),
  colorHex: varchar("color_hex", { length: 7 }),
  createdAt: timestamp("created_at").defaultNow().notNull(),
  updatedAt: timestamp("updated_at").defaultNow().notNull().onUpdateNow(),
});
