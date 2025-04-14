package com.spring.springProject4.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.spring.springProject4.dao.PlayerRecordDao;
import com.spring.springProject4.dto.PlayerRecordDto;

public class PlayerRecordServiceImpl implements PlayerRecordService {

  @Autowired
  private PlayerRecordDao playerStatsDao;

}
