create table scoreboard(
	idx						int not null auto_increment,
	part						varchar(20) not null,					/* 팀, 선수, 시즌, 통산 등 */
	part_idx					int not null,
	
	year						datetime 	
	/* 정보 넣기 */
	
	
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
); 