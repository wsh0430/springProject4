package com.spring.springProject4.service;

import java.util.List;

import com.spring.springProject4.vo.BoardVo;
import com.spring.springProject4.vo.CategoryVo;
import com.spring.springProject4.vo.LikesVo;

public interface CommunityService {

	List<CategoryVo> getMainCategoryList();
	
	List<CategoryVo> getSubCategoryList(String pName);
	
	List<BoardVo> getBoardList(String category, int startIndexNo, int pageSize, String search, String searchString);

	BoardVo getBoardContent(int boardIdx);

	LikesVo getLikes(String part, int partIdx, String memberId);

	int setCreateLikes(String part, int partIdx, String memberId);

	int setDeleteLikes(int idx);

	int setUpdateboardLikeCnt(int boardIdx, int n);
}
