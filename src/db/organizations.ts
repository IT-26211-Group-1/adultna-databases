import { mysqlTable, varchar, timestamp, uniqueIndex } from "drizzle-orm/mysql-core";

export const organizations = mysqlTable("organizations", {
  id: varchar("id", { length: 36 }).primaryKey(),
  name: varchar("name", { length: 200 }).notNull(),
  website: varchar("website", { length: 255 }),
  createdAt: timestamp("created_at").defaultNow().notNull(),
  updatedAt: timestamp("updated_at").defaultNow().notNull().onUpdateNow(),
}, (table) => ({
  nameIdx: uniqueIndex("organizations_name_idx").on(table.name),
}));
