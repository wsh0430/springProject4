package com.spring.springProject4.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.springProject4.dao.PitcherRecordDao;
import com.spring.springProject4.dto.PitcherRecordDto;

@Service
public class PitcherRecordServiceImpl implements PitcherRecordService {

    @Autowired
    private PitcherRecordDao pitcherRecordDao;

    // 중복처리를 위한 메서드 (선수명 + 연도 + WAR)
    @Override
    public void savePitcherRecord(PitcherRecordDto dto) {
        PitcherRecordDto existing;

        if (dto.getPlayer().equals("정재훈") && dto.getYear() == 2007) {
            // 예외 케이스: WAR까지 포함해 중복 확인
            existing = pitcherRecordDao.findExistingPitcherRecordByWar(
                dto.getPlayer(), dto.getYear(), dto.getWar()
            );
        } else {
            // 일반 케이스: 이름 + 연도로 중복 확인
            existing = pitcherRecordDao.findExistingPitcherRecord(
                dto.getPlayer(), dto.getYear()
            );
        }

        if (existing == null) {
            pitcherRecordDao.insertPitcherRecord(dto);
            System.out.println("저장 완료: " + dto.getPlayer());
        } else {
            pitcherRecordDao.updatePitcherStats(dto);
            System.out.println("업데이트 완료: " + dto.getPlayer());
        }
    }

    @Override
    public List<PitcherRecordDto> getAllPitcherRecords() {
        return pitcherRecordDao.getAllPitcherStats();
    }
}
