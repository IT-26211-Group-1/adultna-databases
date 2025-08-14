import { mysqlTable, varchar, int } from "drizzle-orm/mysql-core";
import { roles } from "./roles";
import { users } from "./users";

export const userRoles = mysqlTable(
  "user_roles",
  {
    userId: varchar("user_id", { length: 36 }).notNull(),
    roleId: int("role_id").notNull(),
  },
  (table) => ({
    primaryKey: [table.userId, table.roleId],
    foreignKeys: [
      { columns: [table.userId], references: [users.id] },
      { columns: [table.roleId], references: [roles.id] },
    ],
  })
);
