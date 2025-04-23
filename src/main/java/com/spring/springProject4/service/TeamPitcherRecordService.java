package com.spring.springProject4.service;

import java.util.List;

import com.spring.springProject4.dto.PlayerRecordDto;
import com.spring.springProject4.dto.TeamPitcherRecordDto;
import com.spring.springProject4.dto.TeamPlayerRecordDto;


public interface TeamPitcherRecordService {

	void savePlayerRecord(TeamPitcherRecordDto dto);
	List<TeamPitcherRecordDto> getAllPlayerRecords();
}
