package com.spring.springProject4.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.spring.springProject4.vo.ChartVo;

@Mapper
@Repository
public interface AdminDao {

	int getDailyVisitCnt();

	int yesterdayVisitCnt();
	
	int getDailyWriteBoardCnt();
	
	int yesterdayBoardCnt();
	
	int getDailyJoinCnt();
	
	int yesterdayJoinCnt();
	
	int getDailyAdClickCnt();
	
	int yesterdayAdCnt();

	List<ChartVo> getRecentlyChartCount(@Param("legend") String legend, @Param("day") int day);

}
