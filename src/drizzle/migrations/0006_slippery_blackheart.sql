CREATE TABLE `certifications` (
	`id` varchar(36) NOT NULL,
	`name` varchar(200) NOT NULL,
	`category` varchar(100),
	`created_at` timestamp NOT NULL DEFAULT (now()),
	`updated_at` timestamp NOT NULL DEFAULT (now()) ON UPDATE CURRENT_TIMESTAMP,
	CONSTRAINT `certifications_id` PRIMARY KEY(`id`),
	CONSTRAINT `certifications_name_idx` UNIQUE(`name`)
);
--> statement-breakpoint
CREATE TABLE `degrees` (
	`id` varchar(36) NOT NULL,
	`name` varchar(150) NOT NULL,
	`level` varchar(50),
	`created_at` timestamp NOT NULL DEFAULT (now()),
	`updated_at` timestamp NOT NULL DEFAULT (now()) ON UPDATE CURRENT_TIMESTAMP,
	CONSTRAINT `degrees_id` PRIMARY KEY(`id`),
	CONSTRAINT `degrees_name_idx` UNIQUE(`name`)
);
--> statement-breakpoint
CREATE TABLE `employers` (
	`id` varchar(36) NOT NULL,
	`name` varchar(200) NOT NULL,
	`industry` varchar(100),
	`website` varchar(255),
	`description` text,
	`created_at` timestamp NOT NULL DEFAULT (now()),
	`updated_at` timestamp NOT NULL DEFAULT (now()) ON UPDATE CURRENT_TIMESTAMP,
	CONSTRAINT `employers_id` PRIMARY KEY(`id`),
	CONSTRAINT `employers_name_idx` UNIQUE(`name`)
);
--> statement-breakpoint
CREATE TABLE `fields_of_study` (
	`id` varchar(36) NOT NULL,
	`name` varchar(150) NOT NULL,
	`category` varchar(100),
	`created_at` timestamp NOT NULL DEFAULT (now()),
	`updated_at` timestamp NOT NULL DEFAULT (now()) ON UPDATE CURRENT_TIMESTAMP,
	CONSTRAINT `fields_of_study_id` PRIMARY KEY(`id`),
	CONSTRAINT `fields_of_study_name_idx` UNIQUE(`name`)
);
--> statement-breakpoint
CREATE TABLE `job_titles` (
	`id` varchar(36) NOT NULL,
	`title` varchar(150) NOT NULL,
	`category` varchar(100),
	`created_at` timestamp NOT NULL DEFAULT (now()),
	`updated_at` timestamp NOT NULL DEFAULT (now()) ON UPDATE CURRENT_TIMESTAMP,
	CONSTRAINT `job_titles_id` PRIMARY KEY(`id`),
	CONSTRAINT `job_titles_title_idx` UNIQUE(`title`)
);
--> statement-breakpoint
CREATE TABLE `organizations` (
	`id` varchar(36) NOT NULL,
	`name` varchar(200) NOT NULL,
	`website` varchar(255),
	`created_at` timestamp NOT NULL DEFAULT (now()),
	`updated_at` timestamp NOT NULL DEFAULT (now()) ON UPDATE CURRENT_TIMESTAMP,
	CONSTRAINT `organizations_id` PRIMARY KEY(`id`),
	CONSTRAINT `organizations_name_idx` UNIQUE(`name`)
);
--> statement-breakpoint
CREATE TABLE `resume_contact_info` (
	`id` varchar(36) NOT NULL,
	`resume_id` varchar(36) NOT NULL,
	`first_name` varchar(100) NOT NULL,
	`last_name` varchar(100) NOT NULL,
	`email` varchar(100) NOT NULL,
	`phone` varchar(20) NOT NULL,
	`city` varchar(50),
	`region` varchar(100),
	`birth_date` date,
	`linkedin` varchar(255),
	`portfolio` varchar(255),
	`created_at` timestamp NOT NULL DEFAULT (now()),
	`updated_at` timestamp NOT NULL DEFAULT (now()) ON UPDATE CURRENT_TIMESTAMP,
	CONSTRAINT `resume_contact_info_id` PRIMARY KEY(`id`),
	CONSTRAINT `resume_contact_info_resume_id_unique` UNIQUE(`resume_id`)
);
--> statement-breakpoint
CREATE TABLE `schools` (
	`id` varchar(36) NOT NULL,
	`name` varchar(200) NOT NULL,
	`location` varchar(200),
	`type` varchar(50),
	`created_at` timestamp NOT NULL DEFAULT (now()),
	`updated_at` timestamp NOT NULL DEFAULT (now()) ON UPDATE CURRENT_TIMESTAMP,
	CONSTRAINT `schools_id` PRIMARY KEY(`id`),
	CONSTRAINT `schools_name_location_idx` UNIQUE(`name`,`location`)
);
--> statement-breakpoint
CREATE TABLE `skills` (
	`id` varchar(36) NOT NULL,
	`name` varchar(100) NOT NULL,
	`category` varchar(50),
	`created_at` timestamp NOT NULL DEFAULT (now()),
	`updated_at` timestamp NOT NULL DEFAULT (now()) ON UPDATE CURRENT_TIMESTAMP,
	CONSTRAINT `skills_id` PRIMARY KEY(`id`),
	CONSTRAINT `skills_name_idx` UNIQUE(`name`)
);
--> statement-breakpoint
ALTER TABLE `resume_certifications` RENAME COLUMN `certificate` TO `certification_id`;--> statement-breakpoint
ALTER TABLE `resume_certifications` RENAME COLUMN `issuing_organization` TO `organization_id`;--> statement-breakpoint
ALTER TABLE `resume_education` RENAME COLUMN `school_name` TO `school_id`;--> statement-breakpoint
ALTER TABLE `resume_education` RENAME COLUMN `school_location` TO `degree_id`;--> statement-breakpoint
ALTER TABLE `resume_education` RENAME COLUMN `degree` TO `field_of_study_id`;--> statement-breakpoint
ALTER TABLE `resume_skills` RENAME COLUMN `skill` TO `skill_id`;--> statement-breakpoint
ALTER TABLE `resume_work_experiences` RENAME COLUMN `job_title` TO `job_title_id`;--> statement-breakpoint
ALTER TABLE `resume_work_experiences` RENAME COLUMN `employer` TO `employer_id`;--> statement-breakpoint
ALTER TABLE `resume_certifications` MODIFY COLUMN `certification_id` varchar(36) NOT NULL;--> statement-breakpoint
ALTER TABLE `resume_certifications` MODIFY COLUMN `organization_id` varchar(36);--> statement-breakpoint
ALTER TABLE `resume_education` MODIFY COLUMN `school_id` varchar(36);--> statement-breakpoint
ALTER TABLE `resume_education` MODIFY COLUMN `degree_id` varchar(36);--> statement-breakpoint
ALTER TABLE `resume_education` MODIFY COLUMN `field_of_study_id` varchar(36);--> statement-breakpoint
ALTER TABLE `resume_skills` MODIFY COLUMN `skill_id` varchar(36) NOT NULL;--> statement-breakpoint
ALTER TABLE `resume_work_experiences` MODIFY COLUMN `job_title_id` varchar(36);--> statement-breakpoint
ALTER TABLE `resume_work_experiences` MODIFY COLUMN `employer_id` varchar(36);--> statement-breakpoint
ALTER TABLE `resume_contact_info` ADD CONSTRAINT `resume_contact_info_resume_id_resumes_id_fk` FOREIGN KEY (`resume_id`) REFERENCES `resumes`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `resume_certifications` ADD CONSTRAINT `resume_certifications_certification_id_certifications_id_fk` FOREIGN KEY (`certification_id`) REFERENCES `certifications`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `resume_certifications` ADD CONSTRAINT `resume_certifications_organization_id_organizations_id_fk` FOREIGN KEY (`organization_id`) REFERENCES `organizations`(`id`) ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `resume_education` ADD CONSTRAINT `resume_education_school_id_schools_id_fk` FOREIGN KEY (`school_id`) REFERENCES `schools`(`id`) ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `resume_education` ADD CONSTRAINT `resume_education_degree_id_degrees_id_fk` FOREIGN KEY (`degree_id`) REFERENCES `degrees`(`id`) ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `resume_education` ADD CONSTRAINT `resume_education_field_of_study_id_fields_of_study_id_fk` FOREIGN KEY (`field_of_study_id`) REFERENCES `fields_of_study`(`id`) ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `resume_skills` ADD CONSTRAINT `resume_skills_skill_id_skills_id_fk` FOREIGN KEY (`skill_id`) REFERENCES `skills`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `resume_work_experiences` ADD CONSTRAINT `resume_work_experiences_job_title_id_job_titles_id_fk` FOREIGN KEY (`job_title_id`) REFERENCES `job_titles`(`id`) ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `resume_work_experiences` ADD CONSTRAINT `resume_work_experiences_employer_id_employers_id_fk` FOREIGN KEY (`employer_id`) REFERENCES `employers`(`id`) ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `resume_education` DROP COLUMN `field_of_study`;--> statement-breakpoint
ALTER TABLE `resumes` DROP COLUMN `first_name`;--> statement-breakpoint
ALTER TABLE `resumes` DROP COLUMN `last_name`;--> statement-breakpoint
ALTER TABLE `resumes` DROP COLUMN `email`;--> statement-breakpoint
ALTER TABLE `resumes` DROP COLUMN `phone`;--> statement-breakpoint
ALTER TABLE `resumes` DROP COLUMN `city`;--> statement-breakpoint
ALTER TABLE `resumes` DROP COLUMN `region`;--> statement-breakpoint
ALTER TABLE `resumes` DROP COLUMN `birth_date`;--> statement-breakpoint
ALTER TABLE `resumes` DROP COLUMN `linkedin`;--> statement-breakpoint
ALTER TABLE `resumes` DROP COLUMN `portfolio`;