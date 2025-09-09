import { mysqlTable, varchar, date, text } from "drizzle-orm/mysql-core";

export const milestones = mysqlTable("milestones", {
  id: varchar("id", { length: 36 }).primaryKey(),
  title: varchar("title", { length: 255 }).notNull(),
  description: text("description"),
  priority: varchar("priority", { length: 255 }),
  place: varchar("place", { length: 255 }),
  deadline: date("deadline"),
});
