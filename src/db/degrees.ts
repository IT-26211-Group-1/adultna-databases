import { mysqlTable, varchar, timestamp, uniqueIndex } from "drizzle-orm/mysql-core";

export const degrees = mysqlTable("degrees", {
  id: varchar("id", { length: 36 }).primaryKey(),
  name: varchar("name", { length: 150 }).notNull(),
  level: varchar("level", { length: 50 }),
  createdAt: timestamp("created_at").defaultNow().notNull(),
  updatedAt: timestamp("updated_at").defaultNow().notNull().onUpdateNow(),
}, (table) => ({
  nameIdx: uniqueIndex("degrees_name_idx").on(table.name),
}));
