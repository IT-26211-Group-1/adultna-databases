CREATE TABLE `filebox_files` (
	`id` varchar(36) NOT NULL,
	`user_id` varchar(36) NOT NULL,
	`file_name` varchar(255) NOT NULL,
	`encrypted_file_name` varchar(512) NOT NULL,
	`file_key` varchar(512) NOT NULL,
	`category` varchar(50) NOT NULL,
	`content_type` varchar(100) NOT NULL,
	`file_size` bigint NOT NULL,
	`upload_date` timestamp NOT NULL DEFAULT (now()),
	`last_modified` timestamp NOT NULL DEFAULT (now()),
	`version` int DEFAULT 1,
	CONSTRAINT `filebox_files_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
ALTER TABLE `uploaded_files` DROP FOREIGN KEY `uploaded_files_source_id_document_sources_id_fk`;
--> statement-breakpoint
ALTER TABLE `uploaded_files` MODIFY COLUMN `file_name` varchar(512) NOT NULL;--> statement-breakpoint
ALTER TABLE `uploaded_files` ADD `file_size` bigint;--> statement-breakpoint
ALTER TABLE `uploaded_files` ADD `version` int DEFAULT 1;