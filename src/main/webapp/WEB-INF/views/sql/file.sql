create table file(
	idx						int not null auto_increment,
	member_id				varchar() not null,
	part						varchar() not null,				/* board, comment, */
	name						varchar() not null,				/* 파일 이름 */
	server_name			varchar() not null,				/* 파일 서버 저장 시 이름 */
	size						int not null,							/* 파일 크기 */
	download_count		int default 0,						/* 다운로드 수 */
	upload_at				datetime default now(),			/* 업로드 날짜 */
	is_deleted				tinyint default 0,					/* 삭제 유무(0: false, 1: true) */
	
	primary key (idx),
    foreign key (member_id) references member(member_id)
);
