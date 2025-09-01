import { mysqlTable, varchar, timestamp } from "drizzle-orm/mysql-core";
import { users } from "./users";

export const governmentProcessGuides = mysqlTable("government_process_guides", {
  id: varchar("id", { length: 36 }).primaryKey(),
  agency: varchar("agency", { length: 255 }).notNull(),
  title: varchar("title", { length: 255 }).notNull(),
  description: varchar("description", { length: 1000 }),
  updatedBy: varchar("updated_by", { length: 36 }).references(() => users.id), //Not sure if this is final
  createdAt: timestamp("created_at").defaultNow().notNull(),
  updatedAt: timestamp("updated_at").defaultNow().onUpdateNow().notNull(),
});
