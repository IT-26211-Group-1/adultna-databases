CREATE TABLE `conversations` (
	`id` varchar(36) NOT NULL,
	`user_id` varchar(36) NOT NULL,
	`title` varchar(255),
	`message_count` int NOT NULL DEFAULT 0,
	`last_activity_at` timestamp NOT NULL DEFAULT (now()),
	`created_at` timestamp NOT NULL DEFAULT (now()),
	`updated_at` timestamp NOT NULL DEFAULT (now()) ON UPDATE CURRENT_TIMESTAMP,
	`deleted_at` timestamp,
	CONSTRAINT `conversations_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `messages` (
	`id` varchar(36) NOT NULL,
	`conversation_id` varchar(36) NOT NULL,
	`user_id` varchar(36) NOT NULL,
	`role` varchar(20) NOT NULL,
	`s3_bucket` varchar(255) NOT NULL,
	`s3_key_encrypted` text NOT NULL,
	`kms_key_id` varchar(255) NOT NULL,
	`content_hash` varchar(64),
	`content_size` int,
	`metadata` text,
	`created_at` timestamp NOT NULL DEFAULT (now()),
	`deleted_at` timestamp,
	CONSTRAINT `messages_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
ALTER TABLE `conversations` ADD CONSTRAINT `conversations_user_id_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `messages` ADD CONSTRAINT `messages_conversation_id_conversations_id_fk` FOREIGN KEY (`conversation_id`) REFERENCES `conversations`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `messages` ADD CONSTRAINT `messages_user_id_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
CREATE INDEX `user_id_idx` ON `conversations` (`user_id`);--> statement-breakpoint
CREATE INDEX `user_id_deleted_at_idx` ON `conversations` (`user_id`,`deleted_at`);--> statement-breakpoint
CREATE INDEX `last_activity_idx` ON `conversations` (`last_activity_at`);--> statement-breakpoint
CREATE INDEX `conversation_id_idx` ON `messages` (`conversation_id`);--> statement-breakpoint
CREATE INDEX `conversation_id_created_at_idx` ON `messages` (`conversation_id`,`created_at`);--> statement-breakpoint
CREATE INDEX `user_id_idx` ON `messages` (`user_id`);--> statement-breakpoint
CREATE INDEX `deleted_at_idx` ON `messages` (`deleted_at`);