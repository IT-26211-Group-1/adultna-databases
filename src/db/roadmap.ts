import { mysqlTable, varchar, date, text } from "drizzle-orm/mysql-core";
import { users } from "./users";
import { milestones } from "./milestones";

export const roadmap = mysqlTable("roadmap", {
  userId: varchar("user_id", { length: 36 }).references(() => users.id),
  milestoneId: varchar("milestone_id", { length: 36 }).references(
    () => milestones.id
  ),
  dateAchieved: date("date_achieved"),
});
