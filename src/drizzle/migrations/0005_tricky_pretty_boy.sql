CREATE TABLE `resume_certifications` (
	`id` varchar(36) NOT NULL,
	`resume_id` varchar(36) NOT NULL,
	`certificate` varchar(100) NOT NULL,
	`issuing_organization` varchar(100),
	`order` int NOT NULL DEFAULT 0,
	CONSTRAINT `resume_certifications_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `resume_education` (
	`id` varchar(36) NOT NULL,
	`resume_id` varchar(36) NOT NULL,
	`school_name` varchar(100),
	`school_location` varchar(100),
	`degree` varchar(100),
	`field_of_study` varchar(100),
	`graduation_date` date,
	`order` int NOT NULL DEFAULT 0,
	CONSTRAINT `resume_education_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `resume_skills` (
	`id` varchar(36) NOT NULL,
	`resume_id` varchar(36) NOT NULL,
	`skill` varchar(50) NOT NULL,
	`order` int NOT NULL DEFAULT 0,
	CONSTRAINT `resume_skills_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `resume_work_experiences` (
	`id` varchar(36) NOT NULL,
	`resume_id` varchar(36) NOT NULL,
	`job_title` varchar(100),
	`employer` varchar(100),
	`start_date` date,
	`end_date` date,
	`is_currently_working_here` boolean DEFAULT false,
	`description` text,
	`order` int NOT NULL DEFAULT 0,
	CONSTRAINT `resume_work_experiences_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
ALTER TABLE `resumes` RENAME COLUMN `template_name` TO `template_id`;--> statement-breakpoint
ALTER TABLE `resumes` MODIFY COLUMN `template_id` varchar(50) NOT NULL;--> statement-breakpoint
ALTER TABLE `resumes` ADD `status` varchar(20) DEFAULT 'draft' NOT NULL;--> statement-breakpoint
ALTER TABLE `resumes` ADD `first_name` varchar(100) NOT NULL;--> statement-breakpoint
ALTER TABLE `resumes` ADD `last_name` varchar(100) NOT NULL;--> statement-breakpoint
ALTER TABLE `resumes` ADD `email` varchar(100) NOT NULL;--> statement-breakpoint
ALTER TABLE `resumes` ADD `phone` varchar(20) NOT NULL;--> statement-breakpoint
ALTER TABLE `resumes` ADD `city` varchar(50);--> statement-breakpoint
ALTER TABLE `resumes` ADD `region` varchar(100);--> statement-breakpoint
ALTER TABLE `resumes` ADD `birth_date` date;--> statement-breakpoint
ALTER TABLE `resumes` ADD `linkedin` varchar(255);--> statement-breakpoint
ALTER TABLE `resumes` ADD `portfolio` varchar(255);--> statement-breakpoint
ALTER TABLE `resumes` ADD `summary` text;--> statement-breakpoint
ALTER TABLE `resumes` ADD `color_hex` varchar(7);--> statement-breakpoint
ALTER TABLE `resume_certifications` ADD CONSTRAINT `resume_certifications_resume_id_resumes_id_fk` FOREIGN KEY (`resume_id`) REFERENCES `resumes`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `resume_education` ADD CONSTRAINT `resume_education_resume_id_resumes_id_fk` FOREIGN KEY (`resume_id`) REFERENCES `resumes`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `resume_skills` ADD CONSTRAINT `resume_skills_resume_id_resumes_id_fk` FOREIGN KEY (`resume_id`) REFERENCES `resumes`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `resume_work_experiences` ADD CONSTRAINT `resume_work_experiences_resume_id_resumes_id_fk` FOREIGN KEY (`resume_id`) REFERENCES `resumes`(`id`) ON DELETE cascade ON UPDATE no action;