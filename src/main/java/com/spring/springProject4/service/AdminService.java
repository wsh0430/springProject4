package com.spring.springProject4.service;

import java.util.List;

import com.spring.springProject4.vo.ChartVo;

public interface AdminService {

	List<ChartVo> getRecentlyChartCount(String legend, int day);
	
}
