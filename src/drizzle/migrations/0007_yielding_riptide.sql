CREATE TABLE `reviews` (
	`id` serial AUTO_INCREMENT NOT NULL,
	`question_id` int NOT NULL,
	`reviewer_id` varchar(36) NOT NULL,
	`status` enum('pending','accepted','rejected','to_revise') NOT NULL,
	`reason` text,
	`created_at` timestamp DEFAULT (now()),
	CONSTRAINT `reviews_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
ALTER TABLE `answer_options` MODIFY COLUMN `updated_at` timestamp DEFAULT (now()) ON UPDATE CURRENT_TIMESTAMP;--> statement-breakpoint
ALTER TABLE `filebox_folders` MODIFY COLUMN `updated_at` timestamp NOT NULL DEFAULT (now()) ON UPDATE CURRENT_TIMESTAMP;--> statement-breakpoint
ALTER TABLE `milestones` MODIFY COLUMN `updated_at` timestamp DEFAULT (now()) ON UPDATE CURRENT_TIMESTAMP;--> statement-breakpoint
ALTER TABLE `onboarding_questions` MODIFY COLUMN `updated_at` timestamp DEFAULT (now()) ON UPDATE CURRENT_TIMESTAMP;--> statement-breakpoint
ALTER TABLE `outcome_tag` MODIFY COLUMN `updated_at` timestamp DEFAULT (now()) ON UPDATE CURRENT_TIMESTAMP;--> statement-breakpoint
ALTER TABLE `reports` MODIFY COLUMN `updated_at` timestamp DEFAULT (now()) ON UPDATE CURRENT_TIMESTAMP;--> statement-breakpoint
ALTER TABLE `resumes` MODIFY COLUMN `updated_at` timestamp NOT NULL DEFAULT (now()) ON UPDATE CURRENT_TIMESTAMP;--> statement-breakpoint
ALTER TABLE `users` MODIFY COLUMN `updated_at` timestamp DEFAULT (now()) ON UPDATE CURRENT_TIMESTAMP;--> statement-breakpoint
ALTER TABLE `onboarding_questions` ADD `status` enum('pending','accepted','rejected','to_revise') DEFAULT 'pending' NOT NULL;--> statement-breakpoint
ALTER TABLE `reviews` ADD CONSTRAINT `reviews_question_id_onboarding_questions_id_fk` FOREIGN KEY (`question_id`) REFERENCES `onboarding_questions`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `reviews` ADD CONSTRAINT `reviews_reviewer_id_users_id_fk` FOREIGN KEY (`reviewer_id`) REFERENCES `users`(`id`) ON DELETE cascade ON UPDATE no action;