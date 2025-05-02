package com.spring.springProject4.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.springProject4.dto.PlayerRecordDto;

public interface PlayerRecordDao {
  PlayerRecordDto findExistingRecord(@Param("player") String player,
      @Param("position") String position,
      @Param("year") int year);

	void insertPlayerStats(@Param("dto") PlayerRecordDto dto);
	
	void updatePlayerStats(@Param("dto") PlayerRecordDto dto);
	
	List<PlayerRecordDto> getAllPlayerStats();
	
  List<PlayerRecordDto> getSortedHitterRecords(
      @Param("sortColumn") String sortColumn,
      @Param("orderDirection") String orderDirection,
      @Param("team") String team,
      @Param("position") String position,
      @Param("startYear") Integer startYear,
      @Param("endYear") Integer endYear
  );
  
	List<PlayerRecordDto> getAverageCompaerByYear(@Param("playerName") String playerName,@Param("playerPosition") String position,@Param("field") String field,@Param("startYear") int startYear,@Param("endYear") int endYear);
}
