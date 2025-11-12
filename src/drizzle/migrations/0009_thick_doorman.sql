CREATE TABLE `cover_letter_sections` (
	`id` varchar(36) NOT NULL,
	`cover_letter_id` varchar(36) NOT NULL,
	`section_type` varchar(50) NOT NULL,
	`content` text,
	`order` int NOT NULL DEFAULT 0,
	`created_at` timestamp NOT NULL DEFAULT (now()),
	CONSTRAINT `cover_letter_sections_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
ALTER TABLE `cover_letters` RENAME COLUMN `template_name` TO `template_id`;--> statement-breakpoint
ALTER TABLE `cover_letters` MODIFY COLUMN `resume_id` varchar(36);--> statement-breakpoint
ALTER TABLE `cover_letters` MODIFY COLUMN `template_id` varchar(50) NOT NULL DEFAULT 'modern';--> statement-breakpoint
ALTER TABLE `cover_letters` MODIFY COLUMN `content` text;--> statement-breakpoint
ALTER TABLE `cover_letters` ADD `status` varchar(20) DEFAULT 'draft' NOT NULL;--> statement-breakpoint
ALTER TABLE `cover_letters` ADD `style` varchar(20) DEFAULT 'formal' NOT NULL;--> statement-breakpoint
ALTER TABLE `cover_letters` ADD `target_company` varchar(255);--> statement-breakpoint
ALTER TABLE `cover_letters` ADD `target_position` varchar(255);--> statement-breakpoint
ALTER TABLE `cover_letters` ADD `job_description` text;--> statement-breakpoint
ALTER TABLE `cover_letter_sections` ADD CONSTRAINT `cover_letter_sections_cover_letter_id_cover_letters_id_fk` FOREIGN KEY (`cover_letter_id`) REFERENCES `cover_letters`(`id`) ON DELETE cascade ON UPDATE no action;