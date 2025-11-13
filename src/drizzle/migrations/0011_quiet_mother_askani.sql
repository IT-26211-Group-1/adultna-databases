ALTER TABLE `cover_letter_sections` RENAME COLUMN `content` TO `s3_content_key`;--> statement-breakpoint
ALTER TABLE `cover_letter_sections` MODIFY COLUMN `s3_content_key` varchar(500) NOT NULL;--> statement-breakpoint
ALTER TABLE `cover_letters` DROP COLUMN `template_id`;--> statement-breakpoint
ALTER TABLE `cover_letters` DROP COLUMN `style`;--> statement-breakpoint
ALTER TABLE `cover_letters` DROP COLUMN `target_company`;--> statement-breakpoint
ALTER TABLE `cover_letters` DROP COLUMN `target_position`;--> statement-breakpoint
ALTER TABLE `cover_letters` DROP COLUMN `job_description`;--> statement-breakpoint
ALTER TABLE `cover_letters` DROP COLUMN `content`;