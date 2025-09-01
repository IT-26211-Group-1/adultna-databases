import { mysqlTable, serial, varchar } from "drizzle-orm/mysql-core";

export const outcomeTag = mysqlTable("outcome_tag", {
  id: serial("tag_id").primaryKey(),
  tag: varchar("tag", { length: 100 }).notNull(),
});
