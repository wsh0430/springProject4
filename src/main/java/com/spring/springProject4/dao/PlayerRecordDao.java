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
}
