-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'users'
-- 
-- ---

DROP TABLE IF EXISTS `users`;
		
CREATE TABLE `users` (
  `id` INTEGER NOT NULL AUTO_INCREMENT DEFAULT NULL,
  `name` VARCHAR NULL DEFAULT NULL,
  `country` VARCHAR NULL DEFAULT NULL,
  `bio` TEXT NULL DEFAULT NULL,
  `photo` VARCHAR NULL DEFAULT NULL,
  `personality` VARCHAR NULL DEFAULT NULL
);

-- ---
-- Table 'tags'
-- 
-- ---

DROP TABLE IF EXISTS `tags`;
		
CREATE TABLE `tags` (
  `id_users` INTEGER NOT NULL DEFAULT NULL,
  `games` INTEGER NULL DEFAULT NULL,
  `sports` INTEGER NULL DEFAULT NULL,
  `gym` INTEGER NULL DEFAULT NULL,
  `music` INTEGER NULL DEFAULT NULL,
  `technology` INTEGER NULL DEFAULT NULL,
  `fashion` INTEGER NULL DEFAULT NULL,
  `food` INTEGER NULL DEFAULT NULL,
  `travel` INTEGER NULL DEFAULT NULL,
  `photography` INTEGER NULL DEFAULT NULL,
  `literature` INTEGER NULL DEFAULT NULL
);

-- ---
-- Table 'tasks'
-- 
-- ---

DROP TABLE IF EXISTS `tasks`;
		
CREATE TABLE `tasks` (
  `id` INTEGER NOT NULL AUTO_INCREMENT DEFAULT NULL,
  `title` VARCHAR NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `status` VARCHAR NULL DEFAULT 'backlog',
  `responsible` INTEGER NULL DEFAULT NULL,
  `created_date` DATETIME NULL DEFAULT NULL,
  `deliver_date` DATETIME NULL DEFAULT NULL
);

-- ---
-- Table 'forms'
-- 
-- ---

DROP TABLE IF EXISTS `forms`;
		
CREATE TABLE `forms` (
  `id` INTEGER NOT NULL AUTO_INCREMENT DEFAULT NULL,
  `title` VARCHAR NULL DEFAULT NULL,
  `id_users` INTEGER NULL DEFAULT NULL,
  `id_responses` INTEGER NULL DEFAULT NULL,
  `rated_user` INTEGER NULL DEFAULT NULL,
  `reviewer_user` INTEGER NULL DEFAULT NULL,
  `assignment_date` DATETIME NULL DEFAULT NULL,
  `feedback` TEXT NULL DEFAULT NULL
);

-- ---
-- Table 'reports'
-- 
-- ---

DROP TABLE IF EXISTS `reports`;
		
CREATE TABLE `reports` (
  `id` INTEGER NOT NULL AUTO_INCREMENT DEFAULT NULL,
  `id_users` INTEGER NULL DEFAULT NULL,
  `title` VARCHAR NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `created_date` DATETIME NULL DEFAULT NULL
);

-- ---
-- Table 'notifications'
-- 
-- ---

DROP TABLE IF EXISTS `notifications`;
		
CREATE TABLE `notifications` (
  `description` TEXT NULL DEFAULT NULL,
  `date` DATETIME NULL DEFAULT NULL
);

-- ---
-- Table 'logins'
-- 
-- ---

DROP TABLE IF EXISTS `logins`;
		
CREATE TABLE `logins` (
  `email` VARCHAR NULL DEFAULT NULL,
  `password` VARCHAR NULL DEFAULT NULL
);

-- ---
-- Table 'personality_types'
-- 
-- ---

DROP TABLE IF EXISTS `personality_types`;
		
CREATE TABLE `personality_types` (
  `id` INTEGER NOT NULL AUTO_INCREMENT DEFAULT NULL,
  `id_users` INTEGER NULL DEFAULT NULL,
  `personality` VARCHAR NULL DEFAULT NULL,
  `initiator` INTEGER NULL DEFAULT NULL,
  `conformist` INTEGER NULL DEFAULT NULL,
  `harmonizer` INTEGER NULL DEFAULT NULL,
  `analyst` INTEGER NULL DEFAULT NULL,
  `director` INTEGER NULL DEFAULT NULL
);

-- ---
-- Table 'responses'
-- 
-- ---

DROP TABLE IF EXISTS `responses`;
		
CREATE TABLE `responses` (
  `id` INTEGER NOT NULL AUTO_INCREMENT DEFAULT NULL,
  `id_users` INTEGER NOT NULL DEFAULT NULL,
  `id_forms` INTEGER NOT NULL DEFAULT NULL,
  `id_questions` INTEGER NOT NULL DEFAULT NULL,
  `response_text` TEXT NULL DEFAULT NULL,
  `response_value` INTEGER NULL DEFAULT NULL,
  `response_date` DATETIME NULL DEFAULT NULL
);

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `users` ADD FOREIGN KEY (personality) REFERENCES `personality_types` (`initiator`);
ALTER TABLE `tags` ADD FOREIGN KEY (id_users) REFERENCES `users` (`id`);
ALTER TABLE `tasks` ADD FOREIGN KEY (responsible) REFERENCES `users` (`id`);
ALTER TABLE `forms` ADD FOREIGN KEY (id_users) REFERENCES `users` (`id`);
ALTER TABLE `reports` ADD FOREIGN KEY (id_users) REFERENCES `users` (`id`);
ALTER TABLE `personality_types` ADD FOREIGN KEY (id_users) REFERENCES `users` (`id`);
ALTER TABLE `responses` ADD FOREIGN KEY (id_users) REFERENCES `users` (`id`);
ALTER TABLE `responses` ADD FOREIGN KEY (id_forms) REFERENCES `forms` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `users` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `tags` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `tasks` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `forms` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `reports` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `notifications` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `logins` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `personality_types` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `responses` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `users` (`id`,`name`,`country`,`bio`,`photo`,`personality`) VALUES
-- ('','','','','','');
-- INSERT INTO `tags` (`id_users`,`games`,`sports`,`gym`,`music`,`technology`,`fashion`,`food`,`travel`,`photography`,`literature`) VALUES
-- ('','','','','','','','','','','');
-- INSERT INTO `tasks` (`id`,`title`,`description`,`status`,`responsible`,`created_date`,`deliver_date`) VALUES
-- ('','','','','','','');
-- INSERT INTO `forms` (`id`,`title`,`id_users`,`id_responses`,`rated_user`,`reviewer_user`,`assignment_date`,`feedback`) VALUES
-- ('','','','','','','','');
-- INSERT INTO `reports` (`id`,`id_users`,`title`,`description`,`created_date`) VALUES
-- ('','','','','');
-- INSERT INTO `notifications` (`description`,`date`) VALUES
-- ('','');
-- INSERT INTO `logins` (`email`,`password`) VALUES
-- ('','');
-- INSERT INTO `personality_types` (`id`,`id_users`,`personality`,`initiator`,`conformist`,`harmonizer`,`analyst`,`director`) VALUES
-- ('','','','','','','','');
-- INSERT INTO `responses` (`id`,`id_users`,`id_forms`,`id_questions`,`response_text`,`response_value`,`response_date`) VALUES
-- ('','','','','','','');
