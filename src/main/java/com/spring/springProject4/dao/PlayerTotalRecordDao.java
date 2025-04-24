package com.spring.springProject4.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.springProject4.dto.PlayerTotalRecordDto;

public interface PlayerTotalRecordDao {
  PlayerTotalRecordDto findExistingRecord(@Param("player") String player,
      @Param("position") String position,
      @Param("year") String year);

	void insertPlayerStats(@Param("dto") PlayerTotalRecordDto dto);
	
	void updatePlayerStats(@Param("dto") PlayerTotalRecordDto dto);
	
	List<PlayerTotalRecordDto> getAllPlayerStats();
}
