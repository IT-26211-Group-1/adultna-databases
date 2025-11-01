CREATE TABLE IF NOT EXISTS `ai_interactions` (
	`id` varchar(36) NOT NULL,
	`user_id` varchar(36) NOT NULL,
	`feature_id` varchar(36) NOT NULL,
	`request` varchar(1000) NOT NULL,
	`response` varchar(2000),
	`metadata` varchar(500),
	`created_at` timestamp DEFAULT (now()),
	CONSTRAINT `ai_interactions_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS `answer_options` (
	`id` serial AUTO_INCREMENT NOT NULL,
	`question_id` bigint unsigned NOT NULL,
	`outcome_tag_id` bigint unsigned,
	`option_text` varchar(255) NOT NULL,
	`created_at` timestamp DEFAULT (now()),
	`updated_at` timestamp DEFAULT (now()),
	CONSTRAINT `answer_options_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS `audit_logs` (
	`id` varchar(36) NOT NULL,
	`user_id` varchar(36),
	`source_id` varchar(36),
	`action` varchar(255) NOT NULL,
	`module` varchar(100),
	`timestamp` timestamp NOT NULL DEFAULT (now()),
	CONSTRAINT `audit_logs_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS `cover_letters` (
	`id` varchar(36) NOT NULL,
	`user_id` varchar(36) NOT NULL,
	`resume_id` varchar(36) NOT NULL,
	`title` varchar(255) NOT NULL,
	`template_name` varchar(255) NOT NULL,
	`content` varchar(4000),
	`ai_generated` boolean NOT NULL DEFAULT false,
	`created_at` timestamp NOT NULL DEFAULT (now()),
	`updated_at` timestamp NOT NULL DEFAULT (now()) ON UPDATE CURRENT_TIMESTAMP,
	CONSTRAINT `cover_letters_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS `cover_letter_suggestions` (
	`id` varchar(36) NOT NULL,
	`cover_letter_id` varchar(36) NOT NULL,
	`suggested_content` varchar(2000),
	`model_used` varchar(255) NOT NULL,
	`generated_at` timestamp NOT NULL DEFAULT (now()),
	CONSTRAINT `cover_letter_suggestions_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS `documents` (
	`id` varchar(36) NOT NULL,
	`user_id` varchar(36) NOT NULL,
	`file_id` varchar(36) NOT NULL,
	`document_type` varchar(100),
	CONSTRAINT `documents_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS `document_sources` (
	`id` varchar(36) NOT NULL,
	`file_id` varchar(36) NOT NULL,
	`source_type` varchar(100) NOT NULL,
	`entity_id` varchar(36) NOT NULL,
	CONSTRAINT `document_sources_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS `email_otp` (
	`id` varchar(36) NOT NULL,
	`user_id` varchar(36) NOT NULL,
	`otp` varchar(6) NOT NULL,
	`session_token` varchar(36) NOT NULL,
	`created_at` timestamp DEFAULT (now()),
	`expires_at` timestamp NOT NULL,
	CONSTRAINT `email_otp_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS `features` (
	`id` varchar(36) NOT NULL,
	`name` varchar(100) NOT NULL,
	CONSTRAINT `features_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS `filebox_folders` (
	`id` varchar(36) NOT NULL,
	`user_id` varchar(36) NOT NULL,
	`name` varchar(255) NOT NULL,
	`type` varchar(50) NOT NULL,
	`created_at` timestamp NOT NULL DEFAULT (now()),
	`updated_at` timestamp NOT NULL DEFAULT (now()),
	CONSTRAINT `filebox_folders_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS `government_process_guides` (
	`id` varchar(36) NOT NULL,
	`agency` varchar(255) NOT NULL,
	`title` varchar(255) NOT NULL,
	`description` varchar(1000),
	`updated_by` varchar(36),
	`created_at` timestamp NOT NULL DEFAULT (now()),
	`updated_at` timestamp NOT NULL DEFAULT (now()) ON UPDATE CURRENT_TIMESTAMP,
	CONSTRAINT `government_process_guides_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS `government_requirements` (
	`id` varchar(36) NOT NULL,
	`guide_id` varchar(36) NOT NULL,
	`requirements` varchar(255) NOT NULL,
	CONSTRAINT `government_requirements_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS `interview_answers` (
	`id` varchar(36) NOT NULL,
	`session_question_id` varchar(36) NOT NULL,
	`user_answer` varchar(2000),
	`ai_feedback` varchar(2000),
	`score` varchar(5),
	`evaluated_at` timestamp NOT NULL DEFAULT (now()),
	CONSTRAINT `interview_answers_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS `interview_session` (
	`id` varchar(36) NOT NULL,
	`user_id` varchar(36) NOT NULL,
	`job_role_id` varchar(36) NOT NULL,
	`created_at` timestamp NOT NULL DEFAULT (now()),
	CONSTRAINT `interview_session_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS `job_role` (
	`id` varchar(36) NOT NULL,
	`title` varchar(255) NOT NULL,
	CONSTRAINT `job_role_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS `login_attempts` (
	`id` varchar(36) NOT NULL,
	`user_id` varchar(36),
	`input_email` varchar(255) NOT NULL,
	`status` varchar(50) NOT NULL,
	`login_method` varchar(50),
	`attempted_at` timestamp DEFAULT (now()),
	CONSTRAINT `login_attempts_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS `mock_questions` (
	`id` varchar(36) NOT NULL,
	`job_role_id` varchar(36),
	`question` varchar(500) NOT NULL,
	`category` varchar(100) NOT NULL,
	CONSTRAINT `mock_questions_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS `onboarding_questions` (
	`id` serial AUTO_INCREMENT NOT NULL,
	`question` varchar(255) NOT NULL,
	`category` varchar(50) NOT NULL,
	`created_at` timestamp DEFAULT (now()),
	`updated_at` timestamp DEFAULT (now()),
	CONSTRAINT `onboarding_questions_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS `outcome_tag` (
	`tag_id` serial AUTO_INCREMENT NOT NULL,
	`name` varchar(255) NOT NULL,
	`created_at` timestamp DEFAULT (now()),
	`updated_at` timestamp DEFAULT (now()),
	CONSTRAINT `outcome_tag_tag_id` PRIMARY KEY(`tag_id`)
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS `reports` (
	`id` varchar(36) NOT NULL,
	`user_id` varchar(36) NOT NULL,
	`status_id` varchar(36) NOT NULL,
	`feature_id` varchar(36) NOT NULL,
	`title` varchar(255) NOT NULL,
	`description` varchar(1000),
	`type` varchar(100),
	`created_at` timestamp DEFAULT (now()),
	`updated_at` timestamp DEFAULT (now()),
	CONSTRAINT `reports_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS `report_status` (
	`id` varchar(36) NOT NULL,
	`name` varchar(100) NOT NULL,
	CONSTRAINT `report_status_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS `resume_entries` (
	`id` varchar(36) NOT NULL,
	`section_id` varchar(36) NOT NULL,
	`description` varchar(2000),
	`company` varchar(255),
	`location` varchar(255),
	`start_date` date,
	`end_date` date,
	CONSTRAINT `resume_entries_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS `resumes` (
	`id` varchar(36) NOT NULL,
	`user_id` varchar(36) NOT NULL,
	`title` varchar(255) NOT NULL,
	`template_name` varchar(255) NOT NULL,
	`created_at` timestamp NOT NULL DEFAULT (now()),
	`updated_at` timestamp NOT NULL DEFAULT (now()),
	CONSTRAINT `resumes_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS `resume_sections` (
	`id` varchar(36) NOT NULL,
	`resume_id` varchar(36) NOT NULL,
	`name` varchar(255) NOT NULL,
	`order` varchar(10),
	CONSTRAINT `resume_sections_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS `resume_suggestions` (
	`id` varchar(36) NOT NULL,
	`entry_id` varchar(36) NOT NULL,
	`suggested_content` varchar(2000),
	`is_accepted` boolean NOT NULL DEFAULT false,
	`generated_at` timestamp NOT NULL DEFAULT (now()),
	CONSTRAINT `resume_suggestions_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS `roles` (
	`role_id` serial AUTO_INCREMENT NOT NULL,
	`role_name` varchar(50) NOT NULL,
	CONSTRAINT `roles_role_id` PRIMARY KEY(`role_id`),
	CONSTRAINT `roles_role_name_unique` UNIQUE(`role_name`)
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS `session_questions` (
	`id` varchar(36) NOT NULL,
	`session_id` varchar(36) NOT NULL,
	`question_id` varchar(36) NOT NULL,
	`order` varchar(10) NOT NULL,
	CONSTRAINT `session_questions_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS `uploaded_files` (
	`id` varchar(36) NOT NULL,
	`folder_id` varchar(36) NOT NULL,
	`source_id` varchar(36) NOT NULL,
	`file_name` varchar(255) NOT NULL,
	`s3_url` varchar(255) NOT NULL,
	`mime_type` varchar(100) NOT NULL,
	`uploaded_at` timestamp NOT NULL DEFAULT (now()),
	CONSTRAINT `uploaded_files_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS `user_onboarding_response` (
	`id` varchar(36) NOT NULL,
	`user_id` varchar(36) NOT NULL,
	`question_id` bigint unsigned NOT NULL,
	`option_id` bigint unsigned NOT NULL,
	`answered_at` timestamp DEFAULT (now()),
	CONSTRAINT `user_onboarding_response_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS `user_profile` (
	`id` varchar(36) NOT NULL,
	`user_id` varchar(36) NOT NULL,
	`first_name` varchar(100) NOT NULL,
	`last_name` varchar(100) NOT NULL,
	`display_name` varchar(100),
	`life_stage` varchar(100),
	CONSTRAINT `user_profile_id` PRIMARY KEY(`id`),
	CONSTRAINT `user_profile_display_name_unique` UNIQUE(`display_name`)
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS `user_roles` (
	`user_id` varchar(36) NOT NULL,
	`role_id` int NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS `users` (
	`id` varchar(36) NOT NULL,
	`email` varchar(255) NOT NULL,
	`email_verified` boolean DEFAULT false,
	`password` varchar(255) NOT NULL,
	`accepted_terms` boolean DEFAULT false,
	`last_login` timestamp DEFAULT (now()),
	`status` varchar(50) DEFAULT 'active',
	`created_at` timestamp DEFAULT (now()),
	`updated_at` timestamp DEFAULT (now()),
	CONSTRAINT `users_id` PRIMARY KEY(`id`),
	CONSTRAINT `users_id_unique` UNIQUE(`id`),
	CONSTRAINT `users_email_unique` UNIQUE(`email`)
);
--> statement-breakpoint
ALTER TABLE `answer_options` ADD CONSTRAINT `answer_options_question_id_onboarding_questions_id_fk` FOREIGN KEY (`question_id`) REFERENCES `onboarding_questions`(`id`) ON DELETE cascade ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `answer_options` ADD CONSTRAINT `answer_options_outcome_tag_id_outcome_tag_tag_id_fk` FOREIGN KEY (`outcome_tag_id`) REFERENCES `outcome_tag`(`tag_id`) ON DELETE set null ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `audit_logs` ADD CONSTRAINT `audit_logs_user_id_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `audit_logs` ADD CONSTRAINT `audit_logs_source_id_document_sources_id_fk` FOREIGN KEY (`source_id`) REFERENCES `document_sources`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `cover_letters` ADD CONSTRAINT `cover_letters_user_id_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `cover_letters` ADD CONSTRAINT `cover_letters_resume_id_resumes_id_fk` FOREIGN KEY (`resume_id`) REFERENCES `resumes`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `cover_letter_suggestions` ADD CONSTRAINT `cover_letter_suggestions_cover_letter_id_cover_letters_id_fk` FOREIGN KEY (`cover_letter_id`) REFERENCES `cover_letters`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `documents` ADD CONSTRAINT `documents_user_id_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `documents` ADD CONSTRAINT `documents_file_id_uploaded_files_id_fk` FOREIGN KEY (`file_id`) REFERENCES `uploaded_files`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `document_sources` ADD CONSTRAINT `document_sources_file_id_uploaded_files_id_fk` FOREIGN KEY (`file_id`) REFERENCES `uploaded_files`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `email_otp` ADD CONSTRAINT `email_otp_user_id_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `filebox_folders` ADD CONSTRAINT `filebox_folders_user_id_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `government_process_guides` ADD CONSTRAINT `government_process_guides_updated_by_users_id_fk` FOREIGN KEY (`updated_by`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `government_requirements` ADD CONSTRAINT `government_requirements_guide_id_government_process_guides_id_fk` FOREIGN KEY (`guide_id`) REFERENCES `government_process_guides`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `interview_answers` ADD CONSTRAINT `interview_answers_session_question_id_session_questions_id_fk` FOREIGN KEY (`session_question_id`) REFERENCES `session_questions`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `interview_session` ADD CONSTRAINT `interview_session_user_id_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `interview_session` ADD CONSTRAINT `interview_session_job_role_id_job_role_id_fk` FOREIGN KEY (`job_role_id`) REFERENCES `job_role`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `login_attempts` ADD CONSTRAINT `login_attempts_user_id_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `mock_questions` ADD CONSTRAINT `mock_questions_job_role_id_job_role_id_fk` FOREIGN KEY (`job_role_id`) REFERENCES `job_role`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `reports` ADD CONSTRAINT `reports_user_id_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `reports` ADD CONSTRAINT `reports_status_id_report_status_id_fk` FOREIGN KEY (`status_id`) REFERENCES `report_status`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `reports` ADD CONSTRAINT `reports_feature_id_features_id_fk` FOREIGN KEY (`feature_id`) REFERENCES `features`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `resume_entries` ADD CONSTRAINT `resume_entries_section_id_resume_sections_id_fk` FOREIGN KEY (`section_id`) REFERENCES `resume_sections`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `resumes` ADD CONSTRAINT `resumes_user_id_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `resume_sections` ADD CONSTRAINT `resume_sections_resume_id_resumes_id_fk` FOREIGN KEY (`resume_id`) REFERENCES `resumes`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `resume_suggestions` ADD CONSTRAINT `resume_suggestions_entry_id_resume_entries_id_fk` FOREIGN KEY (`entry_id`) REFERENCES `resume_entries`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `session_questions` ADD CONSTRAINT `session_questions_session_id_interview_session_id_fk` FOREIGN KEY (`session_id`) REFERENCES `interview_session`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `session_questions` ADD CONSTRAINT `session_questions_question_id_mock_questions_id_fk` FOREIGN KEY (`question_id`) REFERENCES `mock_questions`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `uploaded_files` ADD CONSTRAINT `uploaded_files_folder_id_filebox_folders_id_fk` FOREIGN KEY (`folder_id`) REFERENCES `filebox_folders`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `uploaded_files` ADD CONSTRAINT `uploaded_files_source_id_document_sources_id_fk` FOREIGN KEY (`source_id`) REFERENCES `document_sources`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `user_onboarding_response` ADD CONSTRAINT `user_onboarding_response_user_id_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE cascade ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `user_onboarding_response` ADD CONSTRAINT `user_onboarding_response_question_id_onboarding_questions_id_fk` FOREIGN KEY (`question_id`) REFERENCES `onboarding_questions`(`id`) ON DELETE cascade ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `user_onboarding_response` ADD CONSTRAINT `user_onboarding_response_option_id_answer_options_id_fk` FOREIGN KEY (`option_id`) REFERENCES `answer_options`(`id`) ON DELETE cascade ON UPDATE cascade;