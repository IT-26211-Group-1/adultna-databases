RENAME TABLE `interview_question_job_roles` TO `question_job_roles`;--> statement-breakpoint
ALTER TABLE `question_job_roles` DROP FOREIGN KEY `interview_question_job_roles_question_id_interview_questions_id_fk`;
--> statement-breakpoint
ALTER TABLE `question_job_roles` DROP FOREIGN KEY `interview_question_job_roles_job_role_id_job_role_id_fk`;
--> statement-breakpoint
ALTER TABLE `question_job_roles` DROP PRIMARY KEY;--> statement-breakpoint
ALTER TABLE `question_job_roles` ADD PRIMARY KEY(`question_id`,`job_role_id`);--> statement-breakpoint
ALTER TABLE `question_job_roles` ADD CONSTRAINT `question_job_roles_question_id_interview_questions_id_fk` FOREIGN KEY (`question_id`) REFERENCES `interview_questions`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `question_job_roles` ADD CONSTRAINT `question_job_roles_job_role_id_job_role_id_fk` FOREIGN KEY (`job_role_id`) REFERENCES `job_role`(`id`) ON DELETE cascade ON UPDATE no action;