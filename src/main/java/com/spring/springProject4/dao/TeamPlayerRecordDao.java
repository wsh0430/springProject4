package com.spring.springProject4.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.spring.springProject4.dto.PlayerRecordDto;
import com.spring.springProject4.dto.TeamPlayerRecordDto;

public interface TeamPlayerRecordDao {
	TeamPlayerRecordDto findExistingRecord(@Param("teamName") String teamName,
      @Param("year") int year);

	void insertPlayerStats(@Param("dto") TeamPlayerRecordDto dto);
	
	void updatePlayerStats(@Param("dto") TeamPlayerRecordDto dto);
	
	List<Map<String, Object>> selectAverageByAttribute(
	    @Param("columnName") String columnName,
	    @Param("startYear") int startYear,
	    @Param("endYear") int endYear
	);
	
}
