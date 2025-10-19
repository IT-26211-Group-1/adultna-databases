ALTER TABLE `filebox_files` ADD `is_secure` boolean DEFAULT false NOT NULL;--> statement-breakpoint
ALTER TABLE `uploaded_files` ADD `is_secure` boolean DEFAULT false NOT NULL;