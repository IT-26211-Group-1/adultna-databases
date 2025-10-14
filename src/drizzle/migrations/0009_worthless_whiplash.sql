ALTER TABLE `onboarding_questions` ADD `created_by` varchar(36);--> statement-breakpoint
ALTER TABLE `onboarding_questions` ADD `updated_by` varchar(36);--> statement-breakpoint
ALTER TABLE `onboarding_questions` ADD `deleted_by` varchar(36);--> statement-breakpoint
ALTER TABLE `onboarding_questions` ADD `deleted_at` timestamp;--> statement-breakpoint
ALTER TABLE `onboarding_questions` ADD CONSTRAINT `onboarding_questions_created_by_users_id_fk` FOREIGN KEY (`created_by`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `onboarding_questions` ADD CONSTRAINT `onboarding_questions_updated_by_users_id_fk` FOREIGN KEY (`updated_by`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `onboarding_questions` ADD CONSTRAINT `onboarding_questions_deleted_by_users_id_fk` FOREIGN KEY (`deleted_by`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;