create table likes(
	idx				int not null auto_increment,
	member_id		varchar(20) not null,
	part				varchar(20) not null,						/* 게시글, 댓글 */
	part_idx 		int not null,
	created_at		datetime default now(),					/* 생성 날짜 */
	parent			varchar(20) default null,				/* board, comment, . . .  */
	parent_id		int default null,
	
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
  	foreign key (member_id) references member(member_id)
);