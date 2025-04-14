package com.spring.springProject4.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.springProject4.dao.PlayerRecordDao;
import com.spring.springProject4.dto.PlayerRecordDto;

@Service
public class PlayerRecordServiceImpl implements PlayerRecordService {

  @Autowired
  private PlayerRecordDao playerStatsDao;
  
  
  //중복처리를 위한 메서드
  @Override
  public void savePlayerRecord(PlayerRecordDto dto) {
  		//이름, 포지션, 년도가 같으면 같은사람으로 취급
      PlayerRecordDto existing = playerStatsDao.findExistingRecord(
          dto.getPlayer(), dto.getPosition(), dto.getYear()
      );
      
      
      if (existing == null) {
          playerStatsDao.insertPlayerStats(dto);
          System.out.println("저장 완료: " + dto.getPlayer());
      } else {
          playerStatsDao.updatePlayerStats(dto);
          System.out.println("업데이트 완료: " + dto.getPlayer());
      }
  }

  @Override
  public List<PlayerRecordDto> getAllPlayerRecords() {
      return playerStatsDao.getAllPlayerStats();
  }
}
