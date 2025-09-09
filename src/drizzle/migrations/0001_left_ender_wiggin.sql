CREATE TABLE `milestones` (
	`id` varchar(36) NOT NULL,
	`title` varchar(255) NOT NULL,
	`description` text,
	`priority` varchar(255),
	`place` varchar(255),
	`deadline` date,
	CONSTRAINT `milestones_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `roadmap` (
	`user_id` varchar(36),
	`milestone_id` varchar(36),
	`date_achieved` date
);
--> statement-breakpoint
ALTER TABLE `roadmap` ADD CONSTRAINT `roadmap_user_id_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `roadmap` ADD CONSTRAINT `roadmap_milestone_id_milestones_id_fk` FOREIGN KEY (`milestone_id`) REFERENCES `milestones`(`id`) ON DELETE no action ON UPDATE no action;