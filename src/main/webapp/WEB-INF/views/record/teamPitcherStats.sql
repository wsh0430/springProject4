CREATE TABLE team_pitcher_stats (
    id INT AUTO_INCREMENT PRIMARY KEY,          -- 내부용 PK (프론트에 노출 X)
    team_name VARCHAR(15),                         -- 선수명
    team_logo VARCHAR(200),                     -- 팀 로고 URL
    year SMALLINT(5),                           -- 연도

    war FLOAT(5,2),                              -- WAR
    games_p SMALLINT(5),                              -- 경기수 (G)
    games_start SMALLINT(5),                        -- 선발 (GS)
    complete_games SMALLINT(5),                     -- 완투 (CG)
    shutouts SMALLINT(5),                           -- 완봉 (SHO)
    wins SMALLINT(5),                               -- 승 (W)
    losses SMALLINT(5),                             -- 패 (L)
    saves SMALLINT(5),                              -- 세이브 (S)
    holds SMALLINT(5),                              -- 홀드 (HD)
    innings FLOAT(10,2),                          -- 이닝 (IP)
    earned_runs SMALLINT(5),                        -- 자책점 (ER)
    runs_allowed SMALLINT(5),                               -- 실점 (R)
    hits_allowed SMALLINT(5),                       -- 피안타 (H)
    home_runs_allowed SMALLINT(5),                  -- 피홈런 (HR)
    bb_allowed SMALLINT(5),                 -- 사사구 (BB)
    strikeouts SMALLINT(5),                         -- 탈삼진 (SO)
    balks SMALLINT(5),                              -- 보크 (BK)
    wild_pitches SMALLINT(5),                       -- 폭투 (WP)

    era FLOAT(5,2),                              -- 평균자책점 (ERA)
    fip FLOAT(5,2),                              -- FIP
    whip FLOAT(5,2)                              -- WHIP
);
SELECT * FROM team_pitcher_stats;
drop table team_pitcher_stats;