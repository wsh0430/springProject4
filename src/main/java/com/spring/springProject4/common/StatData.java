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
		
		int dailyVisitCnt = adminDao.getDailyVisitCnt();
		int yesterdayVisitCnt = adminDao.yesterdayVisitCnt();
		int dailyVisitDelta = yesterdayVisitCnt - dailyVisitCnt;
		
		vo.setDailyVisitCnt(dailyVisitCnt);
		vo.setDailyVisitDelta(dailyVisitDelta);
		
		return vo;
	}
	
}
