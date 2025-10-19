import {
  mysqlTable,
  varchar,
  timestamp,
  text,
  json,
  int,
  mysqlEnum,
} from "drizzle-orm/mysql-core";
import { users } from "./users";

export const governmentProcessGuides = mysqlTable("government_process_guides", {
  id: varchar("id", { length: 36 }).primaryKey(),
  title: varchar("title", { length: 255 }).notNull(),
  slug: varchar("slug", { length: 255 }).notNull().unique(),
  category: mysqlEnum("category", [
    "identification",
    "civil-registration",
    "permits-licenses",
    "social-services",
    "tax-related",
    "legal",
    "other",
  ]).notNull(),
  description: text("description").notNull(),
  keywords: json("keywords").$type<string[]>().notNull(),
  steps: json("steps").notNull(), // ProcessStep[]
  requirements: json("requirements").notNull(), // DocumentRequirement[]
  processingTime: varchar("processing_time", { length: 100 }).notNull(),

  // Office information
  offices: json("offices").notNull(),
  status: mysqlEnum("status", ["pending", "accepted", "rejected", "to_revise"])
    .notNull()
    .default("pending"),
  createdBy: varchar("created_by", { length: 36 })
    .notNull()
    .references(() => users.id),
  verifiedBy: varchar("verified_by", { length: 36 }).references(() => users.id),
  rejectionReason: text("rejection_reason"),

  // Metadata
  createdAt: timestamp("created_at").defaultNow().notNull(),
  updatedAt: timestamp("updated_at").defaultNow().onUpdateNow().notNull(),
  updatedBy: varchar("updated_by", { length: 36 }).references(() => users.id),
  deletedAt: timestamp("deleted_at"),
  deletedBy: varchar("deleted_by", { length: 36 }).references(() => users.id),
});
