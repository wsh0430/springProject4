create table player_info(
	idx						int not null auto_increment,
	team_id					int,
	player					varchar(15) not null,		/* 이름 */
	position					varchar(5) not null,		/* 포지션 */
	birth						datetime,						/* 생년월일 */
	nationality				varchar(30),					/* 국적 */
	height					varchar(10),		 			/* 키 */
	weight					varchar(10),					/* 몸무게 */
	uniform_number		int,								/* 등번호 */
	elementary_school	varchar(30),					/* 초등학교 */
	middle_school			varchar(30),					/* 중학교 */
	high_school			varchar(30),					/* 고등학교 */
	draft_info				varchar(30),					/* 신인지명 */
	active_years			varchar(20),					/* 활약연도 */
	career_teams			varchar(10),					/* 활약팀 */
	
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
    foreign key (team_id) references team(idx)
);

이름/연도/포지션/팀 모두 겹치는 선수x
랭킹		< 그냥 비교해서 넣으면 될 것 같기도