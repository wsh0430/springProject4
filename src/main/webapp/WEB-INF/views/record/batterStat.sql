CREATE TABLE player_stats (
    id INT AUTO_INCREMENT PRIMARY KEY, /*mid*/
    player VARCHAR(10),	/*선수명*/
    team_logo VARCHAR(20),	/**/
    position VARCHAR(5),
    rank INT,/*순위(뺴야함)*/
    year INT,/*년도*/
    war INT,/*대체선수대비 승려기여도(WAR)*/
    games INT, /*경기수*/
    plate_appearances INT, /**/
    at_bats INT,
    runs INT,
    hits INT,
    doubles INT,
    triples INT,
    total_bases INT,	
    rbi INT,
    home_runs INT,
    stolen_bases INT,
    caught_stealing INT,
    bb INT,
    strikeouts INT,
    double_plays INT,
    sac_hits INT,
    sac_flies INT,

    avg DOUBLE(5,3),
    obp DOUBLE(5,3),
    slg DOUBLE(5,3),
    ops DOUBLE(5,3)
);