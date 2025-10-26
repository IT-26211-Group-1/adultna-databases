DROP TABLE `messages`;--> statement-breakpoint
ALTER TABLE `conversations` DROP FOREIGN KEY `conversations_user_id_users_id_fk`;
--> statement-breakpoint
DROP INDEX `user_id_idx` ON `conversations`;--> statement-breakpoint
DROP INDEX `user_id_deleted_at_idx` ON `conversations`;--> statement-breakpoint
DROP INDEX `last_activity_idx` ON `conversations`;--> statement-breakpoint
ALTER TABLE `conversations` MODIFY COLUMN `id` serial AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `conversations` MODIFY COLUMN `user_id` varchar(255) NOT NULL;--> statement-breakpoint
ALTER TABLE `conversations` ADD `session_id` varchar(255) NOT NULL;--> statement-breakpoint
ALTER TABLE `conversations` ADD `s3_key` varchar(512) NOT NULL;--> statement-breakpoint
ALTER TABLE `conversations` ADD `started_at` timestamp DEFAULT (now()) NOT NULL;--> statement-breakpoint
ALTER TABLE `conversations` ADD `ended_at` timestamp;--> statement-breakpoint
ALTER TABLE `conversations` ADD `topic` varchar(255);--> statement-breakpoint
ALTER TABLE `conversations` ADD CONSTRAINT `conversations_session_id_unique` UNIQUE(`session_id`);--> statement-breakpoint
ALTER TABLE `conversations` DROP COLUMN `title`;--> statement-breakpoint
ALTER TABLE `conversations` DROP COLUMN `last_activity_at`;--> statement-breakpoint
ALTER TABLE `conversations` DROP COLUMN `created_at`;--> statement-breakpoint
ALTER TABLE `conversations` DROP COLUMN `updated_at`;--> statement-breakpoint
ALTER TABLE `conversations` DROP COLUMN `deleted_at`;