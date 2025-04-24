package com.spring.springProject4.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.springProject4.dao.CommunityDao;
import com.spring.springProject4.vo.BoardVo;
import com.spring.springProject4.vo.CategoryVo;
import com.spring.springProject4.vo.CommentVo;
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
	public List<LikesVo> getLikesVos(String part, String parent, int parentIdx, String memberId) {
		return communityDao.getLikesVos(part, parent, parentIdx, memberId); 
	}
	
	
	@Override
	public List<CommentVo> getCommentVos(int boardIdx) {
		return communityDao.getCommentVos(boardIdx);
	}

	@Override
	public List<CommentVo> getReplyList(int parentIdx) {
		return communityDao.getReplyList(parentIdx);
	}

	
	@Override
	public int setCreateLikes(String part, int partIdx, String memberId, String parent, int parentIdx) {
		return communityDao.setCreateLikes(part, partIdx, memberId, parent, parentIdx);
	}

	@Override
	public int setDeleteLikes(int idx) {
		return communityDao.setDeleteLikes(idx);
	}

	@Override
	public int setUpdateLikeCnt(String part, int partIdx, int n) {
		return communityDao.setUpdateLikeCnt(part, partIdx, n);
		
	}

	@Override
	public int setCreateComment(CommentVo cmtVo) {
		return communityDao.setCreateComment(cmtVo);
	}

	@Override
	public int setCreateReply(CommentVo cmtVo) {
		return communityDao.setCreateReply(cmtVo);
	}

	@Override
	public int setUpdateCommetCnt(String part, int partIdx) {
		return communityDao.setUpdateCommetCnt(part, partIdx);
	}

	@Override
	public int setUpdateComment(int idx, String content) {
		return communityDao.setUpdateComment(idx, content);
	}

	@Override
	public int setUpdateDeleteCheck(int idx) {
		return communityDao.setUpdateDeleteCheck(idx);
	}

	@Override
	public int setCreateBoard(BoardVo vo) {
		return communityDao.setCreateBoard(vo);
	}

}
