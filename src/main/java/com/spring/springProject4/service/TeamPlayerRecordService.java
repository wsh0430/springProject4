package com.spring.springProject4.service;

import java.util.List;

import com.spring.springProject4.dto.TeamPlayerRecordDto;


public interface TeamPlayerRecordService {

	void savePlayerRecord(TeamPlayerRecordDto dto);
  List<TeamPlayerRecordDto> getAverageByYear(String field, int startYear, int endYear);

}