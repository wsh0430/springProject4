package com.spring.springProject4.dto;

import lombok.Data;

@Data
public class PlayerRecordDto {
	 private int id;
   private String player;
   private String teamLogo;
   private String position;
   private int year;
   private int games;
   private int tasuk;
   private int atBats;
   private int runs;
   private int hits;
   private int doubles;
   private int triples;
   private int totalBases;
   private int rbi;
   private int homeRuns;
   private int stolenBases;
   private int stolenBasesFail;
   private int bb;
   private int strikeouts;
   private int doublePlays;
   private int sacHits;
   private int sacFlies;

   private float avg;
   private float obp;
   private float slg;
   private float ops;
   private float war;
}
