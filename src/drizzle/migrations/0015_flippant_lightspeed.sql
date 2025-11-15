CREATE TABLE `milestone_tasks` (
	`id` varchar(36) NOT NULL,
	`milestone_id` varchar(36) NOT NULL,
	`title` varchar(255) NOT NULL,
	`display_order` int NOT NULL,
	`is_completed` boolean NOT NULL DEFAULT false,
	`created_at` timestamp DEFAULT (now()),
	`updated_at` timestamp DEFAULT (now()) ON UPDATE CURRENT_TIMESTAMP,
	`completed_at` timestamp,
	CONSTRAINT `milestone_tasks_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
ALTER TABLE `milestones` RENAME COLUMN `place` TO `position_number`;--> statement-breakpoint
ALTER TABLE `milestones` MODIFY COLUMN `position_number` int NOT NULL;--> statement-breakpoint
ALTER TABLE `milestones` ADD `is_active` boolean DEFAULT true NOT NULL;--> statement-breakpoint
ALTER TABLE `milestone_tasks` ADD CONSTRAINT `milestone_tasks_milestone_id_milestones_id_fk` FOREIGN KEY (`milestone_id`) REFERENCES `milestones`(`id`) ON DELETE cascade ON UPDATE cascade;