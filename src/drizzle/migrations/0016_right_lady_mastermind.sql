ALTER TABLE `document_otp` DROP FOREIGN KEY `document_otp_file_id_filebox_files_id_fk`;
--> statement-breakpoint
ALTER TABLE `document_otp` ADD CONSTRAINT `document_otp_file_id_uploaded_files_id_fk` FOREIGN KEY (`file_id`) REFERENCES `uploaded_files`(`id`) ON DELETE cascade ON UPDATE no action;