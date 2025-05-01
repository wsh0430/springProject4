-- position마다 데이터 개수가 동일해야함... 나중에 수정 예정
create table advertisement(
	idx						int not null auto_increment,
	title					varchar(50) not null unique key,					/* 광고 제목 */
	image_url 				text not null,					/* 광고 이미지 경로 */
	link_url 				text not null,					/* 광고 페이지 경로 */					
	position				varchar(30) default 'main-top',		/* 위치(main-top: 상단, main-left: 사이드(좌) . . . ) */	
	start_at				datetime default now(),						/* 광고 시작일  */
	end_at					datetime default now(),						/* 광고 종료일 */
	click_count				int default 0,							/* 클릭  수 */
	report_count			int default 0,						/* 신고 당한 수 */
	is_active 				tinyint default 0,						/* 활성화 여부(0: false, 1: true) */
	
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
	
	primary key (idx)
);