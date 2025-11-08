import {
  mysqlTable,
  varchar,
  timestamp,
  boolean,
} from "drizzle-orm/mysql-core";
import { users } from "./users";
import { features } from "./features";

export const aiInteractions = mysqlTable("ai_interactions", {
  id: varchar("id", { length: 36 }).primaryKey(),
  userId: varchar("user_id", { length: 36 })
    .notNull()
    .references(() => users.id),
  featureId: varchar("feature_id", { length: 36 })
    .notNull()
    .references(() => features.id),
  actionType: varchar("action_type", { length: 100 }).notNull(),
  request: varchar("request", { length: 1000 }).notNull(),
  metadata: varchar("metadata", { length: 500 }),
  isAccepted: boolean("is_accepted"),
  createdAt: timestamp("created_at").defaultNow(),
});
