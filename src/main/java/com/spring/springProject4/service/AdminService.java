package com.spring.springProject4.service;

import java.util.List;

import com.spring.springProject4.vo.BoardVo;
import com.spring.springProject4.vo.CategoryVo;
import com.spring.springProject4.vo.ChartVo;
import com.spring.springProject4.vo.ReportVo;

public interface AdminService {

	List<ChartVo> getRecentlyChartCount(String legend, int day);

	List<BoardVo> getBoardVos(String category, int startIndexNo, int pageSize, String search, String searchString,
			String startDate, String lastDate);

	List<CategoryVo> getMainCategoryVos();

	List<CategoryVo> getSubCategoryVos(String pName);

	int getCategoryIdx(String categoryName);

	int setDeleteBoard(int idx);

	int setUpdateToggleCheckedBoard(int idx, int hc);

	BoardVo getBoardVo(int idx);

	int setUpdateToggleBoard(int idx, String part);
	
}
