CREATE TABLE `user_streaks` (
	`user_id` varchar(36) NOT NULL,
	`current_streak` int NOT NULL DEFAULT 0,
	`last_streak_date` timestamp,
	`longest_streak` int NOT NULL DEFAULT 0,
	`created_at` timestamp DEFAULT (now()),
	`updated_at` timestamp DEFAULT (now()) ON UPDATE CURRENT_TIMESTAMP,
	CONSTRAINT `user_streaks_user_id` PRIMARY KEY(`user_id`)
);
--> statement-breakpoint
ALTER TABLE `user_streaks` ADD CONSTRAINT `user_streaks_user_id_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;