
ALTER TABLE `comments` ADD `new_id` INT NOT NULL DEFAULT '0' AFTER `id`;
SELECT `AUTO_INCREMENT` INTO @id FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'hbbs' AND TABLE_NAME = 'comments';
UPDATE comments SET new_id =@id:=@id-1 ORDER BY id DESC;
UPDATE images i JOIN comments c ON i.cid = c.id SET i.cid = c.new_id;

UPDATE comments SET id = new_id ORDER BY id DESC;

DROP TRIGGER IF EXISTS before_insert_comment;
INSERT INTO comments (id, nid, uid, tid, body, hash, create_time, last_modified_time)
SELECT id, id, uid, tid, body, hash, create_time, last_modified_time FROM nodes;

DROP TRIGGER IF EXISTS before_insert_node;
DROP TRIGGER IF EXISTS before_update_node;

UPDATE images SET cid = nid WHERE cid IS NULL;

ALTER TABLE `comments` DROP `new_id`;
ALTER TABLE `nodes` DROP `body`;

