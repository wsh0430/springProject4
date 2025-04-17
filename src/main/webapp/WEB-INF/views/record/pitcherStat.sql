CREATE TABLE pitcher_stats (
    id INT AUTO_INCREMENT PRIMARY KEY,          -- 내부용 PK (프론트에 노출 X)
    player VARCHAR(50),                         -- 선수명
    team_logo VARCHAR(200),                     -- 팀 로고 URL
    position VARCHAR(5), /*선수포지션, 어차피 투수는 1*/
    year SMALLINT(5),                           -- 연도
    

    games SMALLINT,                              -- 경기수 (G)
    games_start SMALLINT,                        -- 선발 (GS)
    games_relieved SMALLINT,                     -- 구원 (GR)
    complete_games SMALLINT,                     -- 완투 (CG)
    shutouts SMALLINT,                           -- 완봉 (SHO)
    wins SMALLINT,                               -- 승 (W)
    losses SMALLINT,                             -- 패 (L)
    saves SMALLINT,                              -- 세이브 (S)
    holds SMALLINT,                              -- 홀드 (HD)
    earned_runs SMALLINT,                        -- 자책점 (ER)
    runs SMALLINT,                               -- 실점 (R)
    hits_allowed SMALLINT,                       -- 피안타 (H)
    home_runs_allowed SMALLINT,                  -- 피홈런 (HR)
    walks_hit_by_pitch SMALLINT,                 -- 사사구 (BB)
    strikeouts SMALLINT,                         -- 탈삼진 (SO)
    balks SMALLINT,                              -- 보크 (BK)
    wild_pitches SMALLINT,                       -- 폭투 (WP)

    innings FLOAT(5,1),                          -- 이닝 (IP)
    era FLOAT(5,3),                              -- 평균자책점 (ERA)
    fip FLOAT(5,3),                              -- FIP
    whip FLOAT(5,3),                              -- WHIP
    war FLOAT(5,3)                              -- WAR
);
