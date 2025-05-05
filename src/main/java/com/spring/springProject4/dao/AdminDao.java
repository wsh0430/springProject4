package com.spring.springProject4.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.spring.springProject4.vo.BoardVo;
import com.spring.springProject4.vo.CategoryVo;
import com.spring.springProject4.vo.ChartVo;
import com.spring.springProject4.vo.MemberVo;

@Mapper
@Repository
public interface AdminDao {

	int getDailyVisitCnt();

	int yesterdayVisitCnt();
	
	int getDailyWriteBoardCnt();
	
	int yesterdayBoardCnt();
	
	int getDailyJoinCnt();
	
	int yesterdayJoinCnt();
	
	int getDailyAdClickCnt();
	
	int yesterdayAdCnt();

	List<ChartVo> getRecentlyChartCount(@Param("legend") String legend, @Param("day") int day);

	int getBoardTotRecCntSearch(@Param("part") String part, @Param("searchString") String searchString, @Param("startDate") String startDate, @Param("lastDate") String lastDate);

	List<BoardVo> getBoardVos(@Param("category") String category, @Param("startIndexNo") int startIndexNo, @Param("pageSize") int pageSize, @Param("search") String search, @Param("searchString") String searchString,
			@Param("startDate") String startDate, @Param("lastDate") String lastDate);

	List<CategoryVo> getMainCategoryVos();

	List<CategoryVo> getSubCategoryVos(@Param("pName") String pName);

	int getCategoryIdx(@Param("categoryName") String categoryName);

	int setDeleteMItem(@Param("part") String part, @Param("idx") int idx);

	int setUpdateToggleCheckedBoard(@Param("idx") int idx, @Param("hc") int hc);
	
	BoardVo getBoardVo(@Param("idx") int idx);

	int setUpdateToggleBoard(@Param("idx") int idx, @Param("part") String part);

	int getCommentTotRecCnt();

	int getCommentTotRecCntSearch(@Param("part")  String part, @Param("searchString") String searchString, @Param("startDate")  String startDate, @Param("lastDate")  String lastDate);

	List<BoardVo> getCommentVos(@Param("startIndexNo") int startIndexNo, @Param("pageSize") int pageSize, @Param("search") String search, @Param("searchString") String searchString,
			@Param("startDate") String startDate, @Param("lastDate") String lastDate);

	List<MemberVo> getMemberVos(@Param("startIndexNo") int startIndexNo, @Param("pageSize") int pageSize, @Param("search") String search, @Param("searchString") String searchString,
			@Param("startDate") String startDate, @Param("lastDate") String lastDate);

	int getMemberTotRecCnt();

	int getMemberTotRecCntSearch(@Param("part")  String part, @Param("searchString") String searchString, @Param("startDate")  String startDate, @Param("lastDate")  String lastDate);



}
