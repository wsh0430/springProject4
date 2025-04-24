CREATE TABLE `member_team` (
	`member_id` INT NOT NULL COMMENT 'member',
	`team_id` INT NOT NULL,
	INDEX `team_id` (`team_id`) USING BTREE,
	INDEX `member_id` (`member_id`) USING BTREE
)
COMMENT='회원 선호 팀\r\nmember - team을 이어줌'
COLLATE='utf8mb4_0900_ai_ci'
ENGINE=InnoDB
;