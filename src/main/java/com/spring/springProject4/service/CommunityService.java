package com.spring.springProject4.service;

import java.util.List;

import com.spring.springProject4.vo.BoardVo;
import com.spring.springProject4.vo.CategoryVo;
import com.spring.springProject4.vo.CommentVo;
import com.spring.springProject4.vo.LikesVo;
import com.spring.springProject4.vo.ReportVo;

public interface CommunityService {

	List<CategoryVo> getMainCategoryList();
	
	List<CategoryVo> getSubCategoryList(String pName);
	
	List<BoardVo> getBoardList(String category, int startIndexNo, int pageSize, String search, String searchString);

	BoardVo getBoardVo(int boardIdx);

	LikesVo getLikes(String part, int partIdx, String memberId);
	
	List<LikesVo> getLikesVos(String part, String parent, int parentIdx, String memberId);
	
	List<CommentVo> getCommentVos(int boardIdx);

	List<CommentVo> getReplyList(int parentIdx);
	
	int setCreateLikes(String part, int partIdx, String memberId, String parent, int parentIdx);

	int setDeleteLikes(int idx);

	int setUpdateLikeCnt(String part, int partIdx, int n);

	int setCreateComment(CommentVo cmtVo);

	int setCreateReply(CommentVo cmtVo);

	int setUpdateCommetCnt(String part, int partIdx);

	int setUpdateComment(int idx, String content);

	int setUpdateDeleteCheck(String part, int idx);

	int setCreateBoard(BoardVo vo);

	int setUpdateBoardViewCnt(int boardIdx);

	int setUpdateBoard(BoardVo vo);

	int setUpdateBoardDeleteCheck(int boardIdx);

	void imgCheck(String content);

	void imgDelete(String content);

	void imgBackup(String content);

	List<BoardVo> getHotBoardList(String category);

	int setInputBoardReport(ReportVo vo);

	int setUpdateBoardReportCount(String part, int idx);

	int getFindReportVo(ReportVo vo);
}
