CREATE TABLE `member_team` (
	`member_id` INT NOT NULL COMMENT 'member',
	`team_id` INT NOT NULL,
	
	-- 여유 index
	item_int1				int,
	item_int2				int,
	item_int3				int,
	item_varchar			varchar(100),
	item_varchar2			varchar(100),
	item_varchar3			varchar(100),
	item_text				text,
	item_datetime1		datetime,
	item_datetime2		datetime,
	item_tinyint			tinyint,
	
	INDEX `team_id` (`team_id`) USING BTREE,
	INDEX `member_id` (`member_id`) USING BTREE
)
COMMENT='회원 선호 팀\r\nmember - team을 이어줌'
COLLATE='utf8mb4_0900_ai_ci'
ENGINE=InnoDB
;