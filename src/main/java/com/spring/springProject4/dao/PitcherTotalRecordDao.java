package com.spring.springProject4.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.springProject4.dto.PitcherRecordDto;
import com.spring.springProject4.dto.PitcherTotalRecordDto;
import com.spring.springProject4.dto.PlayerTotalRecordDto;

public interface PitcherTotalRecordDao {

    // 중복 여부 확인 (선수명, 년도, WAR 기준)
		PlayerTotalRecordDto findExistingPitcherRecord(
        @Param("player") String player,
        @Param("year") String year
    );
    // 투수 기록 삽입
    void insertPitcherRecord(@Param("dto") PitcherTotalRecordDto dto);

    // 투수 기록 수정
    void updatePitcherStats(@Param("dto") PitcherTotalRecordDto dto);

    // 모든 투수 기록 조회
    List<PitcherTotalRecordDto> getAllPitcherStats();
}
