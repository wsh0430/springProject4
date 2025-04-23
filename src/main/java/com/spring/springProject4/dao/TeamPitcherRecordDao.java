package com.spring.springProject4.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.springProject4.dto.PlayerRecordDto;
import com.spring.springProject4.dto.TeamPitcherRecordDto;
import com.spring.springProject4.dto.TeamPlayerRecordDto;

public interface TeamPitcherRecordDao {
	TeamPitcherRecordDto findExistingRecord(@Param("teamName") String teamName,
      @Param("year") int year);

	void insertPlayerStats(@Param("dto") TeamPitcherRecordDto dto);
	
	void updatePlayerStats(@Param("dto") TeamPitcherRecordDto dto);
	
	List<TeamPitcherRecordDto> getAllPlayerStats();
}
