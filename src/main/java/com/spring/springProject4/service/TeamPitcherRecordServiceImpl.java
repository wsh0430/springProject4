package com.spring.springProject4.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.springProject4.dao.PlayerRecordDao;
import com.spring.springProject4.dao.TeamPitcherRecordDao;
import com.spring.springProject4.dao.TeamPlayerRecordDao;
import com.spring.springProject4.dto.PlayerRecordDto;
import com.spring.springProject4.dto.TeamPitcherRecordDto;
import com.spring.springProject4.dto.TeamPlayerRecordDto;

@Service
public class TeamPitcherRecordServiceImpl implements TeamPitcherRecordService {

  @Autowired
  private TeamPitcherRecordDao teamPitcherRecordDao;
  
  
  //중복처리를 위한 메서드
  @Override
  public void savePlayerRecord(TeamPitcherRecordDto dto) {
		//이름, 포지션, 년도가 같으면 같은사람으로 취급
  	TeamPitcherRecordDto existing = teamPitcherRecordDao.findExistingRecord(
        dto.getTeamName(), dto.getYear()
    );
    
    
    if (existing == null) {
    	teamPitcherRecordDao.insertPlayerStats(dto);
        System.out.println("저장 완료: " + dto.getTeamName());
    } else {
    	teamPitcherRecordDao.updatePlayerStats(dto);
        System.out.println("업데이트 완료: " + dto.getTeamName());
    }
  }

  @Override
  public List<TeamPitcherRecordDto> getAllPlayerRecords() {
      return teamPitcherRecordDao.getAllPlayerStats();
  }
}
