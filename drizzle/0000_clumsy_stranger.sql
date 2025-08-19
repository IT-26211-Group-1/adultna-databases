CREATE TABLE `email_verification` (
	`id` varchar(36) NOT NULL,
	`user_id` varchar(36) NOT NULL,
	`token` varchar(255) NOT NULL,
	`created_at` timestamp DEFAULT (now()),
	`expires_at` timestamp NOT NULL,
	CONSTRAINT `email_verification_id` PRIMARY KEY(`id`),
	CONSTRAINT `email_verification_token_unique` UNIQUE(`token`)
);
--> statement-breakpoint
CREATE TABLE `roles` (
	`role_id` serial AUTO_INCREMENT NOT NULL,
	`role_name` varchar(50) NOT NULL,
	CONSTRAINT `roles_role_id` PRIMARY KEY(`role_id`),
	CONSTRAINT `roles_role_name_unique` UNIQUE(`role_name`)
);
--> statement-breakpoint
CREATE TABLE `user_profile` (
	`id` varchar(36) NOT NULL,
	`user_id` varchar(36) NOT NULL,
	`first_name` varchar(100) NOT NULL,
	`last_name` varchar(100) NOT NULL,
	`display_name` varchar(100),
	`life_stage` varchar(100),
	CONSTRAINT `user_profile_id` PRIMARY KEY(`id`),
	CONSTRAINT `user_profile_display_name_unique` UNIQUE(`display_name`)
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
	CONSTRAINT `users_id` PRIMARY KEY(`id`),
	CONSTRAINT `users_id_unique` UNIQUE(`id`),
	CONSTRAINT `users_email_unique` UNIQUE(`email`)
);
--> statement-breakpoint
ALTER TABLE `email_verification` ADD CONSTRAINT `email_verification_user_id_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;