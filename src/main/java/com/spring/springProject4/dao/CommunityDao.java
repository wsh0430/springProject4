package com.spring.springProject4.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.spring.springProject4.vo.BoardVo;
import com.spring.springProject4.vo.CategoryVo;
import com.spring.springProject4.vo.CommentVo;
import com.spring.springProject4.vo.LikesVo;

@Mapper
@Repository
public interface CommunityDao {

	List<CategoryVo> getMainCategoryList();

	List<CategoryVo> getSubCategoryList(@Param("pName") String pName);
	
	List<BoardVo> getBoardList(@Param("category") String category, @Param("startIndexNo") int startIndexNo, @Param("pageSize") int pageSize, @Param("search") String search, @Param("searchString") String searchString);
	
	int getBoardTotRecCnt();
	
	int getBoardTotRecCntSearch(@Param("search") String search, @Param("searchString") String searchString);

	BoardVo getBoardContent(@Param("boardIdx") int boardIdx);

	LikesVo getLikes(@Param("part") String part, @Param("partIdx") int partIdx, @Param("memberId") String memberId);
	
	List<LikesVo> getLikesVos(@Param("part") String part, @Param("parent") String parent, @Param("parentIdx") int parentIdx, @Param("memberId") String memberId);
	
	List<CommentVo> getCommentVos(@Param("boardIdx") int boardIdx);

	List<CommentVo> getReplyList(@Param("parentIdx") int parentIdx);
	
	int setCreateLikes(@Param("part") String part, @Param("partIdx") int partIdx, @Param("memberId") String memberId, @Param("parent") String parent, @Param("parentIdx") int parentIdx);

	int setDeleteLikes(@Param("idx") int idx);

	int setUpdateLikeCnt(@Param("part") String part, @Param("partIdx") int partIdx, @Param("n") int n);

	int setCreateComment(@Param("cmtVo") CommentVo cmtVo);

	int setCreateReply(@Param("cmtVo") CommentVo cmtVo);

	int setUpdateCommetCnt(@Param("part") String part, @Param("partIdx") int partIdx);

	int setUpdateComment(@Param("idx") int idx, @Param("content") String content);

	

}
