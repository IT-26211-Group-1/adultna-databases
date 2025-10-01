ALTER TABLE `milestones` ADD `user_id` varchar(36) NOT NULL;--> statement-breakpoint
ALTER TABLE `milestones` ADD `category` varchar(50) NOT NULL;--> statement-breakpoint
ALTER TABLE `milestones` ADD `status` varchar(20) DEFAULT 'pending' NOT NULL;--> statement-breakpoint
ALTER TABLE `milestones` ADD `created_at` timestamp DEFAULT (now());--> statement-breakpoint
ALTER TABLE `milestones` ADD `updated_at` timestamp DEFAULT (now());--> statement-breakpoint
ALTER TABLE `milestones` ADD `completed_at` timestamp;--> statement-breakpoint
ALTER TABLE `milestones` ADD CONSTRAINT `milestones_user_id_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE cascade ON UPDATE cascade;