package com.spring.springProject4.dto;

import lombok.Data;

@Data
public class TeamPitcherRecordDto {
	 private int id;
   private String teamName;           // 팀 이름
   private String teamLogo;           // 팀 로고
   private int year;                  // 연도

   private float war;                 // WAR
   private int gamesP;                // 경기수 (G)
   private int gamesStart;            // 선발 (GS)
   private int completeGames;         // 완투 (CG)
   private int shutouts;              // 완봉 (SHO)
   private int wins;                  // 승 (W)
   private int losses;                // 패 (L)
   private int saves;                 // 세이브 (S)
   private int holds;                 // 홀드 (HD)
   private float innings;             // 이닝 (IP)
   private int earnedRuns;            // 자책점 (ER)
   private int runsAllowed;           // 실점 (R)
   private int hitsAllowed;           // 피안타 (H)
   private int homeRunsAllowed;       // 피홈런 (HR)
   private int bbAllowed;             // 사사구 (BB)
   private int strikeouts;            // 탈삼진 (SO)
   private int balks;                 // 보크 (BK)
   private int wildPitches;           // 폭투 (WP)

   private float era;                 // 평균자책점 (ERA)
   private float fip;                 // FIP
   private float whip;                // WHIP
   
   private double value;
}
