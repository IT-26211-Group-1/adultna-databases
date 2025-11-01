ALTER TABLE `interview_answers` RENAME COLUMN `ai_feedback` TO `user_id`;--> statement-breakpoint
ALTER TABLE `interview_answers` RENAME COLUMN `score` TO `transcript_job_name`;--> statement-breakpoint
ALTER TABLE `interview_answers` MODIFY COLUMN `user_answer` text;--> statement-breakpoint
ALTER TABLE `interview_answers` MODIFY COLUMN `user_id` varchar(36) NOT NULL;--> statement-breakpoint
ALTER TABLE `interview_answers` MODIFY COLUMN `transcript_job_name` varchar(255);--> statement-breakpoint
ALTER TABLE `interview_answers` MODIFY COLUMN `evaluated_at` timestamp;--> statement-breakpoint
ALTER TABLE `interview_answers` ADD `star_completeness_score` int;--> statement-breakpoint
ALTER TABLE `interview_answers` ADD `action_specificity_score` int;--> statement-breakpoint
ALTER TABLE `interview_answers` ADD `result_quantification_score` int;--> statement-breakpoint
ALTER TABLE `interview_answers` ADD `relevance_to_role_score` int;--> statement-breakpoint
ALTER TABLE `interview_answers` ADD `delivery_fluency_score` int;--> statement-breakpoint
ALTER TABLE `interview_answers` ADD `total_score` decimal(3,1);--> statement-breakpoint
ALTER TABLE `interview_answers` ADD `situation_feedback` text;--> statement-breakpoint
ALTER TABLE `interview_answers` ADD `task_feedback` text;--> statement-breakpoint
ALTER TABLE `interview_answers` ADD `action_feedback` text;--> statement-breakpoint
ALTER TABLE `interview_answers` ADD `result_feedback` text;--> statement-breakpoint
ALTER TABLE `interview_answers` ADD `overall_feedback` text;--> statement-breakpoint
ALTER TABLE `interview_answers` ADD `strengths` json;--> statement-breakpoint
ALTER TABLE `interview_answers` ADD `improvements` json;--> statement-breakpoint
ALTER TABLE `interview_answers` ADD `created_at` timestamp DEFAULT (now()) NOT NULL;--> statement-breakpoint
ALTER TABLE `interview_answers` ADD CONSTRAINT `interview_answers_user_id_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;