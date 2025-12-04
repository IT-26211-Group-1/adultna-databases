import { mysqlTable, varchar, timestamp } from "drizzle-orm/mysql-core";

import { users } from "./users";

import { documentSources } from "./documentSources";

export const auditLogs = mysqlTable("audit_logs", {
  id: varchar("id", { length: 36 }).primaryKey(),

  userId: varchar("user_id", { length: 36 }).references(() => users.id),

  sourceId: varchar("source_id", { length: 36 }).references(
    () => documentSources.id
  ),

  action: varchar("action", { length: 255 }).notNull(),

  module: varchar("module", { length: 100 }),

  timestamp: timestamp("timestamp").defaultNow().notNull(),
});
