create table category(
	idx				int not null auto_increment,
	name				varchar() not null,
	is_active		tinyint default 1,						/* 활성화/비활성화 처리(0: 비활성화, 1: 활성화) */
	parent_id		int default null,						/* 하위 카테고리 */
	
	primary key (idx),
    foreign key (parent_id) references comment(idx)
);
