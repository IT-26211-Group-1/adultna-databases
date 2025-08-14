import {
  mysqlTable,
  varchar,
  boolean,
  timestamp,
} from "drizzle-orm/mysql-core";

export const users = mysqlTable("users", {
  id: varchar("id", { length: 36 }).primaryKey(),
  email: varchar("email", { length: 255 }).notNull(),
  emailVerified: boolean("email_verified").default(false),
  password: varchar("password", { length: 255 }).notNull(),
  acceptedTerms: boolean("accepted_terms").default(false),
  lastLogin: timestamp("last_login").defaultNow(),
  status: varchar("status", { length: 50 }).default("active"),
  createdAt: timestamp("created_at").defaultNow(),
  updatedAt: timestamp("updated_at").defaultNow(),
});
