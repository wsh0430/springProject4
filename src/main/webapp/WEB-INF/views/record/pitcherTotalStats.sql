CREATE TABLE pitcher_total_stats (
    id INT AUTO_INCREMENT PRIMARY KEY,          -- 내부용 PK (프론트에 노출 X)
    player VARCHAR(15),                         -- 선수명
    team_logo VARCHAR(200),                     -- 팀 로고 URL
    year VARCHAR(5),                           -- 연도(통산은 +가 들어가므로 varchar)

    war FLOAT(5,2),                              -- WAR
    games_p SMALLINT,                              -- 경기수 (G)
    games_start SMALLINT,                        -- 선발 (GS)
    complete_games SMALLINT,                     -- 완투 (CG)
    shutouts SMALLINT,                           -- 완봉 (SHO)
    wins SMALLINT,                               -- 승 (W)
    losses SMALLINT,                             -- 패 (L)
    saves SMALLINT,                              -- 세이브 (S)
    holds SMALLINT,                              -- 홀드 (HD)
    innings FLOAT(5,2),                          -- 이닝 (IP)
    earned_runs SMALLINT,                        -- 자책점 (ER)
    runs_allowed SMALLINT,                               -- 실점 (R)
    hits_allowed SMALLINT,                       -- 피안타 (H)
    home_runs_allowed SMALLINT,                  -- 피홈런 (HR)
    bb_allowed SMALLINT,                 -- 사사구 (BB)
    strikeouts SMALLINT,                         -- 탈삼진 (SO)
    balks SMALLINT,                              -- 보크 (BK)
    wild_pitches SMALLINT,                       -- 폭투 (WP)

    era FLOAT(5,2),                              -- 평균자책점 (ERA)
    fip FLOAT(5,2),                              -- FIP
    whip FLOAT(5,2)                              -- WHIP
);

drop table pitcher_total_stats;