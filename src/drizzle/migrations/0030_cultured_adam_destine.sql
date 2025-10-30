ALTER TABLE `interview_session` RENAME COLUMN `job_role_id` TO `industry`;--> statement-breakpoint
ALTER TABLE `interview_session` DROP FOREIGN KEY `interview_session_job_role_id_job_role_id_fk`;
--> statement-breakpoint
ALTER TABLE `session_questions` DROP FOREIGN KEY `session_questions_question_id_mock_questions_id_fk`;
--> statement-breakpoint
ALTER TABLE `interview_session` MODIFY COLUMN `industry` varchar(255) NOT NULL;--> statement-breakpoint
ALTER TABLE `session_questions` MODIFY COLUMN `order` int NOT NULL;--> statement-breakpoint
ALTER TABLE `interview_session` ADD `job_role` varchar(255) NOT NULL;--> statement-breakpoint
ALTER TABLE `session_questions` ADD `is_general` int DEFAULT 0 NOT NULL;--> statement-breakpoint
ALTER TABLE `session_questions` ADD `created_at` timestamp DEFAULT (now()) NOT NULL;--> statement-breakpoint
ALTER TABLE `session_questions` ADD CONSTRAINT `session_questions_question_id_interview_questions_id_fk` FOREIGN KEY (`question_id`) REFERENCES `interview_questions`(`id`) ON DELETE no action ON UPDATE no action;