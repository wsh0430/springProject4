CREATE TABLE `team` (
	`idx` INT NOT NULL AUTO_INCREMENT COMMENT '팀 고유번호',
	`name_kor` VARCHAR(20) NOT NULL COMMENT '팀 이름(한글)' COLLATE 'utf8mb4_0900_ai_ci',
	`name_eng` VARCHAR(30) NOT NULL COMMENT '팀 이름(영어)' COLLATE 'utf8mb4_0900_ai_ci',
	`founded` YEAR NOT NULL COMMENT '창단 연도',
	`home_city` VARCHAR(20) NOT NULL COMMENT '연고지' COLLATE 'utf8mb4_0900_ai_ci',
	`championships` INT NOT NULL DEFAULT '0' COMMENT '우승 횟수',
	`runner_up` INT NOT NULL DEFAULT '0' COMMENT '준우승 횟수',
	`last_championship` YEAR NOT NULL DEFAULT '0' COMMENT '마지막 우승 연도',
	`logo` VARCHAR(100) NOT NULL DEFAULT 'nologo.jpg' COMMENT '로고' COLLATE 'utf8mb4_0900_ai_ci',
	`home_stadium_id` VARCHAR(50) NULL DEFAULT NULL COMMENT '홈구장' COLLATE 'utf8mb4_0900_ai_ci',
	`manager` VARCHAR(20) NOT NULL DEFAULT '미지정' COMMENT '감독' COLLATE 'utf8mb4_0900_ai_ci',
	`owner` VARCHAR(20) NOT NULL DEFAULT '미지정' COMMENT '구단주' COLLATE 'utf8mb4_0900_ai_ci',
	`general_manager` VARCHAR(20) NOT NULL DEFAULT '미지정' COMMENT '단장' COLLATE 'utf8mb4_0900_ai_ci',
	`website` VARCHAR(100) NULL DEFAULT '미지정' COMMENT '웹사이트' COLLATE 'utf8mb4_0900_ai_ci',
	PRIMARY KEY (`idx`) USING BTREE,
	foreign key (home_stadium_id) REFERENCES stadium(idx)
)
COMMENT='야구 팀'
COLLATE='utf8mb4_0900_ai_ci'
ENGINE=InnoDB
;
