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
	foreign key (board_id) references board(idx) on delete cascade,
    foreign key (member_id) references member(member_id),
    foreign key (parent_id) references comment(idx) on delete cascade
);
