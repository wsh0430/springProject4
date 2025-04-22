package com.spring.springProject4.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.springProject4.dto.PitcherRecordDto;

public interface PitcherRecordDao {

    // 중복 여부 확인 (선수명, 년도, WAR 기준)
    PitcherRecordDto findExistingPitcherRecord(
        @Param("player") String player,
        @Param("year") int year
    );
    
    // 중복 여부 확인 (선수명, 년도, WAR 기준)
    PitcherRecordDto findExistingPitcherRecordByWar(
    		@Param("player") String player,
    		@Param("year") int year,
    		@Param("war") float war
    		);

    // 투수 기록 삽입
    void insertPitcherRecord(@Param("dto") PitcherRecordDto dto);

    // 투수 기록 수정
    void updatePitcherStats(@Param("dto") PitcherRecordDto dto);

    // 모든 투수 기록 조회
    List<PitcherRecordDto> getAllPitcherStats();
}
