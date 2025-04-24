package com.spring.springProject4.service;

import java.util.List;

import com.spring.springProject4.dto.PitcherRecordDto;

public interface PitcherRecordService {

    // 중복 체크 후 저장 or 업데이트
    void savePitcherRecord(PitcherRecordDto dto);

    // 전체 투수 기록 조회
    List<PitcherRecordDto> getAllPitcherRecords();
}
