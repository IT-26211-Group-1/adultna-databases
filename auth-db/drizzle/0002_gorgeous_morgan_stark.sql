ALTER TABLE `roles` ADD CONSTRAINT `roles_role_name_unique` UNIQUE(`role_name`);--> statement-breakpoint
ALTER TABLE `user_profile` ADD CONSTRAINT `user_profile_display_name_unique` UNIQUE(`display_name`);--> statement-breakpoint
ALTER TABLE `users` ADD CONSTRAINT `users_id_unique` UNIQUE(`id`);