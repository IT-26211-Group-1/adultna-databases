import { mysqlTable, varchar, timestamp, text, date } from "drizzle-orm/mysql-core";
import { users } from "./users";

export const resumes = mysqlTable("resumes", {
  id: varchar("id", { length: 36 }).primaryKey(),
  userId: varchar("user_id", { length: 36 })
    .notNull()
    .references(() => users.id),
  title: varchar("title", { length: 255 }).notNull(),
  templateId: varchar("template_id", { length: 50 }).notNull(),
  status: varchar("status", { length: 20 }).notNull().default("draft"),

  firstName: varchar("first_name", { length: 100 }).notNull(),
  lastName: varchar("last_name", { length: 100 }).notNull(),
  email: varchar("email", { length: 100 }).notNull(),
  phone: varchar("phone", { length: 20 }).notNull(),
  city: varchar("city", { length: 50 }),
  region: varchar("region", { length: 100 }),
  birthDate: date("birth_date"),
  linkedin: varchar("linkedin", { length: 255 }),
  portfolio: varchar("portfolio", { length: 255 }),

  summary: text("summary"),
  colorHex: varchar("color_hex", { length: 7 }),

  createdAt: timestamp("created_at").defaultNow().notNull(),
  updatedAt: timestamp("updated_at").defaultNow().notNull().onUpdateNow(),
});
