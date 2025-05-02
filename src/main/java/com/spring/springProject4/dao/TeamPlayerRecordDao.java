package com.spring.springProject4.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.springProject4.dto.TeamPlayerRecordDto;

public interface TeamPlayerRecordDao {
	TeamPlayerRecordDto findExistingRecord(@Param("teamName") String teamName,
      @Param("year") int year);

	void insertPlayerStats(@Param("dto") TeamPlayerRecordDto dto);
	
	void updatePlayerStats(@Param("dto") TeamPlayerRecordDto dto);
	
	List<TeamPlayerRecordDto> getAverageByYear(@Param("field") String field, @Param("startYear") int startYear, @Param("endYear") int endYear);


	
}
