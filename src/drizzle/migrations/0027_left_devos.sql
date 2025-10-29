ALTER TABLE `interview_questions` RENAME COLUMN `job_role_id` TO `job_role`;--> statement-breakpoint
ALTER TABLE `interview_questions` DROP FOREIGN KEY `interview_questions_job_role_id_job_role_id_fk`;
--> statement-breakpoint
ALTER TABLE `interview_questions` MODIFY COLUMN `job_role` varchar(255);