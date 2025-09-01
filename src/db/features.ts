import { mysqlTable, varchar } from "drizzle-orm/mysql-core";

export const features = mysqlTable("features", {
  id: varchar("id", { length: 36 }).primaryKey(),
  name: varchar("name", { length: 100 }).notNull(),
});
