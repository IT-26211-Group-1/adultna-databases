import {
  mysqlTable,
  varchar,
  int,
  boolean,
  timestamp,
} from "drizzle-orm/mysql-core";
import { milestones } from "./milestones";

export const milestoneTasks = mysqlTable("milestone_tasks", {
  id: varchar("id", { length: 36 }).primaryKey(),
  milestoneId: varchar("milestone_id", { length: 36 })
    .notNull()
    .references(() => milestones.id, {
      onDelete: "cascade",
      onUpdate: "cascade",
    }),
  title: varchar("title", { length: 255 }).notNull(),
  displayOrder: int("display_order").notNull(),
  isCompleted: boolean("is_completed").notNull().default(false),
  createdAt: timestamp("created_at").defaultNow(),
  updatedAt: timestamp("updated_at").defaultNow().onUpdateNow(),
  completedAt: timestamp("completed_at"),
});
