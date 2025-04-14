create table visit(
	visit_date		datetime not null default now(),
	visit_count		int not null default 1
);