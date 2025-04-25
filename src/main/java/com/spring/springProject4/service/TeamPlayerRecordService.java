package com.spring.springProject4.service;

import java.util.List;
import java.util.Map;

import com.spring.springProject4.dto.TeamPlayerRecordDto;


public interface TeamPlayerRecordService {

	void savePlayerRecord(TeamPlayerRecordDto dto);
	List<Map<String, Object>> getAverageByAttribute(String columnName, int startYear, int endYear);
}
