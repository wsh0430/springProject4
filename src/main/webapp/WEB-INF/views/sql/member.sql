CREATE TABLE `member` (
	`idx` INT NOT NULL AUTO_INCREMENT COMMENT '회원 고유번호',
	`member_id` VARCHAR(20) NOT NULL COMMENT '회원 아이디(중복x)' COLLATE 'utf8mb4_0900_ai_ci',
	`password` VARCHAR(25) NOT NULL COMMENT '회원 비밀번호(암호화)' COLLATE 'utf8mb4_0900_ai_ci',
	`nickname` VARCHAR(20) NOT NULL COMMENT '회원 별명(중복x)' COLLATE 'utf8mb4_0900_ai_ci',
	`name` VARCHAR(20) NOT NULL COMMENT '회원 성명' COLLATE 'utf8mb4_0900_ai_ci',
	`tel` VARCHAR(15) NOT NULL COMMENT '전화번호(api, 중복x) 만약 이메일 인증 사용하면 null허용' COLLATE 'utf8mb4_0900_ai_ci',
	`address` VARCHAR(100) NOT NULL COMMENT '주소(api)' COLLATE 'utf8mb4_0900_ai_ci',
	`email` VARCHAR(100) NULL DEFAULT NULL COMMENT '이메일(api, 중복x) 만약 전화번호 인증 사용하면 null 허용' COLLATE 'utf8mb4_0900_ai_ci',
	`icon` VARCHAR(100) NOT NULL DEFAULT 'noicon.jpg' COMMENT '회원 아이콘' COLLATE 'utf8mb4_0900_ai_ci',
	`content` TEXT NULL DEFAULT NULL COMMENT '회원 소개' COLLATE 'utf8mb4_0900_ai_ci',
	`info` CHAR(3) NULL DEFAULT '공개' COMMENT '정보 공개 여부(공개/비공개)' COLLATE 'utf8mb4_0900_ai_ci',
	`delete_check` CHAR(2) NULL DEFAULT 'NO' COMMENT '탈퇴 신청 여부(OK/NO)' COLLATE 'utf8mb4_0900_ai_ci',
	`point` INT NULL DEFAULT '0' COMMENT '포인트',
	`level` INT NULL DEFAULT '3' COMMENT '회원등급(고민중)',
	`visit_count` INT NULL DEFAULT '0' COMMENT '방문 수',
	`board_count` INT NULL DEFAULT '0' COMMENT '작성 게시글 수',
	`comment_count` INT NULL DEFAULT '0' COMMENT '작성 댓글 수',
	`report_count` INT NULL DEFAULT '0' COMMENT '신고 누적 수(신고 누적 시 제재 가능)',
	`warning_count` INT NULL DEFAULT '0' COMMENT '경고 누적 수',
	`ip` VARCHAR(30) NOT NULL DEFAULT '0' COMMENT '접속IP(암호화)' COLLATE 'utf8mb4_0900_ai_ci',
	`start_date` DATETIME NULL DEFAULT (now()) COMMENT '최초 가입일',
	`last_date` DATETIME NULL DEFAULT (now()) COMMENT '마지막 접속일',
	
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
	
	PRIMARY KEY (`idx`) USING BTREE,
	UNIQUE INDEX `tel` (`tel`) USING BTREE,
	UNIQUE INDEX `member_id` (`member_id`) USING BTREE,
	UNIQUE INDEX `email` (`email`) USING BTREE
)
COLLATE='utf8mb4_0900_ai_ci'
ENGINE=InnoDB
;


INSERT INTO member (
  member_id, password, nickname, name, gender, tel,
  address, email, like_team, icon, content, birthday,
  member_info, delete_check, point, level, visit_count,
  board_count, comment_count, report_count, warning_count,
  ip, start_date, last_date
) VALUES (
  'user123',                                -- member_id
  'encrypted_password',                     -- password (암호화된 문자열 필요)
  '닉네임123',                               -- nickname
  '홍길동',                                  -- name
  'M',                                      -- gender
  '010-1234-5678',                          -- tel
  '서울특별시 어딘가',                        -- address
  'user123@example.com',                    -- email
  '선택안함',                                -- like_team
  'noicon.jpg',                             -- icon
  '안녕하세요. 소개입니다.',                   -- content
  NOW(),                                    -- birthday
  '공개',                                   -- member_info
  'NO',                                     -- delete_check
  1000,                                     -- point
  1,                                        -- level
  0, 0, 0, 0, 0,                             -- visit_count ~ warning_count
  '127.0.0.1',                              -- ip
  NOW(), NOW()                              -- start_date, last_date
);