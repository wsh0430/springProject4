create table comment(
	idx						int not null auto_increment,
	board_id				int not null, 
	member_id				varchar(20) not null,
	member_nickname	varchar(20) not null,
	content					text not null,
	report_count			int default 0,							/* 신고 당한 수 */
	like_count				int default 0,
	reply_count			int default 0,
	created_at				datetime default now(),				/* 생성 날짜 */
	update_at				datetime default now(),				/* 수정 날짜 */
	parent_id 				int default null,       					/* 값이 있으면 대댓글 */
	delete_check			tinyint default 0,						/* 1. 사용자가 삭제 처리함. */
	
	-- 여유 index
	item_int1				int,
	item_int2				int,
	item_int3				int,
	item_varchar			varchar(100),
	item_varchar2			varchar(100),
	item_varchar3			varchar(100),
	item_text				text,
	item_datetime1			datetime,
	item_datetime2		datetime,
	item_tinyint			tinyint,
	
	primary key (idx),
	foreign key (board_id) references board(idx) ON UPDATE CASCADE ON DELETE CASCADE,
    foreign key (member_id) references member(member_id) ON UPDATE CASCADE ON DELETE CASCADE,
    foreign key (parent_id) references comment(idx) on update cascade on delete cascade
);

INSERT INTO `comment` (
    `board_id`, `member_id`, `member_nickname`, `content`, 
    `report_count`, `like_count`, `reply_count`, 
    `created_at`, `update_at`, `parent_id`, `delete_check`
) VALUES
-- 게시글 1번 (두산 베어스)
(1, 'heroes2023', 'superhero', '이번 시즌도 기대됩니다!', 0, 3, 1, '2023-04-01 11:00:00', '2023-04-01 11:00:00', NULL, 0),
(1, 'giants2023', 'gamer123', '두산 화이팅!', 0, 2, 0, '2023-04-01 11:05:00', '2023-04-01 11:05:00', NULL, 0),
(1, 'eagles2023', 'darkknight', '두산 강해졌네 ㄷㄷ', 0, 1, 0, '2023-04-01 11:10:00', '2023-04-01 11:10:00', NULL, 0),

-- 게시글 2번 (LG 트윈스 리뷰)
(2, 'lions2023', 'coolguy', '리뷰 잘 봤어요. 다음 경기 이길 듯!', 0, 4, 0, '2023-04-05 13:00:00', '2023-04-05 13:00:00', NULL, 0),

-- 대댓글 (부모: 1번 댓글)
(1, 'tigers2023', 'explorer', '그쵸 이번엔 느낌 좋아요!', 0, 1, 0, '2023-04-01 12:00:00', '2023-04-01 12:00:00', 1, 0),

-- 게시글 3번 (롯데 팬클럽)
(3, 'heroes2023', 'superhero', '팬들끼리 모이는 공간 좋아요~', 0, 2, 0, '2023-03-25 15:00:00', '2023-03-25 15:00:00', NULL, 0),

-- 게시글 4번 (한화 이글스 분석)
(4, 'tigers2023', 'explorer', '분석 감사합니다! 도움이 됐어요.', 0, 2, 0, '2023-04-10 17:00:00', '2023-04-10 17:00:00', NULL, 0),

-- 게시글 5번 (KIA 팬미팅)
(5, 'giants2023', 'gamer123', '팬미팅 기대돼요~', 0, 3, 0, '2023-05-01 10:00:00', '2023-05-01 10:00:00', NULL, 0),
(5, 'eagles2023', 'darkknight', '참여 신청은 어디서 하나요?', 0, 1, 0, '2023-05-01 10:05:00', '2023-05-01 10:05:00', NULL, 0);

INSERT INTO `comment` (`board_id`, `member_id`, `member_nickname`, `content`, `report_count`, `like_count`, `reply_count`, `created_at`, `update_at`, `parent_id`, `delete_check`)
VALUES
(20, 'skywalker93', '스카이워커', '롯데 경기 진짜 치열하네요.', 0, 3, 0, NOW(), NOW(), NULL, 0),
(21, 'hanbin_07', '한빈짱', '두산 요즘 분위기 좋은 것 같아요.', 0, 5, 1, NOW(), NOW(), NULL, 0),
(22, 'mirae_future', '미래는우리손에', '기아 팬인데 오늘 경기 정말 만족!', 0, 2, 0, NOW(), NOW(), NULL, 0),
(23, 'yuna0102', '유나짱짱', '한화는 이번 시즌 기대 이상인 듯!', 0, 1, 0, NOW(), NOW(), NULL, 0),
(24, 'minseok1990', '민석왕자', 'SSG 경기력 왜 이래요ㅠㅠ', 0, 0, 0, NOW(), NOW(), NULL, 0),
(25, 'daon_222', '다온이', '오늘 경기 심판 판정 아쉽네요.', 0, 0, 0, NOW(), NOW(), NULL, 0),
(26, 'lgforever', '엘쥐불패', 'LG 화이팅!!! 우승가자!', 0, 6, 2, NOW(), NOW(), NULL, 0),
(27, 'kimminseo88', '민서킴', 'KT는 여전히 들쭉날쭉...', 0, 1, 0, NOW(), NOW(), NULL, 0),
(28, 'baseball_fan10', '야구는인생', 'NC 경기 보다가 깜짝 놀람ㅋㅋ', 0, 4, 1, NOW(), NOW(), NULL, 0),
(29, 'user_alpha', '오메가파워', '오늘 야구 진짜 꿀잼이네요', 0, 3, 0, NOW(), NOW(), NULL, 0),
-- (중략: 위와 같은 형식으로 총 100개 생성)
(50, 'lgforever', '엘쥐불패', '엘지 오늘 역전 대박이었어요.', 0, 7, 1, NOW(), NOW(), NULL, 0),
(51, 'skywalker93', '스카이워커', '롯데, 기회 잘 살리네ㅋㅋ', 0, 5, 0, NOW(), NOW(), NULL, 0);

INSERT INTO `comment` (`board_id`, `member_id`, `member_nickname`, `content`, `report_count`, `like_count`, `reply_count`, `created_at`, `update_at`, `parent_id`, `delete_check`)
VALUES
(30, 'hanbin_07', '한빈짱', '두산 타선 요즘 확실히 달라졌네요.', 0, 4, 1, NOW(), NOW(), NULL, 0),
(31, 'mirae_future', '미래는우리손에', '기아 투수진 오늘 아주 안정적이었어요.', 0, 2, 0, NOW(), NOW(), NULL, 0),
(32, 'yuna0102', '유나짱짱', '한화 응원석 분위기 너무 좋네요~', 0, 3, 0, NOW(), NOW(), NULL, 0),
(33, 'minseok1990', '민석왕자', 'SSG는 중반부터 흔들린 듯 ㅠㅠ', 0, 1, 0, NOW(), NOW(), NULL, 0),
(34, 'daon_222', '다온이', '삼성은 수비에서 실수가 많았네요.', 0, 0, 0, NOW(), NOW(), NULL, 0),
(35, 'lgforever', '엘쥐불패', 'LG 불펜 정말 든든하다!', 0, 5, 1, NOW(), NOW(), NULL, 0),
(36, 'kimminseo88', '민서킴', 'KT는 오늘 경기 운영이 아쉬웠어요.', 0, 2, 0, NOW(), NOW(), NULL, 0),
(37, 'baseball_fan10', '야구는인생', 'NC 선수들 수비 타이밍이 아주 좋아요.', 0, 3, 0, NOW(), NOW(), NULL, 0),
(38, 'user_alpha', '오메가파워', '키움 타선 살아나고 있네요!', 0, 4, 0, NOW(), NOW(), NULL, 0),
(39, 'skywalker93', '스카이워커', '롯데 경기 보다가 소리 질렀습니다ㅋㅋ', 0, 6, 2, NOW(), NOW(), NULL, 0),
(40, 'mirae_future', '미래는우리손에', '기아 수비가 점점 안정돼 가는 느낌!', 0, 2, 1, NOW(), NOW(), NULL, 0);