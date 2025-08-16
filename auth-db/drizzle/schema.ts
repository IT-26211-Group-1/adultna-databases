import { mysqlTable, mysqlSchema, AnyMySqlColumn, primaryKey, unique, serial, varchar, int, timestamp } from "drizzle-orm/mysql-core"
import { sql } from "drizzle-orm"

export const roles = mysqlTable("roles", {
	roleId: serial("role_id").notNull(),
	roleName: varchar("role_name", { length: 50 }).notNull(),
},
(table) => [
	primaryKey({ columns: [table.roleId], name: "roles_role_id"}),
	unique("role_id").on(table.roleId),
	unique("roles_role_name_unique").on(table.roleName),
]);

export const userProfile = mysqlTable("user_profile", {
	id: varchar({ length: 36 }).notNull(),
	userId: varchar("user_id", { length: 36 }).notNull(),
	firstName: varchar("first_name", { length: 100 }).notNull(),
	lastName: varchar("last_name", { length: 100 }).notNull(),
	displayName: varchar("display_name", { length: 100 }),
	lifeStage: varchar("life_stage", { length: 100 }),
},
(table) => [
	primaryKey({ columns: [table.id], name: "user_profile_id"}),
	unique("user_profile_display_name_unique").on(table.displayName),
]);

export const userRoles = mysqlTable("user_roles", {
	userId: varchar("user_id", { length: 36 }).notNull(),
	roleId: int("role_id").notNull(),
});

export const users = mysqlTable("users", {
	id: varchar({ length: 36 }).notNull(),
	email: varchar({ length: 255 }).notNull(),
	emailVerified: tinyint("email_verified").default(0),
	password: varchar({ length: 255 }).notNull(),
	acceptedTerms: tinyint("accepted_terms").default(0),
	lastLogin: timestamp("last_login", { mode: 'string' }).default(sql`(now())`),
	status: varchar({ length: 50 }).default('active'),
	createdAt: timestamp("created_at", { mode: 'string' }).default(sql`(now())`),
	updatedAt: timestamp("updated_at", { mode: 'string' }).default(sql`(now())`),
},
(table) => [
	primaryKey({ columns: [table.id], name: "users_id"}),
	unique("users_email_unique").on(table.email),
	unique("users_id_unique").on(table.id),
]);
