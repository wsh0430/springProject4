create table player(
	idx						int not null auto_increment,
	team_id					int,
	name_kor				varchar() not null,		/* 이름 fk걸기 */
	name_eng				varchar() not null,		
	position					varchar() not null,		/* 포지션 */
	birth						datetime,						/* 생년월일 */
	nationality				varchar(),						/* 국적 */
	height					varchar(),			 			/* 키 */
	weight					varchar(),						/* 몸무게 */
	uniform_number		int,								/* 등번호 */
	elementary_school	varchar(),						/* 초등학교 */
	middle_school			varchar(),						/* 중학교 */
	high_school			varchar(),						/* 고등학교 */
	draft_info				varchar(),						/* 신인지명 */
	active_years			varchar(),						/* 활약연도 */
	career_teams			varchar(),						/* 확약팀 */
);

랭킹		< 그냥 비교해서 넣으면 될 것 같기도