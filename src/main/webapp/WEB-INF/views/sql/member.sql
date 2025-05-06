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


INSERT INTO `member` (
    `member_id`, `password`, `nickname`, `name`, `gender`, `tel`, `address`, `email`, 
    `like_team`, `icon`, `content`, `birthday`, `member_info`, `delete_check`, 
    `point`, `level`, `visit_count`, `board_count`, `comment_count`, `report_count`, 
    `warning_count`, `ip`, `start_date`, `last_date`
) VALUES
('lions2023', 'password123', 'coolguy', '홍길동', 'M', '010-1333-5678', '서울시 강남구 삼성로 85', 'user001@example.com', 
 '두산 베어스', 'noicon.jpg', '저는 두산 베어스의 열렬한 팬입니다! 팀의 승리를 기원하며, 베어스의 경기를 자주 봅니다!', '1990-01-01 00:00:00', '공개', 'NO', 
 1020, 1, 200, 50, 10, 2, 0, '192.168.1.101', '2020-03-15 09:30:00', '2023-05-05 17:00:00'),
('heroes2023', 'password456', 'superhero', '김영희', 'F', '010-2345-6789', '서울시 종로구 종로1길 24', 'user002@example.com', 
 'LG 트윈스', 'noicon.jpg', 'LG 트윈스의 팬입니다! LG의 공격력과 투수진 모두 응원합니다. 오늘도 승리를 기원합니다!', '1992-02-14 00:00:00', '공개', 'NO', 
 890, 1, 180, 45, 8, 0, 0, '192.168.1.102', '2021-06-25 14:00:00', '2023-05-05 17:30:00'),
('giants2023', 'password789', 'gamer123', '박철수', 'M', '010-3456-7890', '서울시 마포구 성산로 160', 'user003@example.com', 
 '롯데 자이언츠', 'noicon.jpg', '롯데 자이언츠의 팬입니다! 항상 힘차게 경기를 응원하며, 팀의 승리를 믿고 있습니다. 자이언츠 화이팅!', '1988-10-05 00:00:00', '공개', 'NO', 
 1300, 1, 450, 100, 50, 5, 1, '192.168.1.103', '2019-12-20 10:45:00', '2023-05-05 18:00:00'),
('eagles2023', 'password321', 'darkknight', '이민호', 'M', '010-4567-8901', '서울시 송파구 송파대로 25', 'user004@example.com', 
 '한화 이글스', 'noicon.jpg', '한화 이글스를 응원하는 이민호입니다! 승리를 위한 응원의 메시지를 남깁니다. 화이팅!', '1985-07-15 00:00:00', '비공개', 'NO', 
 1200, 1, 150, 60, 15, 0, 0, '192.168.1.104', '2021-04-18 13:15:00', '2023-05-05 18:30:00'),
('tigers2023', 'password654', 'explorer', '정지훈', 'F', '010-5678-9012', '서울시 용산구 한강로2가 100', 'user005@example.com', 
 'KIA 타이거즈', 'noicon.jpg', 'KIA 타이거즈의 팬입니다. 항상 KIA의 승리를 기원하며, 매 경기를 기대하고 있습니다!', '1995-11-30 00:00:00', '공개', 'NO', 
 1100, 1, 170, 55, 20, 0, 0, '192.168.1.105', '2022-05-30 16:20:00', '2023-05-05 19:00:00');
 
 INSERT INTO member (member_id, password, nickname, name, gender, tel, address, email, like_team, icon, content, ip)
VALUES
('sunny_92', 'pw1234', '햇살이', '김선영', 'F', '010-1234-1111', '서울시 강남구', 'sunny92@example.com', 'LG', 'noicon.jpg', 'LG 트윈스 팬이에요!', '192.168.1.1'),
('baseball_boy', 'pw1234', '홈런왕', '이진수', 'M', '010-5678-2222', '부산시 해운대구', 'jinsoo77@example.com', '롯데', 'noicon.jpg', '롯데 우승 가자!', '192.168.1.2'),
('hanhwa_girl', 'pw1234', '불꽃녀', '박지혜', 'F', '010-1122-3333', '대전시 중구', 'jihye_p@example.com', '한화', 'noicon.jpg', '한화의 불꽃처럼!', '192.168.1.3'),
('nc_dragon', 'pw1234', 'NC돌풍', '최민호', 'M', '010-4433-5555', '창원시 성산구', 'minho_c@example.com', 'NC', 'noicon.jpg', '용처럼 날자 NC!', '192.168.1.4'),
('ssgqueen', 'pw1234', '승리여왕', '윤하나', 'F', '010-3344-6666', '인천시 남동구', 'hana_ssg@example.com', 'SSG', 'noicon.jpg', 'SSG는 감성이다~', '192.168.1.5'),
('kt_silent', 'pw1234', '조용한불꽃', '장도현', 'M', '010-7788-9999', '수원시 팔달구', 'dohyun_k@example.com', 'KT', 'noicon.jpg', 'KT의 미래를 믿어요.', '192.168.1.6'),
('doosan99', 'pw1234', '곰돌이', '정현수', 'M', '010-9090-1212', '서울시 송파구', 'hyunsoo_d@example.com', '두산', 'noicon.jpg', '두산베어스 응원합니다!', '192.168.1.7'),
('kiwoom_hitter', 'pw1234', '히트제조기', '오유진', 'F', '010-4545-8585', '서울시 구로구', 'yujin_o@example.com', '키움', 'noicon.jpg', '히어로즈 화이팅!', '192.168.1.8'),
('samsung_star', 'pw1234', '별사탕', '배진우', 'M', '010-3698-3698', '대구시 수성구', 'jinwoo_s@example.com', '삼성', 'noicon.jpg', '삼성의 전설이 되자!', '192.168.1.9'),
('kia_rider', 'pw1234', '라이더', '서유나', 'F', '010-2468-1357', '광주시 북구', 'yuna_k@example.com', '기아', 'noicon.jpg', '타이거즈 팬이에요~', '192.168.1.10');

INSERT INTO `member` (
  `member_id`, `password`, `nickname`, `name`, `gender`, `tel`, `address`, `email`, 
  `like_team`, `icon`, `content`, `birthday`, `member_info`, `delete_check`, 
  `point`, `level`, `visit_count`, `board_count`, `comment_count`, 
  `report_count`, `warning_count`, `ip`, `start_date`, `last_date`
) VALUES
('skywalker93', '1234', '스카이워커', '박민수', 'M', '010-1000-1001', '서울 강남구 역삼동', 'skywalker93@email.com', '롯데', 'noicon.jpg', '롯데 팬으로서 항상 응원합니다!', '1993-06-22', '공개', 'NO', 1050, 1, 15, 5, 10, 0, 0, '192.168.0.1', NOW(), NOW()),
('hanbin_07', '1234', '한빈짱', '김한빈', 'M', '010-1000-1002', '부산 해운대구 우동', 'hanbin_07@email.com', '두산', 'noicon.jpg', '두산 없으면 하루도 못 살아!', '1996-03-14', '공개', 'NO', 1040, 1, 20, 7, 12, 0, 0, '192.168.0.2', NOW(), NOW()),
('mirae_future', '1234', '미래는우리손에', '이수정', 'F', '010-1000-1003', '대구 수성구 범어동', 'mirae_future@email.com', '기아', 'noicon.jpg', '기아 우승까지 가즈아~', '1992-08-01', '공개', 'NO', 1080, 1, 30, 9, 14, 0, 0, '192.168.0.3', NOW(), NOW()),
('yuna0102', '1234', '유나짱짱', '정유나', 'F', '010-1000-1004', '광주 북구 용봉동', 'yuna0102@email.com', '한화', 'noicon.jpg', '한화 팬은 기다림도 실력입니다.', '1995-01-02', '공개', 'NO', 1100, 1, 12, 3, 9, 0, 0, '192.168.0.4', NOW(), NOW()),
('minseok1990', '1234', '민석왕자', '최민석', 'M', '010-1000-1005', '인천 연수구 송도동', 'minseok1990@email.com', 'SSG', 'noicon.jpg', 'SSG는 전략야구의 정석!', '1990-12-10', '공개', 'NO', 1020, 1, 10, 4, 6, 0, 0, '192.168.0.5', NOW(), NOW()),
('daon_222', '1234', '다온이', '한다온', 'F', '010-1000-1006', '경기 성남시 분당구', 'daon_222@email.com', '삼성', 'noicon.jpg', '삼성 라이온즈 팬! 오직 삼성 뿐!', '1994-04-04', '공개', 'NO', 1010, 1, 14, 6, 10, 0, 0, '192.168.0.6', NOW(), NOW()),
('lgforever', '1234', '엘쥐불패', '이재훈', 'M', '010-1000-1007', '서울 송파구 잠실동', 'lgforever@email.com', 'LG', 'noicon.jpg', 'LG는 믿고 보는 팀입니다.', '1988-09-09', '공개', 'NO', 1070, 1, 25, 8, 15, 0, 0, '192.168.0.7', NOW(), NOW()),
('kimminseo88', '1234', '민서킴', '김민서', 'F', '010-1000-1008', '부산 사상구 모라동', 'kimminseo88@email.com', 'KT', 'noicon.jpg', 'KT 팬으로서 항상 응원합니다!', '1988-01-18', '공개', 'NO', 1000, 1, 18, 5, 8, 0, 0, '192.168.0.8', NOW(), NOW()),
('baseball_fan10', '1234', '야구는인생', '조상우', 'M', '010-1000-1009', '대전 서구 둔산동', 'baseball_fan10@email.com', 'NC', 'noicon.jpg', 'NC 다이노스의 진격은 시작됐다!', '1991-11-11', '공개', 'NO', 1060, 1, 22, 6, 11, 0, 0, '192.168.0.9', NOW(), NOW()),
('user_alpha', '1234', '오메가파워', '박세영', 'F', '010-1000-1010', '울산 남구 삼산동', 'user_alpha@email.com', '키움', 'noicon.jpg', '키움 히어로즈의 가능성은 무한대!', '1997-07-07', '공개', 'NO', 1030, 1, 19, 7, 13, 0, 0, '192.168.0.10', NOW(), NOW());