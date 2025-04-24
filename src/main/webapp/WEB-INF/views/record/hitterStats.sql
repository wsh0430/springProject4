CREATE TABLE hitter_stats (
    id INT AUTO_INCREMENT PRIMARY KEY, /*mid(넣긴하는데 프론트에 보이진않게해야함)*/
    player VARCHAR(15),	/*선수명*/
    team_logo VARCHAR(200),	/*팀로고*/
    position VARCHAR(5), /*선수포지션*/
    year SMALLINT(10),/*년도*/
    
    games SMALLINT(10), /*경기수*/
    tasuk SMALLINT(10), /*타석*/
    at_bats SMALLINT(10), /*타수*/
    runs SMALLINT(10), /*득점*/
    hits SMALLINT(10), /*안타*/
    doubles SMALLINT(10), /*2루타*/
    triples SMALLINT(10), /*3루타*/
    total_bases SMALLINT(10),	/*루타 : (안타-2루타-3루타-4루타)+2루타x2+3루타x3+홈런x4*/
    rbi SMALLINT(10),/*타점*/
    home_runs SMALLINT(10), /*홈런*/
    stolen_bases SMALLINT(10), /*도루*/
    stolen_bases_fail SMALLINT(10), /*도루실패*/ 
    bb SMALLINT(10), /*사사구*/
    strikeouts SMALLINT(10), /*삼진*/
    double_plays SMALLINT(10), /*병살*/
    sac_hits SMALLINT(10), /*희생타*/
    sac_flies SMALLINT(10), /*희생플라이*/

    avg FLOAT(5,3), /*타율*/
    obp FLOAT(5,3), /*출루율*/
    slg FLOAT(5,3), /*장타율*/
    ops FLOAT(5,3), /*ops(출루율+장타율)*/
    war FLOAT(5,2)/*대체선수대비 승려기여도(WAR)*/
    
    
);

select * from hitter_stats;
drop table hitter_stats;


