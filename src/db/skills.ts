import { mysqlTable, varchar, timestamp, uniqueIndex } from "drizzle-orm/mysql-core";

export const skills = mysqlTable("skills", {
  id: varchar("id", { length: 36 }).primaryKey(),
  name: varchar("name", { length: 100 }).notNull(),
  category: varchar("category", { length: 50 }),
  createdAt: timestamp("created_at").defaultNow().notNull(),
  updatedAt: timestamp("updated_at").defaultNow().notNull().onUpdateNow(),
}, (table) => ({
  nameIdx: uniqueIndex("skills_name_idx").on(table.name),
}));
