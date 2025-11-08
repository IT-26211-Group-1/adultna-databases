DROP TABLE `certifications`;--> statement-breakpoint
DROP TABLE `cover_letter_suggestions`;--> statement-breakpoint
DROP TABLE `degrees`;--> statement-breakpoint
DROP TABLE `employers`;--> statement-breakpoint
DROP TABLE `fields_of_study`;--> statement-breakpoint
DROP TABLE `job_titles`;--> statement-breakpoint
DROP TABLE `organizations`;--> statement-breakpoint
DROP TABLE `resume_entries`;--> statement-breakpoint
DROP TABLE `resume_sections`;--> statement-breakpoint
DROP TABLE `resume_suggestions`;--> statement-breakpoint
DROP TABLE `schools`;--> statement-breakpoint
DROP TABLE `skills`;--> statement-breakpoint
ALTER TABLE `ai_interactions` RENAME COLUMN `response` TO `action_type`;--> statement-breakpoint
ALTER TABLE `resume_certifications` RENAME COLUMN `certification_id` TO `certificate`;--> statement-breakpoint
ALTER TABLE `resume_certifications` RENAME COLUMN `organization_id` TO `issuing_organization`;--> statement-breakpoint
ALTER TABLE `resume_education` RENAME COLUMN `school_id` TO `school_name`;--> statement-breakpoint
ALTER TABLE `resume_education` RENAME COLUMN `degree_id` TO `school_location`;--> statement-breakpoint
ALTER TABLE `resume_education` RENAME COLUMN `field_of_study_id` TO `degree`;--> statement-breakpoint
ALTER TABLE `resume_skills` RENAME COLUMN `skill_id` TO `skill`;--> statement-breakpoint
ALTER TABLE `resume_work_experiences` RENAME COLUMN `job_title_id` TO `job_title`;--> statement-breakpoint
ALTER TABLE `resume_work_experiences` RENAME COLUMN `employer_id` TO `employer`;--> statement-breakpoint
ALTER TABLE `resume_certifications` DROP FOREIGN KEY `resume_certifications_certification_id_certifications_id_fk`;
--> statement-breakpoint
ALTER TABLE `resume_certifications` DROP FOREIGN KEY `resume_certifications_organization_id_organizations_id_fk`;
--> statement-breakpoint
ALTER TABLE `resume_education` DROP FOREIGN KEY `resume_education_school_id_schools_id_fk`;
--> statement-breakpoint
ALTER TABLE `resume_education` DROP FOREIGN KEY `resume_education_degree_id_degrees_id_fk`;
--> statement-breakpoint
ALTER TABLE `resume_education` DROP FOREIGN KEY `resume_education_field_of_study_id_fields_of_study_id_fk`;
--> statement-breakpoint
ALTER TABLE `resume_skills` DROP FOREIGN KEY `resume_skills_skill_id_skills_id_fk`;
--> statement-breakpoint
ALTER TABLE `resume_work_experiences` DROP FOREIGN KEY `resume_work_experiences_job_title_id_job_titles_id_fk`;
--> statement-breakpoint
ALTER TABLE `resume_work_experiences` DROP FOREIGN KEY `resume_work_experiences_employer_id_employers_id_fk`;
--> statement-breakpoint
ALTER TABLE `ai_interactions` MODIFY COLUMN `action_type` varchar(100) NOT NULL;--> statement-breakpoint
ALTER TABLE `resume_certifications` MODIFY COLUMN `certificate` varchar(100) NOT NULL;--> statement-breakpoint
ALTER TABLE `resume_certifications` MODIFY COLUMN `issuing_organization` varchar(100);--> statement-breakpoint
ALTER TABLE `resume_education` MODIFY COLUMN `school_name` varchar(100);--> statement-breakpoint
ALTER TABLE `resume_education` MODIFY COLUMN `school_location` varchar(100);--> statement-breakpoint
ALTER TABLE `resume_education` MODIFY COLUMN `degree` varchar(100);--> statement-breakpoint
ALTER TABLE `resume_skills` MODIFY COLUMN `skill` json NOT NULL;--> statement-breakpoint
ALTER TABLE `resume_work_experiences` MODIFY COLUMN `job_title` varchar(100);--> statement-breakpoint
ALTER TABLE `resume_work_experiences` MODIFY COLUMN `employer` varchar(100);--> statement-breakpoint
ALTER TABLE `ai_interactions` ADD `is_accepted` boolean;--> statement-breakpoint
ALTER TABLE `resume_education` ADD `field_of_study` varchar(100);