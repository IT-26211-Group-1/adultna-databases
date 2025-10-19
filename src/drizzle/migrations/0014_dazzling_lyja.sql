CREATE TABLE `document_otp` (
	`id` varchar(36) NOT NULL,
	`user_id` varchar(36) NOT NULL,
	`file_id` varchar(36) NOT NULL,
	`otp` varchar(6) NOT NULL,
	`created_at` timestamp NOT NULL DEFAULT (now()),
	`expires_at` timestamp NOT NULL,
	CONSTRAINT `document_otp_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
ALTER TABLE `document_otp` ADD CONSTRAINT `document_otp_user_id_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `document_otp` ADD CONSTRAINT `document_otp_file_id_filebox_files_id_fk` FOREIGN KEY (`file_id`) REFERENCES `filebox_files`(`id`) ON DELETE cascade ON UPDATE no action;