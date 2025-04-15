package com.spring.springProject4.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.springProject4.dao.CommunityDao;
import com.spring.springProject4.vo.BoardVo;
import com.spring.springProject4.vo.CategoryVo;

@Service
public class CommunityServiceImpl implements CommunityService {

	@Autowired
	CommunityDao communityDao;
	
	@Override
	public List<CategoryVo> getMainCategoryList() {
		return communityDao.getMainCategoryList();
	}
	
	@Override
	public List<CategoryVo> getSubCategoryList(String pName) {
		return communityDao.getSubCategoryList(pName);
	}
	
	@Override
	public List<BoardVo> getBoardList(String category, int startIndexNo, int pageSize, String search, String searchString) {
		return communityDao.getBoardList(category, startIndexNo, pageSize, search, searchString);
	}
	
}
