create table lineup(
	idx						int not null auto_increment,
	game_id					int not null,
	team_id					int not null,
	player_id				int not null,
	batting_order			int,												/* 타순 */
	position					varchar(10),										/* 포지션 */
	is_starting				tinyint default 0,							/* 선발 여부(0: 미출전, 1: 출전) */
	created_at				datetime default now(),
	
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
    foreign key (game_id) references game(idx),
    foreign key (team_id) references team(idx),
    foreign key (player_id) references player(idx)
);