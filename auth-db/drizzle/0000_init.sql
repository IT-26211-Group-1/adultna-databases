CREATE TABLE `roles` (
	`role_id` serial AUTO_INCREMENT NOT NULL,
	`role_name` varchar(50) NOT NULL,
	CONSTRAINT `roles_role_id` PRIMARY KEY(`role_id`)
);
--> statement-breakpoint
CREATE TABLE `user_profile` (
	`id` varchar(36) NOT NULL,
	`user_id` varchar(36) NOT NULL,
	`first_name` varchar(100) NOT NULL,
	`last_name` varchar(100) NOT NULL,
	`display_name` varchar(100),
	`life_stage` varchar(100),
	CONSTRAINT `user_profile_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `user_roles` (
	`user_id` varchar(36) NOT NULL,
	`role_id` int NOT NULL
);
--> statement-breakpoint
CREATE TABLE `users` (
	`id` varchar(36) NOT NULL,
	`email` varchar(255) NOT NULL,
	`email_verified` boolean DEFAULT false,
	`password` varchar(255) NOT NULL,
	`accepted_terms` boolean DEFAULT false,
	`last_login` timestamp DEFAULT (now()),
	`status` varchar(50) DEFAULT 'active',
	`created_at` timestamp DEFAULT (now()),
	`updated_at` timestamp DEFAULT (now()),
	CONSTRAINT `users_id` PRIMARY KEY(`id`)
);
