create table board(
	idx						int not null auto_increment,	/* 고유번호 */
	member_id				varchar() not null,				/* 작성자(fk to member) */
	category_id			int not null,							/* 카테고리(fk to category) */
	title						varchar() not null,				/* 제목 */
	content					text not null,							/* 내용 */
	view_count				int default 0,						/* 조회수 */
	like_count				int default 0,						/* 추천수 */
	comment_count		int default 0,						/* 댓글수 */
	comment_count		int default 0,						/* 신고 당한 수 */
	created_at				datetime default now(),			/* 생성 날짜 */
	update_at				datetime default now(),			/* 수정 날짜 */
	is_deleted				tinyint default 0,					/* 삭제 유무(0: false, 1: true) */
	
	primary key (idx),
  	foreign key (member_id) references member(member_id),
  	foreign key (category_id) references category(idx)
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
