import { mysqlTable, varchar, serial } from "drizzle-orm/mysql-core";

export const roles = mysqlTable("roles", {
  id: serial("role_id").primaryKey(),
  roleName: varchar("role_name", { length: 50 }).notNull().unique(),
});
