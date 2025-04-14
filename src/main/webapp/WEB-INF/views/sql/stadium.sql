create table stadium(
	idx						int not null auto_increment,
	name						varchar() not null,
	location					varchar(),									/* 위치 정보 */
	capacity					int,											/* 수용 인원 */
	built_at					datetime,									/* 개장일 */
	
	/* api 관련 컬럼 */
	latitude					decimal(10,7)							/* 위도 */
	longitude				decimal(10,7)							/* 경도 */
	--추가
	
	primary key (idx),
	unique(name)
	
);
