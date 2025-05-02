create table category(
	idx				int not null auto_increment,
	name				varchar(50) not null,					/* 카테고리명 */
	is_active		tinyint default 1,						/* 활성화/비활성화 처리(0: 비활성화, 1: 활성화) */
	is_admin		tinyint default 0,
	parent_name		varchar(50) default null,						/* 하위 카테고리 */
	
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
	unique key(name),
    foreign key (parent_name) references category(name)
);
