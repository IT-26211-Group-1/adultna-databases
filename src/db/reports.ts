import { mysqlTable, varchar, timestamp } from "drizzle-orm/mysql-core";
import { users } from "./users";
import { reportStatus } from "./reportStatus";
import { features } from "./features";

export const reports = mysqlTable("reports", {
  id: varchar("id", { length: 36 }).primaryKey(),
  userId: varchar("user_id", { length: 36 })
    .notNull()
    .references(() => users.id),
  statusId: varchar("status_id", { length: 36 })
    .notNull()
    .references(() => reportStatus.id),
  featureId: varchar("feature_id", { length: 36 })
    .notNull()
    .references(() => features.id),
  title: varchar("title", { length: 255 }).notNull(),
  description: varchar("description", { length: 1000 }),
  type: varchar("type", { length: 100 }),
  createdAt: timestamp("created_at").defaultNow(),
  updatedAt: timestamp("updated_at").defaultNow().onUpdateNow(),
});
