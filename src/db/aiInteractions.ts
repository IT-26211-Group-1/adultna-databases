import { mysqlTable, varchar, timestamp } from "drizzle-orm/mysql-core";
import { users } from "./users";
import { features } from "./features";

export const aiInteractions = mysqlTable("ai_interactions", {
  id: varchar("id", { length: 36 }).primaryKey(),
  userId: varchar("user_id", { length: 36 }).notNull().references(() => users.id),
  featureId: varchar("feature_id", { length: 36 }).notNull().references(() => features.id),
  request: varchar("request", { length: 1000 }).notNull(),
  response: varchar("response", { length: 2000 }),
  metadata: varchar("metadata", { length: 500 }),
  createdAt: timestamp("created_at").defaultNow(),
});
