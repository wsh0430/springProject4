create table like(
	idx				int not null auto_increment,
	member_id		varchar() not null,
	part				varchar() not null,						/* 게시글, 댓글 */
	part_idx 		int not null,
	created_at		datetime default now()					/* 생성 날짜 */
	primary key (idx),
  	foreign key (member_id) references member(member_id)
);