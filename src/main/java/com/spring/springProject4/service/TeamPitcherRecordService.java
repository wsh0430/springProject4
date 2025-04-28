package com.spring.springProject4.service;

import java.util.List;
import java.util.Map;

import com.spring.springProject4.dto.TeamPitcherRecordDto;


public interface TeamPitcherRecordService {

	void savePlayerRecord(TeamPitcherRecordDto dto);
	List<TeamPitcherRecordDto> getPitcherAverageByYear(String field, int startYear, int endYear);
}
