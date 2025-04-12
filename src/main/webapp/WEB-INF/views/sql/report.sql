create table report(
	idx	int not null auto_increment,
	member_id		varchar() not null,			/* 관리자인 경우 target멤버에게 경고 보냄 */
	target_member_id	int,
	part				varchar() not null,			/* 게시글, 댓글, 멤버, 광고? */
	part_idx			int not null,
	reason			text,
	created_at		datetime default now(),		/* 생성 날짜 */
	primary key (idx),
  	foreign key (member_id) references member(member_id),
  	foreign key (target_member_id) references member(member_id)
);