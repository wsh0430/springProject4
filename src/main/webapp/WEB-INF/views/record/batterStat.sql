CREATE TABLE hitter_stats (
    id INT AUTO_INCREMENT PRIMARY KEY, /*mid(넣긴하는데 프론트에 보이진않게해야함)*/
    player VARCHAR(5),	/*선수명*/
    team_logo VARCHAR(50),	/*팀로고*/
    position VARCHAR(5), /*선수포지션*/
    year SMALLINT(5),/*년도*/
    games SMALLINT, /*경기수*/
    tasuk SMALLINT, /*타석*/
    at_bats SMALLINT, /*타수*/
    runs SMALLINT, /*득점*/
    hits SMALLINT, /*안타*/
    doubles SMALLINT, /*2루타*/
    triples SMALLINT, /*3루타*/
    total_bases SMALLINT,	/*루타 : (안타-2루타-3루타-4루타)+2루타x2+3루타x3+홈런x4*/
    rbi SMALLINT,/*타점*/
    home_runs SMALLINT, /*홈런*/
    stolen_bases SMALLINT, /*도루*/
    stolen_bases_fail SMALLINT, /*도루실패*/
    bb SMALLINT, /*사사구*/
    strikeouts SMALLINT, /*삼진*/
    double_plays SMALLINT, /*병살*/
    sac_hits SMALLINT, /*희생타*/
    sac_flies SMALLINT, /*희생플라이*/

    avg FLOAT(5,3), /*타율*/
    obp FLOAT(5,3), /*출루율*/
    slg FLOAT(5,3), /*장타율*/
    ops FLOAT(5,3), /*ops(출루율+장타율)*/
    war FLOAT(5,3)/*대체선수대비 승려기여도(WAR)*/
    
    
);

drop table player_stats;

