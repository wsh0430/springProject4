create table board(
	idx						int not null auto_increment,	/* 고유번호 */
	member_id				varchar(20) not null,				/* 작성자 Id(fk to member) */
	member_nickname	varchar(20) not null,				/* 작성자 닉네임 */
	category_name		varchar(50) not null,				/* 카테고리(fk to category_name) */
	title						varchar(100) not null,			/* 제목 */
	content					text not null,							/* 내용 */
	view_count				int default 0,						/* 조회수 */
	like_count				int default 0,						/* 추천수 */
	comment_count		int default 0,						/* 댓글수 */
	report_count		    int default 0,						/* 신고 당한 수 */
	created_at				datetime default now(),			/* 생성 날짜 */
	update_at				datetime default now(),			/* 수정 날짜 */
	delete_check			tinyint default 0,					/* 삭제 유무(0: false, 1: true) */
	hide_check				tinyint default 0,
	
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
	
	primary key (idx),
  	foreign key (member_id) references member(member_id),
  	foreign key (category_name) references category(name)
);

INSERT INTO board (
	member_id, member_nickname, category_name, title, content,
	view_count, like_count, comment_count, report_count,
	created_at, update_at, is_deleted
) VALUES (
	'user123', 'coolNick', '두산',
	'오늘 경기 정말 대박이었어요!', 
	'LG 트윈스와 두산 베어스의 경기가 정말 치열했네요. 9회말 역전승이라니!',
	132, 15, 4, 0,
	NOW(), NOW(), 0
);



-- 추가 키  int(3), varchar(3), text(1), datetime(2), tinyint(1)
item_int					int,
item_int					int,
item_int					int,
item_varchar			varchar(100),
item_varchar			varchar(100),
item_varchar			varchar(100),
item_text				text,
item_datetime			datetime,
item_datetime			datetime,
item_tinyint			tinyint,



INSERT INTO `board` (
    `member_id`, `member_nickname`, `category_name`, `title`, `content`, 
    `view_count`, `like_count`, `comment_count`, `report_count`, `created_at`, 
    `update_at`, `delete_check`, `hide_check`, `item_int1`, `item_int2`, `item_int3`, 
    `item_varchar`, `item_varchar2`, `item_varchar3`, `item_text`, `item_datetime1`, 
    `item_datetime2`, `item_tinyint`
) VALUES
('Admin', 'coolguy', '공지', '두산 베어스 시즌 개막! 응원하세요!', 
 '두산 베어스가 이번 시즌 개막을 맞아 경기를 시작했습니다! 모든 팬들의 응원을 기다립니다. 이번 시즌에도 베어스 화이팅!', 
 150, 30, 5, 0, '2023-04-01 10:00:00', '2023-04-01 10:00:00', 0, 0, NULL, NULL, NULL, NULL, 
 NULL, NULL, NULL, NULL, NULL, NULL),
('heroes2023', 'superhero', '전체', 'LG 트윈스 경기 리뷰', 
 'LG 트윈스의 최근 경기를 리뷰합니다. 이번 경기는 정말 아쉬웠지만, 다음 경기에서는 승리를 기대합니다. 팀의 강점을 분석해 보았습니다.', 
 200, 25, 12, 0, '2023-04-05 12:30:00', '2023-04-05 12:30:00', 0, 0, NULL, NULL, NULL, NULL, 
 NULL, NULL, NULL, NULL, NULL, NULL),
('giants2023', 'gamer123', '롯데', '롯데 자이언츠 팬들의 모임', 
 '롯데 자이언츠 팬들이 모여서 경기를 응원하고, 정보를 공유하는 게시판입니다. 팬들의 열정을 담아낼 수 있는 공간을 마련했습니다!', 
 100, 15, 20, 0, '2023-03-25 14:00:00', '2023-03-25 14:00:00', 0, 0, NULL, NULL, NULL, NULL, 
 NULL, NULL, NULL, NULL, NULL, NULL),
('eagles2023', 'darkknight', '한화', '한화 이글스 최근 경기 분석', 
 '한화 이글스의 최근 경기를 분석해 봤습니다. 팀의 플레이 스타일과 경기에서의 약점을 짚어보고, 다음 경기를 대비해 보세요.', 
 120, 10, 8, 1, '2023-04-10 16:00:00', '2023-04-10 16:00:00', 0, 0, NULL, NULL, NULL, NULL, 
 NULL, NULL, NULL, NULL, NULL, NULL),
('Admin', 'explorer', '공지', 'KIA 타이거즈 팬미팅 공지', 
 'KIA 타이거즈 팬들을 위한 팬미팅이 개최됩니다! 팬들과 함께 타이거즈의 승리를 기원하며, 팬미팅에서 다양한 활동을 준비했습니다. 많은 참여 부탁드립니다!', 
 250, 50, 10, 0, '2023-05-01 09:00:00', '2023-05-01 09:00:00', 0, 0, NULL, NULL, NULL, NULL, 
 NULL, NULL, NULL, NULL, NULL, NULL);
 
 INSERT INTO board (member_id, member_nickname, category_name, title, content)
VALUES
('sunny_92', '햇살이', 'LG', 'LG 승리! 기분좋다~', '오늘 경기 대박이었어요.'),
('baseball_boy', '홈런왕', '롯데', '롯데는 오늘도 진심이야', '끝까지 응원해요!'),
('hanhwa_girl', '불꽃녀', '한화', '한화 경기 요약', '불꽃처럼 타오른 경기였습니다.'),
('doosan99', '곰돌이', '공지', '[공지] 커뮤니티 이용규칙 안내', '욕설, 광고 금지입니다.'),
('kt_silent', '조용한불꽃', 'KT', 'KT 새로운 기대주', '신인선수 활약 기대돼요.'),
('ssgqueen', '승리여왕', 'SSG', 'SSG 팬 모여라', '다음 직관 모임?'),
('nc_dragon', 'NC돌풍', '공지', '[공지] 이벤트 안내', '다음 주 출석체크 이벤트!'),
('kia_rider', '라이더', '기아', '기아 경기 분석', '오늘 실책이 아쉬웠어요.'),
('samsung_star', '별사탕', '삼성', '삼성 팬과 소통해요', '삼성팬 모임 만나요~'),
('kiwoom_hitter', '히트제조기', '공지', '[공지] 게시판 정비 공지', '게시판이 일부 통합되었습니다.');


INSERT INTO comment (board_id, member_id, member_nickname, content)
VALUES
(1, 'doosan99', '곰돌이', 'LG 응원합니다!'),
(2, 'hanhwa_girl', '불꽃녀', '롯데 화이팅!'),
(3, 'kiwoom_hitter', '히트제조기', '한화 잘했어요~'),
(4, 'sunny_92', '햇살이', '공지 잘 읽었어요.'),
(5, 'ssgqueen', '승리여왕', 'KT는 매력 있어요!'),
(6, 'kia_rider', '라이더', '직관 가고 싶다 ㅠㅠ'),
(7, 'baseball_boy', '홈런왕', '이벤트 기대돼요!'),
(8, 'samsung_star', '별사탕', '기아 실책이 아쉽긴 했어요'),
(9, 'kt_silent', '조용한불꽃', '다음에 뵈요!'),
(10, 'nc_dragon', 'NC돌풍', '공지 확인 완료!');

INSERT INTO board (member_id, member_nickname, category_name, title, content)
VALUES
('sunny_92', '햇살이', 'LG', 'LG 또 승리!', 'LG가 계속 승리하네요! 기분 좋은 하루입니다.'),
('baseball_boy', '홈런왕', '롯데', '롯데 대박 경기!', '롯데 경기 승리했어요. 시즌 기대됩니다.'),
('hanhwa_girl', '불꽃녀', '한화', '한화 팀, 오늘 경기 분석', '오늘 경기에서 한화는 정말 멋졌어요!'),
('doosan99', '곰돌이', '두산', '두산의 불꽃 경기', '두산의 타선이 제대로 터졌습니다. 굿!'),
('kt_silent', '조용한불꽃', 'KT', 'KT, 신인선수 활약!', 'KT의 신인선수가 정말 기대됩니다. 계속 응원할 거예요.'),
('ssgqueen', '승리여왕', 'SSG', 'SSG, 최고의 승리', 'SSG는 오늘 정말 잘했어요. 계속해서 좋은 경기 부탁드립니다!'),
('nc_dragon', 'NC돌풍', 'NC', 'NC 팬들과의 소통', 'NC 팬 여러분, 모두 모여주세요! 함께 응원해요!'),
('kia_rider', '라이더', '기아', '기아의 타격 실력', '기아의 타격력이 점점 좋아지고 있어요. 이번 시즌 기대됩니다!'),
('samsung_star', '별사탕', '삼성', '삼성의 새로운 전략', '삼성은 새로운 전략을 통해 더 강해졌어요. 멋진 경기였습니다.'),
('kiwoom_hitter', '히트제조기', '키움', '키움의 활약', '키움의 경기에서 정말 멋진 활약을 보여주었습니다!'),
('sunny_92', '햇살이', 'LG', 'LG, 승리의 이유', '오늘 승리의 비결은 무엇일까요? 팀워크가 정말 좋았습니다.'),
('baseball_boy', '홈런왕', '롯데', '롯데 팬들의 응원', '롯데 팬들이 보내는 응원이 정말 대단했어요. 계속 힘내요!'),
('hanhwa_girl', '불꽃녀', '한화', '한화, 오늘의 경기 리뷰', '오늘 한화는 실책이 많았지만, 마지막에 승리했네요. 정말 멋졌어요.'),
('doosan99', '곰돌이', '두산', '두산 경기 연습', '두산은 연습을 더 많이 해야 할 것 같아요. 팀워크가 중요한데요!'),
('kt_silent', '조용한불꽃', 'KT', 'KT 선수단 응원', 'KT 선수단 모두 응원합니다! 이번 시즌 정말 기대돼요.'),
('ssgqueen', '승리여왕', 'SSG', 'SSG 경기 분석', 'SSG는 오늘 완벽한 경기를 보여주었어요. 앞으로도 계속 응원할게요!'),
('nc_dragon', 'NC돌풍', 'NC', 'NC의 강력한 타선', 'NC의 타선은 정말 강력하네요! 이번 시즌 기대됩니다.'),
('kia_rider', '라이더', '기아', '기아 타자들의 열정', '기아 타자들이 너무 열심히 해서 정말 멋졌어요.'),
('samsung_star', '별사탕', '삼성', '삼성의 신인선수', '삼성의 신인선수가 정말 잘했어요. 앞으로가 더 기대됩니다!'),
('kiwoom_hitter', '히트제조기', '키움', '키움의 빠른 발', '키움의 선수들이 정말 빠르게 뛰네요. 팀워크가 최고입니다!'),
('sunny_92', '햇살이', 'LG', 'LG의 믿을 수 없는 승리', 'LG가 이렇게까지 잘할 줄 몰랐어요. 정말 대단했습니다.'),
('baseball_boy', '홈런왕', '롯데', '롯데의 반격', '롯데가 반격을 시작했네요. 기대됩니다!'),
('hanhwa_girl', '불꽃녀', '한화', '한화의 승리', '오늘 한화가 정말 멋진 경기를 했어요. 응원합니다!'),
('doosan99', '곰돌이', '두산', '두산의 기분 좋은 승리', '두산이 기분 좋은 승리를 거두었네요. 축하합니다!'),
('kt_silent', '조용한불꽃', 'KT', 'KT, 새로운 선발 투수', 'KT의 새로운 선발 투수가 정말 좋았어요. 기대됩니다!'),
('ssgqueen', '승리여왕', 'SSG', 'SSG의 반전 승리', 'SSG가 멋진 반전 승리를 했습니다. 앞으로도 계속 응원할게요!'),
('nc_dragon', 'NC돌풍', 'NC', 'NC, 오늘의 경기를 돌아보며', 'NC가 오늘 정말 멋진 경기를 보여주었어요!'),
('kia_rider', '라이더', '기아', '기아 경기 후기', '기아가 승리했네요! 타자들 정말 잘했어요!'),
('samsung_star', '별사탕', '삼성', '삼성의 전력 강화', '삼성은 전력을 강화하고 있어요. 기대됩니다.'),
('kiwoom_hitter', '히트제조기', '키움', '키움의 팀워크', '키움은 팀워크가 정말 좋아요. 계속해서 응원할게요.'),
('sunny_92', '햇살이', 'LG', 'LG의 팬 모임', 'LG 팬들과 함께 응원해요!'),
('baseball_boy', '홈런왕', '롯데', '롯데의 신인선수 분석', '롯데의 신인선수가 정말 기대돼요!'),
('hanhwa_girl', '불꽃녀', '한화', '한화, 오늘의 승리', '오늘 한화가 승리했어요. 너무 기뻐요!'),
('doosan99', '곰돌이', '두산', '두산의 대승', '두산은 대승을 거두었네요. 정말 멋졌어요!'),
('kt_silent', '조용한불꽃', 'KT', 'KT 팬들과의 대화', 'KT 팬들이 정말 열정적이에요. 힘내세요!'),
('ssgqueen', '승리여왕', 'SSG', 'SSG의 경기 후', 'SSG가 오늘 정말 잘했어요. 또 봐요!');