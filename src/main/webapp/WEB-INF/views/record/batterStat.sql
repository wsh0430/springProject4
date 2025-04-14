CREATE TABLE player_stats (
    id INT AUTO_INCREMENT PRIMARY KEY, /*mid(넣긴하는데 프론트에 보이진않게해야함)*/
    rank INT,/*순위(뺴야함)*/
    player VARCHAR(10),	/*선수명*/
    team_logo VARCHAR(20),	/*팀로고*/
    position VARCHAR(5), /*선수포지션*/
    war INT,/*대체선수대비 승려기여도(WAR)*/
    year INT,/*년도*/
    games INT, /*경기수*/
    tasuk INT, /*타석*/
    at_bats INT, /*타수*/
    runs INT, /*득점*/
    hits INT, /*안타*/
    doubles INT, /*2루타*/
    triples INT, /*3루타*/
    total_bases INT,	/*루타 : (안타-2루타-3루타-4루타)+2루타x2+3루타x3+홈런x4*/
    rbi INT,/*타점*/
    home_runs INT, /*홈런*/
    stolen_bases INT, /*도루*/
    stolen_bases_fail INT, /*도루실패*/
    bb INT, /*사사구*/
    strikeouts INT, /*삼진*/
    double_plays INT, /*병살*/
    sac_hits INT, /*희생타*/
    sac_flies INT, /*희생플라이*/

    avg DOUBLE(5,3), /*타율*/
    obp DOUBLE(5,3), /*출루율*/
    slg DOUBLE(5,3), /*장타율*/
    ops DOUBLE(5,3) /*ops(출루율+장타율)*/
    
    
);

