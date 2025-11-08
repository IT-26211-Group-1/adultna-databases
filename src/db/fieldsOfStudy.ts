import { mysqlTable, varchar, timestamp, uniqueIndex } from "drizzle-orm/mysql-core";

export const fieldsOfStudy = mysqlTable("fields_of_study", {
  id: varchar("id", { length: 36 }).primaryKey(),
  name: varchar("name", { length: 150 }).notNull(),
  category: varchar("category", { length: 100 }),
  createdAt: timestamp("created_at").defaultNow().notNull(),
  updatedAt: timestamp("updated_at").defaultNow().notNull().onUpdateNow(),
}, (table) => ({
  nameIdx: uniqueIndex("fields_of_study_name_idx").on(table.name),
}));
