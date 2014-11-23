ALTER TABLE `sessions` ADD `crc` INT UNSIGNED NOT NULL COMMENT 'crc32 checksum for session client' ;
ALTER TABLE `sessions` CHANGE `data` `data` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;
ALTER TABLE `sessions` CHANGE `id` `id` VARCHAR(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;
