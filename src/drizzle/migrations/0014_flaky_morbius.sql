DROP TABLE `cover_letter_sections`;--> statement-breakpoint
ALTER TABLE `cover_letters` RENAME COLUMN `resume_id` TO `s3_content_key`;--> statement-breakpoint
ALTER TABLE `cover_letters` DROP FOREIGN KEY `cover_letters_resume_id_resumes_id_fk`;
--> statement-breakpoint
ALTER TABLE `cover_letters` MODIFY COLUMN `s3_content_key` varchar(500);