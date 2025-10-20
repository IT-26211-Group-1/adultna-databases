ALTER TABLE `interview_questions` ADD `deleted_by` varchar(36);--> statement-breakpoint
ALTER TABLE `interview_questions` ADD `deleted_at` timestamp;--> statement-breakpoint
ALTER TABLE `interview_questions` ADD CONSTRAINT `interview_questions_deleted_by_users_id_fk` FOREIGN KEY (`deleted_by`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;