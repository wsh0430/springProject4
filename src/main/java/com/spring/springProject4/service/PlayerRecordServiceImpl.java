package com.spring.springProject4.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.springProject4.dao.PlayerRecordDao;
import com.spring.springProject4.dto.PlayerRecordDto;

@Service
public class PlayerRecordServiceImpl implements PlayerRecordService {

  @Autowired
  private PlayerRecordDao playerRecordDao;
  
  
  //중복처리를 위한 메서드
  @Override
  public void savePlayerRecord(PlayerRecordDto dto) {
		//이름, 포지션, 년도가 같으면 같은사람으로 취급
    PlayerRecordDto existing = playerRecordDao.findExistingRecord(
  		dto.getPlayer(), dto.getPosition(), dto.getYear()
    );
    
    
    if (existing == null) {
    	playerRecordDao.insertPlayerStats(dto);
      System.out.println("저장 완료: " + dto.getPlayer());
    } else {
    	playerRecordDao.updatePlayerStats(dto);
      System.out.println("업데이트 완료: " + dto.getPlayer());
    }
  }

  @Override
  public List<PlayerRecordDto> getAllPlayerRecords() {
    return playerRecordDao.getAllPlayerStats();
  }
  
  
  @Override
  public List<PlayerRecordDto> getSortedHitterRecords(String sortColumn, String orderDirection,
                                                      String team, String position,
                                                      Integer startYear, Integer endYear) {

    return playerRecordDao.getSortedHitterRecords(sortColumn, orderDirection, team, position, startYear, endYear);
	}
  
	@Override
	public List<PlayerRecordDto> getAverageCompaerByYear(String playerName, String position, String field, int startYear, int endYear) {
		// TODO Auto-generated method stub
		return playerRecordDao.getAverageCompaerByYear(playerName, position, field, startYear, endYear);
	}
  
}
