package com.spring.springProject4.service;

import java.util.List;

import com.spring.springProject4.vo.CategoryVo;

public interface CommunityService {

	List<CategoryVo> getCategoryList(String parentName);

}
