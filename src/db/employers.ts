import { mysqlTable, varchar, text, timestamp, uniqueIndex } from "drizzle-orm/mysql-core";

export const employers = mysqlTable("employers", {
  id: varchar("id", { length: 36 }).primaryKey(),
  name: varchar("name", { length: 200 }).notNull(),
  industry: varchar("industry", { length: 100 }),
  website: varchar("website", { length: 255 }),
  description: text("description"),
  createdAt: timestamp("created_at").defaultNow().notNull(),
  updatedAt: timestamp("updated_at").defaultNow().notNull().onUpdateNow(),
}, (table) => ({
  nameIdx: uniqueIndex("employers_name_idx").on(table.name),
}));
