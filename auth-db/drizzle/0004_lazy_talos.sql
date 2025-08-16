RENAME TABLE `email_verifications` TO `email_verification`;--> statement-breakpoint
ALTER TABLE `email_verification` DROP INDEX `email_verifications_token_unique`;--> statement-breakpoint
ALTER TABLE `email_verification` DROP FOREIGN KEY `email_verifications_user_id_users_id_fk`;
--> statement-breakpoint
ALTER TABLE `email_verification` DROP PRIMARY KEY;--> statement-breakpoint
ALTER TABLE `email_verification` ADD PRIMARY KEY(`id`);--> statement-breakpoint
ALTER TABLE `email_verification` ADD CONSTRAINT `email_verification_token_unique` UNIQUE(`token`);--> statement-breakpoint
ALTER TABLE `email_verification` ADD CONSTRAINT `email_verification_user_id_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;