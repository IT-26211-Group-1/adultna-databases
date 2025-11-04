CREATE TABLE `interview_results` (
	`id` varchar(36) NOT NULL,
	`user_id` varchar(36) NOT NULL,
	`session_id` varchar(36) NOT NULL,
	`status` enum('pending','processing','completed','failed') NOT NULL DEFAULT 'pending',
	`total_answers` int NOT NULL DEFAULT 0,
	`processed_answers` int NOT NULL DEFAULT 0,
	`failed_answers` int NOT NULL DEFAULT 0,
	`results` json,
	`created_at` timestamp NOT NULL DEFAULT (now()),
	`updated_at` timestamp NOT NULL DEFAULT (now()),
	`completed_at` timestamp,
	CONSTRAINT `interview_results_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
ALTER TABLE `interview_results` ADD CONSTRAINT `interview_results_user_id_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;