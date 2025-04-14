package com.spring.springProject4.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.springProject4.dao.CommunityDao;
import com.spring.springProject4.vo.CategoryVo;

@Service
public class CommunityServiceImpl implements CommunityService {

	@Autowired
	CommunityDao communityDao;
	
	@Override
	public List<CategoryVo> getCategoryList(String parentName) {
		return communityDao.getCategoryList(parentName);
	}
	
}
