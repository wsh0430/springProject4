create table lineup(
	idx						int not null auto_increment,
	game_id					int not null,
	team_id					int not null,
	player_id				int not null,
	batting_order			int,												/* 타순 */
	position					varchar(),										/* 포지션 */
	is_starting				tinyint default 0,							/* 선발 여부(0: 미출전, 1: 출전) */
	created_at				datetime default now()
	
	primary key (idx),
    foreign key (game_id) references game(idx),
    foreign key (team_id) references team(idx),
    foreign key (player_id) references player(idx)
);