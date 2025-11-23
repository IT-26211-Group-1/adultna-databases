RENAME TABLE `ai_interactions` TO `notifications`;--> statement-breakpoint
ALTER TABLE `notifications` RENAME COLUMN `feature_id` TO `title`;--> statement-breakpoint
ALTER TABLE `notifications` RENAME COLUMN `action_type` TO `message`;--> statement-breakpoint
ALTER TABLE `notifications` RENAME COLUMN `request` TO `type`;--> statement-breakpoint
ALTER TABLE `notifications` RENAME COLUMN `metadata` TO `is_read`;--> statement-breakpoint
ALTER TABLE `notifications` DROP FOREIGN KEY `ai_interactions_user_id_users_id_fk`;
--> statement-breakpoint
ALTER TABLE `notifications` DROP FOREIGN KEY `ai_interactions_feature_id_features_id_fk`;
--> statement-breakpoint
ALTER TABLE `notifications` DROP PRIMARY KEY;--> statement-breakpoint
ALTER TABLE `notifications` MODIFY COLUMN `title` varchar(255) NOT NULL;--> statement-breakpoint
ALTER TABLE `notifications` MODIFY COLUMN `message` text NOT NULL;--> statement-breakpoint
ALTER TABLE `notifications` MODIFY COLUMN `type` varchar(50) NOT NULL;--> statement-breakpoint
ALTER TABLE `notifications` MODIFY COLUMN `is_read` boolean NOT NULL;--> statement-breakpoint
ALTER TABLE `notifications` MODIFY COLUMN `is_read` boolean NOT NULL DEFAULT false;--> statement-breakpoint
ALTER TABLE `notifications` MODIFY COLUMN `created_at` timestamp NOT NULL DEFAULT (now());--> statement-breakpoint
ALTER TABLE `notifications` ADD PRIMARY KEY(`id`);--> statement-breakpoint
ALTER TABLE `notifications` ADD CONSTRAINT `notifications_user_id_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE cascade ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `notifications` DROP COLUMN `is_accepted`;