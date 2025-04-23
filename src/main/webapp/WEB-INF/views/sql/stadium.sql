create table stadium(
	idx						int not null auto_increment,
	name						varchar(30) not null,
	location					varchar(100),							/* 위치 정보 */
	capacity					int,											/* 수용 인원 */
	built_at					datetime,									/* 개장일 */
	
	/* api 관련 컬럼 */
	latitude					decimal(10,7)							/* 위도 */
	longitude				decimal(10,7)							/* 경도 */
	--추가
	
	
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
	unique(name)
	
);
