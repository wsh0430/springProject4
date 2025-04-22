package com.spring.springProject4.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.springProject4.dao.PlayerTotalRecordDao;
import com.spring.springProject4.dto.PlayerTotalRecordDto;

@Service
public class PlayerTotalRecordServiceImpl implements PlayerTotalRecordService {

  @Autowired
  private PlayerTotalRecordDao playerTotalRecordDao;
  
  
  //중복처리를 위한 메서드
  @Override
  public void savePlayerRecord(PlayerTotalRecordDto dto) {
  		//이름, 포지션, 년도가 같으면 같은사람으로 취급
  		PlayerTotalRecordDto existing = playerTotalRecordDao.findExistingRecord(
          dto.getPlayer(), dto.getPosition(), dto.getYear()
      );
      
      
      if (existing == null) {
      		playerTotalRecordDao.insertPlayerStats(dto);
          System.out.println("저장 완료: " + dto.getPlayer());
      } else {
	    		playerTotalRecordDao.updatePlayerStats(dto);
	        System.out.println("업데이트 완료: " + dto.getPlayer());
      }
  }

  @Override
  public List<PlayerTotalRecordDto> getAllPlayerRecords() {
      return playerTotalRecordDao.getAllPlayerStats();
  }
}
