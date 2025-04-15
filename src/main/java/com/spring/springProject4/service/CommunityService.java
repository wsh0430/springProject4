package com.spring.springProject4.service;

import java.util.List;

import com.spring.springProject4.vo.BoardVo;
import com.spring.springProject4.vo.CategoryVo;

public interface CommunityService {

	List<CategoryVo> getMainCategoryList();
	
	List<CategoryVo> getSubCategoryList(String pName);
	
	List<BoardVo> getBoardList(String category, int startIndexNo, int pageSize, String search, String searchString);
}
