package com.spring.springProject4.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.springProject4.dao.AdminDao;
import com.spring.springProject4.vo.AdvertisementVo;
import com.spring.springProject4.vo.BoardVo;
import com.spring.springProject4.vo.CategoryVo;
import com.spring.springProject4.vo.ChartVo;
import com.spring.springProject4.vo.MemberVo;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminDao adminDao;

	@Override
	public List<ChartVo> getRecentlyChartCount(String legend, int day) {
		return adminDao.getRecentlyChartCount(legend, day);
	}

	@Override
	public List<BoardVo> getBoardVos(String category, int startIndexNo, int pageSize, String search,
			String searchString, String startDate, String lastDate) {
		return adminDao.getBoardVos(category, startIndexNo, pageSize, search,
			searchString, startDate, lastDate);
	}

	@Override
	public List<CategoryVo> getMainCategoryVos() {
		return adminDao.getMainCategoryVos();
	}

	@Override
	public List<CategoryVo> getSubCategoryVos(String pName) {
		return adminDao.getSubCategoryVos(pName);
	}

	@Override
	public int getCategoryIdx(String categoryName) {
		return adminDao.getCategoryIdx(categoryName);
	}

	@Override
	public int setDeleteMItem(String part, int idx) {
		return adminDao.setDeleteMItem(part, idx);
	}

	@Override
	public int setUpdateToggleCheckedBoard(int idx, int hc) {
		if(hc == 0) hc = 1;
		else hc = 0;
		return adminDao.setUpdateToggleCheckedBoard(idx, hc);
	}

	@Override
	public BoardVo getBoardVo(int idx) {
		return adminDao.getBoardVo(idx);
	}

	@Override
	public int setUpdateToggleBoard(int idx, String part) {		
		return adminDao.setUpdateToggleBoard(idx, part);
	}

	@Override
	public List<BoardVo> getCommentVos(int startIndexNo, int pageSize, String search, String searchString,
			String startDate, String lastDate) {
		return adminDao.getCommentVos(startIndexNo, pageSize, search, searchString, startDate, lastDate);
	}

	@Override
	public List<MemberVo> getMemberVos(int startIndexNo, int pageSize, String search, String searchString,
			String startDate, String lastDate) {
		return adminDao.getMemberVos(startIndexNo, pageSize, search, searchString, startDate, lastDate);
	}

	@Override
	public String[] getTotalTeam(){
		return adminDao.getTotalTeam();
	}

	@Override
	public int getFandomCnt(String team) {
		return adminDao.getFandomCnt(team);
	}

	@Override
	public List<AdvertisementVo> getAdVos(int startIndexNo, int pageSize, String search, String searchString,
			String startDate, String lastDate) {
		return adminDao.getAdVos(startIndexNo, pageSize, search, searchString, startDate, lastDate);
	}

	@Override
	public int setCreateMItem(AdvertisementVo vo) {
		return adminDao.setCreateMItem(vo);
	}


}
