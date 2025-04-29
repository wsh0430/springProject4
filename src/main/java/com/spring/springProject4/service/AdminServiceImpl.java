package com.spring.springProject4.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.springProject4.dao.AdminDao;
import com.spring.springProject4.vo.BoardVo;
import com.spring.springProject4.vo.ChartVo;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminDao adminDao;

	@Override
	public List<ChartVo> getRecentlyChartCount(String legend, int day) {
		return adminDao.getRecentlyChartCount(legend, day);
	}

	@Override
	public List<BoardVo> getBoardVos(String category, int startIndexNo, int pageSize, String search,
			String searchString, String startDate, String lastDate) {
		return adminDao.getBoardVos(category, startIndexNo, pageSize, search,
			searchString, startDate, lastDate);
	}


}
