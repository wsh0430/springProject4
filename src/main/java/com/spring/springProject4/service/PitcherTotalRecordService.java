package com.spring.springProject4.service;

import java.util.List;

import com.spring.springProject4.dto.PitcherRecordDto;
import com.spring.springProject4.dto.PitcherTotalRecordDto;

public interface PitcherTotalRecordService {

    // 중복 체크 후 저장 or 업데이트
    void savePitcherRecord(PitcherTotalRecordDto dto);

    // 전체 투수 기록 조회
    List<PitcherTotalRecordDto> getAllPitcherRecords();
}
