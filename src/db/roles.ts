import { mysqlTable, serial, mysqlEnum } from "drizzle-orm/mysql-core";

export const roles = mysqlTable("roles", {
  id: serial("role_id").primaryKey(),
  roleName: mysqlEnum("role_name", [
    "user",
    "technical_admin",
    "verifier_admin",
  ]).default("user"),
});
