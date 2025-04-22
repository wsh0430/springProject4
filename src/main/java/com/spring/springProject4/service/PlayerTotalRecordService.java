package com.spring.springProject4.service;

import java.util.List;

import com.spring.springProject4.dto.PlayerTotalRecordDto;


public interface PlayerTotalRecordService {

	void savePlayerRecord(PlayerTotalRecordDto dto);
	List<PlayerTotalRecordDto> getAllPlayerRecords();
}
