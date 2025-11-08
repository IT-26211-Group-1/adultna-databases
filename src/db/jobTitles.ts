import { mysqlTable, varchar, timestamp, uniqueIndex } from "drizzle-orm/mysql-core";

export const jobTitles = mysqlTable("job_titles", {
  id: varchar("id", { length: 36 }).primaryKey(),
  title: varchar("title", { length: 150 }).notNull(),
  category: varchar("category", { length: 100 }),
  createdAt: timestamp("created_at").defaultNow().notNull(),
  updatedAt: timestamp("updated_at").defaultNow().notNull().onUpdateNow(),
}, (table) => ({
  titleIdx: uniqueIndex("job_titles_title_idx").on(table.title),
}));
