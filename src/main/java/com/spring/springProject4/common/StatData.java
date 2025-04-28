package com.spring.springProject4.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.springProject4.dao.AdminDao;
import com.spring.springProject4.vo.StatDataVo;

@Service
public class StatData {

	@Autowired 
	AdminDao adminDao;
	
	public StatDataVo getStatDataVo() {
		StatDataVo vo = new StatDataVo();
		
		//방문수
		int dailyVisitCnt = adminDao.getDailyVisitCnt();
		int yesterdayVisitCnt = adminDao.yesterdayVisitCnt();
		int dailyVisitDelta = dailyVisitCnt - yesterdayVisitCnt;
		
		//게시글수
		int dailyWriteBoardCnt = adminDao.getDailyWriteBoardCnt();
		int yesterdayBoardCnt = adminDao.yesterdayBoardCnt();
		int dailyWriteBoardDelta =  dailyWriteBoardCnt - yesterdayBoardCnt;
		
		//회원가입수
		int dailyJoinCnt = adminDao.getDailyJoinCnt();
		int yesterdayJoinCnt = adminDao.yesterdayJoinCnt();
		int dailyJoinDelta = dailyJoinCnt - yesterdayJoinCnt;
		
		//광고클릭수
		int dailyAdClickCnt = adminDao.getDailyAdClickCnt();
		int yesterdayAdCnt = adminDao.yesterdayAdCnt();
		int dailyAdClickDelta = dailyAdClickCnt - yesterdayAdCnt;
		
		vo.setDailyVisitCnt(dailyVisitCnt);
		vo.setDailyVisitDelta(dailyVisitDelta);	
		vo.setDailyWriteBoardCnt(dailyWriteBoardCnt);
		vo.setDailyWriteBoardDelta(dailyWriteBoardDelta);
		vo.setDailyJoinCnt(dailyJoinCnt);
		vo.setDailyJoinDelta(dailyJoinDelta);
		vo.setDailyAdClickCnt(dailyAdClickCnt);
		vo.setDailyAdClickDelta(dailyAdClickDelta);
		
		return vo;
	}
	
}
