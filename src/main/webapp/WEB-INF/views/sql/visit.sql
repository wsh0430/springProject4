create table visit(
	visit_date		datetime not null default now(),
	visit_count		int not null default 1,
	host_ip			varchar(30) not null default 0,
	
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
	item_tinyint			tinyint
);