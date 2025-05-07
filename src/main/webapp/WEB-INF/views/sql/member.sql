CREATE TABLE `member` (
	`idx` INT NOT NULL AUTO_INCREMENT COMMENT '회원 고유번호',
	`member_Id` VARCHAR(20) NOT NULL COMMENT '회원 아이디(중복x)' COLLATE 'utf8mb4_0900_ai_ci',
	`password` VARCHAR(255) NOT NULL COMMENT '회원 비밀번호(암호화)' COLLATE 'utf8mb4_0900_ai_ci',
	`nickName` VARCHAR(20) NOT NULL COMMENT '회원 별명(중복x)' COLLATE 'utf8mb4_0900_ai_ci',
	`name` VARCHAR(10) NOT NULL COMMENT '회원 성명' COLLATE 'utf8mb4_0900_ai_ci',
	`gender` VARCHAR(2) NOT NULL COMMENT '회원 성별' COLLATE 'utf8mb4_0900_ai_ci',
	`tel` VARCHAR(20) NOT NULL COMMENT '전화번호(api, 중복x) 만약 이메일 인증 사용하면 null허용' COLLATE 'utf8mb4_0900_ai_ci',
	`address` VARCHAR(255)   default NULL COMMENT '주소(api)' COLLATE 'utf8mb4_0900_ai_ci',
	`email` VARCHAR(255) not null COMMENT '이메일(api, 중복x) 만약 전화번호 인증 사용하면 null 허용' COLLATE 'utf8mb4_0900_ai_ci',
	`like_Team` VARCHAR(10)  DEFAULT '선택안함' COMMENT '좋아하는 팀 선택' COLLATE 'utf8mb4_0900_ai_ci',
	`icon` VARCHAR(255) NOT NULL DEFAULT 'noicon.jpg' COMMENT '회원 아이콘' COLLATE 'utf8mb4_0900_ai_ci',
	`content` TEXT  DEFAULT NULL COMMENT '회원 소개' COLLATE 'utf8mb4_0900_ai_ci',
	`birthday` datetime default now() COMMENT '회원 생일' COLLATE 'utf8mb4_0900_ai_ci',
	`member_info` CHAR(3)  DEFAULT '공개' COMMENT '정보 공개 여부(공개/비공개)' COLLATE 'utf8mb4_0900_ai_ci',
	`delete_check` CHAR(2)  DEFAULT 'NO' COMMENT '탈퇴 신청 여부(OK/NO)' COLLATE 'utf8mb4_0900_ai_ci',
	`point` INT  DEFAULT '0' COMMENT '포인트 최초가입시 1000포인트 지급, 하루에 1회 방문시 10포인트 증가,  ',
	`level` INT  DEFAULT '1' COMMENT '회원등급(일단 0:관리자 1:회원 10:비회원 100:차단된회원 )',
	`visit_count` INT  DEFAULT '0' COMMENT '방문 수',
	`board_count` INT  DEFAULT '0' COMMENT '작성 게시글 수',
	`comment_count` INT  DEFAULT '0' COMMENT '작성 댓글 수',
	`report_count` INT  DEFAULT '0' COMMENT '신고 누적 수(신고 누적 시 제재 가능)',
	`warning_count` INT  DEFAULT '0' COMMENT '경고 누적 수',
	`ip` VARCHAR(255) NOT NULL DEFAULT '0' COMMENT '접속IP(암호화)' COLLATE 'utf8mb4_0900_ai_ci',
	`start_date` DATETIME  DEFAULT now() COMMENT '최초 가입일',
	`last_date` DATETIME  DEFAULT now() COMMENT '마지막 접속일',
	PRIMARY KEY (`idx`) USING BTREE,
	UNIQUE INDEX `tel` (`tel`) USING BTREE,
	UNIQUE INDEX `member_Id` (`member_Id`) USING BTREE,
	UNIQUE INDEX `email` (`email`) USING BTREE,
	UNIQUE INDEX `nickName` (`nickName`) USING BTREE
)
COLLATE='utf8mb4_0900_ai_ci'
ENGINE=InnoDB
;

show tables;
select * from member;
desc member;


drop table member;
delete from member where memberId = 'admin'
insert into member (
    idx, memberId, password, nickName, name, gender, tel, address, email, likeTeam, icon, content,
    birthday, userInfo, userDelete, point, level, visit_count, board_count, comment_count,
    report_count, warning_count, ip, start_date, last_date
) values (
    1, 'admin', '', 'HITBox감독', '관리자', '남자', '043-225-2111', '사창동 그린아트컴퓨터확원', 'greenArt@naver.com', default, default, 
    '안녕하세요 관리자입니다. 잘부탁드려요 무슨일 있으시면 바로 문의 주세요!', default, default, default, 10000, 0, default, default, default, 
    default, default, default, default, default
);
update member set  tel = '010-1234-1234' where member_Id = 'wjddn7757';
update member set  level = '0' where member_Id = 'admin';
update member set  like_team = '한화' where member_Id = 'wjddn7757';
update member set  member_info = '공개' where member_Id = 'wjddn7757';
SELECT * FROM member WHERE name = '홍정우' AND tel = '010-5527-1398';