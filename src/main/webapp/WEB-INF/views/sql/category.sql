create table category(
	idx				int not null auto_increment,
	name				varchar(50) not null,					/* 카테고리명 */
	is_active		tinyint default 1,						/* 활성화/비활성화 처리(0: 비활성화, 1: 활성화) */
	parent_name		varchar(50) default null,						/* 하위 카테고리 */
	
	primary key (idx),
	unique key(name),
    foreign key (parent_name) references category(name)
);
