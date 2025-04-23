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
	is_deleted				tinyint default 0,					/* 삭제 유무(0: false, 1: true) */
	
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
