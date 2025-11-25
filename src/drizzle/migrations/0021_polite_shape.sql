CREATE TABLE `document_otp_attempts` (
	`id` varchar(36) NOT NULL,
	`user_id` varchar(36) NOT NULL,
	`file_id` varchar(36) NOT NULL,
	`action` varchar(20) NOT NULL,
	`attempts` int NOT NULL DEFAULT 0,
	`last_attempt_at` timestamp NOT NULL,
	`locked_until` timestamp,
	CONSTRAINT `document_otp_attempts_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
ALTER TABLE `document_otp_attempts` ADD CONSTRAINT `document_otp_attempts_user_id_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `document_otp_attempts` ADD CONSTRAINT `document_otp_attempts_file_id_uploaded_files_id_fk` FOREIGN KEY (`file_id`) REFERENCES `uploaded_files`(`id`) ON DELETE cascade ON UPDATE no action;