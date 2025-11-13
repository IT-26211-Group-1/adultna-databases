ALTER TABLE `cover_letters` RENAME COLUMN `style` TO `tone`;--> statement-breakpoint
ALTER TABLE `cover_letters` MODIFY COLUMN `tone` varchar(20) NOT NULL DEFAULT 'professional';