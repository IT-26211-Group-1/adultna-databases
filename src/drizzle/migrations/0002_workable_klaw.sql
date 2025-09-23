ALTER TABLE `roles` DROP INDEX `roles_role_name_unique`;--> statement-breakpoint
ALTER TABLE `user_profile` DROP INDEX `user_profile_display_name_unique`;--> statement-breakpoint
ALTER TABLE `roles` MODIFY COLUMN `role_name` enum('user','technical_admin','verifier_admin');--> statement-breakpoint
ALTER TABLE `user_profile` ADD `onboarding_status` enum('not_started','in_progress','completed') DEFAULT 'not_started';