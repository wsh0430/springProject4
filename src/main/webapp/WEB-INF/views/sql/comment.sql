create table comment(
	idx						int not null auto_increment,
	board_id				int not null, 
	member_id				varchar() not null,
	content					text not null,
	comment_count		int default 0,							/* 신고 당한 수 */
	created_at				datetime default now(),				/* 생성 날짜 */
	update_at				datetime default now(),				/* 수정 날짜 */
	parent_id 				int default null,       					/* 값이 있으면 대댓글 */
	
	primary key (idx),
	foreign key (board_id) references board(idx),
    foreign key (member_id) references member(member_id),
    foreign key (parent_id) references comment(idx)
);
