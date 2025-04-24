package com.spring.springProject4.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.springProject4.dao.PitcherRecordDao;
import com.spring.springProject4.dao.PitcherTotalRecordDao;
import com.spring.springProject4.dto.PitcherRecordDto;
import com.spring.springProject4.dto.PitcherTotalRecordDto;
import com.spring.springProject4.dto.PlayerTotalRecordDto;

@Service
public class PitcherTotalRecordServiceImpl implements PitcherTotalRecordService {

    @Autowired
    private PitcherTotalRecordDao pitcherTotalRecordDao;

    // 중복처리를 위한 메서드 (선수명 + 연도 + WAR)
    @Override
    public void savePitcherRecord(PitcherTotalRecordDto dto) {
  		//이름,년도가 같으면 같은사람으로 취급
    	PlayerTotalRecordDto existing = pitcherTotalRecordDao.findExistingPitcherRecord(
          dto.getPlayer(), dto.getYear()
      );
      
      
      if (existing == null) {
      	pitcherTotalRecordDao.insertPitcherRecord(dto);
          System.out.println("저장 완료: " + dto.getPlayer());
      } else {
      	pitcherTotalRecordDao.updatePitcherStats(dto);
	        System.out.println("업데이트 완료: " + dto.getPlayer());
      }
    }

    @Override
    public List<PitcherTotalRecordDto> getAllPitcherRecords() {
        return pitcherTotalRecordDao.getAllPitcherStats();
    }
}
