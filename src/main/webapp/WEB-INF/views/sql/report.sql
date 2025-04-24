create table report(
	idx	int not null auto_increment,
	member_id		varchar(20) not null,			/* 관리자인 경우 target멤버에게 경고 보냄 */
	target_member_id	int,
	part				varchar(20) not null,			/* 게시글, 댓글, 멤버, 광고? */
	part_idx			int not null,
	reason			text,
	created_at		datetime default now(),		/* 생성 날짜 */
	
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
  	foreign key (target_member_id) references member(member_id)
);