create table file(
	idx						int not null auto_increment,
	member_id				varchar(20) not null,
	part						varchar(20) not null,				/* board, comment, */
	name						varchar(100) not null,				/* 파일 이름 */
	server_name			varchar(100) not null,				/* 파일 서버 저장 시 이름 */
	size						int not null,							/* 파일 크기 */
	download_count		int default 0,						/* 다운로드 수 */
	upload_at				datetime default now(),			/* 업로드 날짜 */
	is_deleted				tinyint default 0,					/* 삭제 유무(0: false, 1: true) */
	
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
    foreign key (member_id) references member(member_id)
);
