package com.spring.springProject4.common;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.springProject4.dao.AdminDao;
import com.spring.springProject4.dao.CommunityDao;
import com.spring.springProject4.vo.PageVo;

@Service
public class Pagination {
	
	@Autowired
	CommunityDao communityDao;
	
	@Autowired
	AdminDao adminDao;
	
	public PageVo getTotRecCnt(String keyword, int pag, int pageSize, String section, String part, String searchString, String startDate, String lastDate) {
		PageVo vo = new PageVo();
		
		int totRecCnt = 0;
		String search = "";
		String searchStr = "";
		
//		검색어가 넘어왔을경우 처리하는 부분
//		if(!searchString.equals("/")) {	// searchString : 'title/공지'
//			search = searchString.split("/")[0];
//			searchString = searchString.split("/")[1];
//		}
		
		
//		게시판을 분류하는 부분
		if(section.equals("community")) {
			if(part.equals("")) totRecCnt = communityDao.getBoardTotRecCnt(keyword);
			else totRecCnt = communityDao.getBoardTotRecCntSearch(part, searchString);
		}
		else if(section.equals("adminBoardManager")) {
			if(part.equals("")) totRecCnt = communityDao.getBoardTotRecCnt(keyword);
			else totRecCnt = adminDao.getBoardTotRecCntSearch(part, searchString, startDate, lastDate);
		}
		else if(section.equals("adminCommentManager")) {
			if(part.equals("")) totRecCnt = adminDao.getCommentTotRecCnt();
			else totRecCnt = adminDao.getCommentTotRecCntSearch(part, searchString, startDate, lastDate);
		}
//		else if(section.equals("pds")) {
//			totRecCnt = pdsDao.getPdsTotRecCnt(part);
//		}
//		else if(section.equals("webMessage")) {
//			String mid = part;
//			int mSw = Integer.parseInt(searchString);
//			totRecCnt = webMessageDao.getTotRecCnt(mid, mSw);
//		}
		
		// 검색기(search(part)와 searchString)를 통한 리스트를 구현하기위한 처리
		if(section.equals("pds") && !searchString.equals("")) {
			search = part;
			if(totRecCnt != 0) pageSize = totRecCnt;
			if(part.equals("title")) searchStr = "글제목";
			else if(part.equals("nickName")) searchStr = "닉네임";
			else searchStr = "글내용";
		}
		
		int totPage = (totRecCnt % pageSize) == 0 ? (totRecCnt / pageSize) : (totRecCnt / pageSize) + 1;
		int startIndexNo = (pag - 1) * pageSize;
		int curScrStartNo = totRecCnt - startIndexNo;
		
		int blockSize = 3;
		int curBlock = (pag - 1) / blockSize;
		int lastBlock = (totPage - 1) / blockSize;
		
		vo.setPag(pag);
		vo.setPageSize(pageSize);
		vo.setTotPage(totPage);
		vo.setStartIndexNo(startIndexNo);
		vo.setCurScrStartNo(curScrStartNo);
		vo.setBlockSize(blockSize);
		vo.setCurBlock(curBlock);
		vo.setLastBlock(lastBlock);
		vo.setSearch(search);
		vo.setSearchStr(searchStr);
		vo.setSearchString(searchString);
		vo.setPart(part);
		
		return vo;
	}
}
