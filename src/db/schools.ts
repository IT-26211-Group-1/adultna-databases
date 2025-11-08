import { mysqlTable, varchar, timestamp, uniqueIndex } from "drizzle-orm/mysql-core";

export const schools = mysqlTable("schools", {
  id: varchar("id", { length: 36 }).primaryKey(),
  name: varchar("name", { length: 200 }).notNull(),
  location: varchar("location", { length: 200 }),
  type: varchar("type", { length: 50 }),
  createdAt: timestamp("created_at").defaultNow().notNull(),
  updatedAt: timestamp("updated_at").defaultNow().notNull().onUpdateNow(),
}, (table) => ({
  nameLocationIdx: uniqueIndex("schools_name_location_idx").on(table.name, table.location),
}));
