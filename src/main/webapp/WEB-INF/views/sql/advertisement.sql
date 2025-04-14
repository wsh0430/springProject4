create table advertisement(
	idx						int not null auto_increment,
	title						varchar() not null,					/* 광고 제목 */
	image_url 				varchar() not null,					/* 광고 이미지 경로 */
	link_url 					varchar() not null,					/* 광고 페이지 경로 */
	position					varchar() default 'main-top',		/* 위치(main-top: 상단, main-left: 사이드(좌) . . . ) */	
	start_at					datetime not null,						/* 광고 시작일  */
	end_at					datetime not null,						/* 광고 종료일 */
	click_count				int default 0,							/* 클릭  수 */
	report_count			int default 0,						/* 신고 당한 수 */
	is_active 				tinyint default 0,						/* 활성화 여부(0: false, 1: true) */
	
	primary key (idx),
);