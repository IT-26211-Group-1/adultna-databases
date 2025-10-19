CREATE TABLE `interview_questions` (
	`id` varchar(36) NOT NULL,
	`question` text NOT NULL,
	`category` enum('behavioral','technical','situational') NOT NULL,
	`source` enum('ai','manual') NOT NULL,
	`status` enum('approved','rejected','pending','to_revise') NOT NULL DEFAULT 'pending',
	`created_by` varchar(36) NOT NULL,
	`updated_by` varchar(36),
	`created_at` timestamp NOT NULL DEFAULT (now()),
	`updated_at` timestamp NOT NULL DEFAULT (now()) ON UPDATE CURRENT_TIMESTAMP,
	CONSTRAINT `interview_questions_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
ALTER TABLE `government_process_guides` RENAME COLUMN `agency` TO `slug`;--> statement-breakpoint
ALTER TABLE `government_process_guides` MODIFY COLUMN `description` text NOT NULL;--> statement-breakpoint
ALTER TABLE `government_process_guides` MODIFY COLUMN `updated_by` varchar(255);--> statement-breakpoint
ALTER TABLE `government_process_guides` ADD `category` enum('identification','civil-registration','permits-licenses','social-services','tax-related','legal','other') NOT NULL;--> statement-breakpoint
ALTER TABLE `government_process_guides` ADD `keywords` json NOT NULL;--> statement-breakpoint
ALTER TABLE `government_process_guides` ADD `steps` json NOT NULL;--> statement-breakpoint
ALTER TABLE `government_process_guides` ADD `requirements` json NOT NULL;--> statement-breakpoint
ALTER TABLE `government_process_guides` ADD `processing_time` varchar(100) NOT NULL;--> statement-breakpoint
ALTER TABLE `government_process_guides` ADD `offices` json NOT NULL;--> statement-breakpoint
ALTER TABLE `government_process_guides` ADD `status` enum('pending','accepted','rejected','to_revise') DEFAULT 'pending' NOT NULL;--> statement-breakpoint
ALTER TABLE `government_process_guides` ADD `created_by` varchar(36) NOT NULL;--> statement-breakpoint
ALTER TABLE `government_process_guides` ADD `verified_by` varchar(36);--> statement-breakpoint
ALTER TABLE `government_process_guides` ADD `rejection_reason` text;--> statement-breakpoint
ALTER TABLE `government_process_guides` ADD `deleted_at` timestamp;--> statement-breakpoint
ALTER TABLE `government_process_guides` ADD `deleted_by` varchar(36);--> statement-breakpoint
ALTER TABLE `government_process_guides` ADD CONSTRAINT `government_process_guides_slug_unique` UNIQUE(`slug`);--> statement-breakpoint
ALTER TABLE `interview_questions` ADD CONSTRAINT `interview_questions_created_by_users_id_fk` FOREIGN KEY (`created_by`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `interview_questions` ADD CONSTRAINT `interview_questions_updated_by_users_id_fk` FOREIGN KEY (`updated_by`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `government_process_guides` ADD CONSTRAINT `government_process_guides_created_by_users_id_fk` FOREIGN KEY (`created_by`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `government_process_guides` ADD CONSTRAINT `government_process_guides_verified_by_users_id_fk` FOREIGN KEY (`verified_by`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `government_process_guides` ADD CONSTRAINT `government_process_guides_deleted_by_users_id_fk` FOREIGN KEY (`deleted_by`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;