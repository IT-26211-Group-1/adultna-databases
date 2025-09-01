import { mysqlTable, varchar } from "drizzle-orm/mysql-core";
import { governmentProcessGuides } from "./governmentProcessGuides";

export const governmentRequirements = mysqlTable("government_requirements", {
  id: varchar("id", { length: 36 }).primaryKey(),
  guideId: varchar("guide_id", { length: 36 }).notNull().references(() => governmentProcessGuides.id),
  requirements: varchar("requirements", { length: 255 }).notNull(),
});
