import { mysqlTable, serial, varchar, timestamp } from "drizzle-orm/mysql-core";

export const outcomeTag = mysqlTable("outcome_tag", {
  tag_id: serial("tag_id").primaryKey(),
  name: varchar("name", { length: 255 }).notNull(),
  createdAt: timestamp("created_at").defaultNow(),
  updatedAt: timestamp("updated_at").defaultNow(),
});
