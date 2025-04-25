package com.spring.springProject4.service;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.springProject4.dao.TeamPlayerRecordDao;
import com.spring.springProject4.dto.TeamPlayerRecordDto;

@Service
public class TeamPlayerRecordServiceImpl implements TeamPlayerRecordService {

  @Autowired
  private TeamPlayerRecordDao teamPlayerRecordDao;
  
  
  //중복처리를 위한 메서드
  @Override
  public void savePlayerRecord(TeamPlayerRecordDto dto) {
		//이름, 포지션, 년도가 같으면 같은사람으로 취급
		TeamPlayerRecordDto existing = teamPlayerRecordDao.findExistingRecord(
        dto.getTeamName(), dto.getYear()
    );
    
    
    if (existing == null) {
    	teamPlayerRecordDao.insertPlayerStats(dto);
        System.out.println("저장 완료: " + dto.getTeamName());
    } else {
    	teamPlayerRecordDao.updatePlayerStats(dto);
        System.out.println("업데이트 완료: " + dto.getTeamName());
    }
  }
  
  @Override
  public List<Map<String, Object>> getAverageByAttribute(String columnName, int startYear, int endYear) {
      // 🔒 안전한 컬럼명만 허용 (whitelist 방식)
      List<String> allowedColumns = Arrays.asList("avg", "obp", "slg", "ops", "war", "hits", "home_runs", "rbi", "games");
      if (!allowedColumns.contains(columnName)) {
          throw new IllegalArgumentException("Invalid column name: " + columnName);
      }
      return teamPlayerRecordDao.selectAverageByAttribute(columnName, startYear, endYear);
  }
  
}
