create table comment(
	idx						int not null auto_increment,
	board_id				int not null, 
	member_id				varchar(20) not null,
	content					text not null,
	comment_count		int default 0,							/* 신고 당한 수 */
	created_at				datetime default now(),				/* 생성 날짜 */
	update_at				datetime default now(),				/* 수정 날짜 */
	parent_id 				int default null,       					/* 값이 있으면 대댓글 */
	
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
	foreign key (board_id) references board(idx),
    foreign key (member_id) references member(member_id),
    foreign key (parent_id) references comment(idx)
);
