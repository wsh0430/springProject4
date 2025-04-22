package com.spring.springProject4.dto;

import lombok.Data;

@Data
public class PitcherTotalRecordDto {
	 private int id;
   private String player;
   private String teamLogo;
   private String year;

   private float war;
   private int gamesP;
   private int gamesStart;
   private int completeGames;
   private int shutouts;
   private int wins;
   private int losses;
   private int saves;
   private int holds;
   private float innings;
   private int earnedRuns;
   private int runsAllowed;
   private int hitsAllowed;
   private int homeRunsAllowed;
   private int bbAllowed;
   private int strikeouts;
   private int balks;
   private int wildPitches;

   private float era;
   private float fip;
   private float whip;
}
