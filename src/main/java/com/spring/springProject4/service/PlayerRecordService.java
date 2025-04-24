package com.spring.springProject4.service;

import java.util.List;

import com.spring.springProject4.dto.PlayerRecordDto;


public interface PlayerRecordService {

	void savePlayerRecord(PlayerRecordDto dto);
	List<PlayerRecordDto> getAllPlayerRecords();
}
