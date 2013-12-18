ALTER TABLE `activities` CHANGE `startTime` `start_time` INT(11) UNSIGNED NULL DEFAULT NULL;
ALTER TABLE `activities` CHANGE `endTime` `end_time` INT(11) UNSIGNED NULL DEFAULT NULL;

ALTER TABLE `comments` CHANGE `createTime` `create_time` INT(11) UNSIGNED NULL DEFAULT NULL;
ALTER TABLE `comments` CHANGE `lastModifiedTime` `last_modified_time` INT(11) UNSIGNED NULL DEFAULT NULL;

ALTER TABLE `configs` CHANGE `groupID` `group_id` INT(10) UNSIGNED NOT NULL COMMENT 'config group id';

ALTER TABLE `nodes` CHANGE `createTime` `create_time` INT(11) UNSIGNED NULL DEFAULT NULL;
ALTER TABLE `nodes` CHANGE `lastModifiedTime` `last_modified_time` INT(11) UNSIGNED NULL DEFAULT NULL;

ALTER TABLE `nodes` CHANGE `viewCount` `view_count` INT(10) UNSIGNED NULL DEFAULT '0';

ALTER TABLE `priv_msgs` CHANGE `fromUID` `from_uid` INT(10) UNSIGNED NULL DEFAULT NULL;
ALTER TABLE `priv_msgs` CHANGE `toUID` `to_uid` INT(10) UNSIGNED NULL DEFAULT NULL;

ALTER TABLE `priv_msgs` CHANGE `topicMID` `msg_id` INT(10) UNSIGNED NULL DEFAULT NULL;
ALTER TABLE `priv_msgs` CHANGE `isNew` `is_new` TINYINT(1) UNSIGNED NOT NULL DEFAULT '1';
ALTER TABLE `priv_msgs` CHANGE `isDeleted` `is_deleted` TINYINT(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'perTopicResult: 0(0,0):none, 1(0,1):toUIDDelete, 2(1,0):fromUIDDelete, 3(1,1):bothDelete; action: toDelete: isDelete+=1, fromDelete:isDelete+=2*1';

ALTER TABLE `spammers` CHANGE `ipInt` `ip` INT(10) UNSIGNED NOT NULL COMMENT 'spammer IP as integer';
ALTER TABLE `spam_words` CHANGE `lastHitTime` `last_hit_time` INT(11) UNSIGNED NOT NULL;

ALTER TABLE `users` CHANGE `firstName` `firstname` VARCHAR(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL;
ALTER TABLE `users` CHANGE `lastName` `lastname` VARCHAR(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL;

ALTER TABLE `users` CHANGE `favoriteQuotation` `favorite_quotation` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL;
ALTER TABLE `users` CHANGE `createTime` `create_time` INT(11) UNSIGNED NULL DEFAULT NULL;
ALTER TABLE `users` CHANGE `lastAccessTime` `last_access_time` INT(11) UNSIGNED NULL DEFAULT NULL;

ALTER TABLE `users` CHANGE `lastAccessIPInt` `last_access_ip` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'IP as Integer';

ALTER TABLE `comments` CHANGE `cid` `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE `images_deleted` CHANGE `fid` `id` INT(10) UNSIGNED NOT NULL COMMENT 'fid in files table';
ALTER TABLE `ff_attendees` CHANGE `aid` `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE `ff_comments` CHANGE `cid` `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE `ff_subscribers` CHANGE `sid` `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE `images` CHANGE `fid` `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE `nodes` CHANGE `nid` `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE `priv_msgs` CHANGE `mid` `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE `sessions` CHANGE `sid` `id` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;
ALTER TABLE `tags` CHANGE `tid` `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'tag id';
ALTER TABLE `users` CHANGE `uid` `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `images` DROP `list`;
ALTER TABLE `priv_msgs` DROP `subject`;
ALTER TABLE `users` DROP `phpass`;
