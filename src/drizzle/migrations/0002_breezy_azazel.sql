ALTER TABLE `interview_answers` RENAME COLUMN `user_answer` TO `content_s3_key`;--> statement-breakpoint
ALTER TABLE `interview_answers` RENAME COLUMN `situation_feedback` TO `audio_s3_key`;--> statement-breakpoint
ALTER TABLE `interview_answers` MODIFY COLUMN `content_s3_key` varchar(512);--> statement-breakpoint
ALTER TABLE `interview_answers` MODIFY COLUMN `audio_s3_key` varchar(512);--> statement-breakpoint
ALTER TABLE `interview_answers` DROP COLUMN `task_feedback`;--> statement-breakpoint
ALTER TABLE `interview_answers` DROP COLUMN `action_feedback`;--> statement-breakpoint
ALTER TABLE `interview_answers` DROP COLUMN `result_feedback`;--> statement-breakpoint
ALTER TABLE `interview_answers` DROP COLUMN `overall_feedback`;--> statement-breakpoint
ALTER TABLE `interview_answers` DROP COLUMN `strengths`;--> statement-breakpoint
ALTER TABLE `interview_answers` DROP COLUMN `improvements`;