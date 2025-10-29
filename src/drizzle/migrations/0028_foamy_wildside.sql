CREATE TABLE `interview_question_job_roles` (
	`question_id` varchar(36) NOT NULL,
	`job_role_id` varchar(36) NOT NULL,
	CONSTRAINT `interview_question_job_roles_question_id_job_role_id_pk` PRIMARY KEY(`question_id`,`job_role_id`)
);
--> statement-breakpoint
ALTER TABLE `interview_question_job_roles` ADD CONSTRAINT `interview_question_job_roles_question_id_interview_questions_id_fk` FOREIGN KEY (`question_id`) REFERENCES `interview_questions`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `interview_question_job_roles` ADD CONSTRAINT `interview_question_job_roles_job_role_id_job_role_id_fk` FOREIGN KEY (`job_role_id`) REFERENCES `job_role`(`id`) ON DELETE cascade ON UPDATE no action;