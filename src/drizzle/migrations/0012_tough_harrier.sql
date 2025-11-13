ALTER TABLE `cover_letters` RENAME COLUMN `ai_generated` TO `style`;--> statement-breakpoint
ALTER TABLE `cover_letters` MODIFY COLUMN `style` varchar(20) NOT NULL DEFAULT 'formal';