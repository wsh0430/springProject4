package com.spring.springProject4.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.springProject4.dao.CommunityDao;
import com.spring.springProject4.vo.BoardVo;
import com.spring.springProject4.vo.CategoryVo;
import com.spring.springProject4.vo.LikesVo;

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

	@Override
	public BoardVo getBoardContent(int boardIdx) {
		return communityDao.getBoardContent(boardIdx);
	}

	@Override
	public LikesVo getLikes(String part, int partIdx, String memberId) {
		return communityDao.getLikes(part, partIdx, memberId);
	}

	@Override
	public int setCreateLikes(String part, int partIdx, String memberId) {
		return communityDao.setCreateLikes(part, partIdx, memberId);
	}

	@Override
	public int setDeleteLikes(int idx) {
		return communityDao.setDeleteLikes(idx);
	}

	@Override
	public int setUpdateboardLikeCnt(int boardIdx, int n) {
		return communityDao.setUpdateboardLikeCnt(boardIdx, n);
		
	}
	
}
