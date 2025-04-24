create table game(
	idx						int not null auto_increment,
	game_id					varchar() not null,				/* 게임 고유번호 */
	lineup_id				int not null,	
	team1_id				int not null,
	team2_id				int not null,
	team1_score			int default 0,
	team2_score			int default 0,
	status					varchar() default '예정',			/* 예정, 진행중, 종료 */
	winner					varchar(),
	stadium_id				varchar() not null,				/* 구장 id */
	play_date				datetime not null,					/* 경기 일자 */
	start_at					datetime,								/* 경기 시작 시간 */
	end_at					datetime									/* 경기 종료 시간 */
	
	primary key (idx),
    foreign key (member_id) references member(member_id),
    foreign key (team1_id) references team(idx),
    foreign key (team2_id) references team(idx),
    foreign key (stadium_id) references stadium(idx),
    foreign key (lineup_id) references lineup(idx)
);