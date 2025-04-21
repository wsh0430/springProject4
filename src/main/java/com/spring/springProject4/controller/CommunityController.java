package com.spring.springProject4.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.springProject4.common.Pagination;
import com.spring.springProject4.dao.CommunityDao;
import com.spring.springProject4.service.CommunityService;
import com.spring.springProject4.vo.BoardVo;
import com.spring.springProject4.vo.CategoryVo;
import com.spring.springProject4.vo.CommentVo;
import com.spring.springProject4.vo.LikesVo;
import com.spring.springProject4.vo.PageVo;

@Controller
@RequestMapping("/community")
public class CommunityController {
	
	@Autowired
	CommunityService communityService;
	
	@Autowired
	Pagination pagination;
	
	@RequestMapping(value="/cmtyMain", method=RequestMethod.GET)
	public String cmtyMainGet(Model model, 
			@RequestParam(name="category", defaultValue = "전체", required = false) String category,
			@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
			@RequestParam(name="pageSize", defaultValue = "10", required = false) int pageSize,
			@RequestParam(name="search", defaultValue = "", required = false) String search,
			@RequestParam(name="searchString", defaultValue = "", required = false) String searchString
			) {
		
		// 카테고리
		List<CategoryVo> mainCtgyVos = communityService.getMainCategoryList();	// 메인 카테고리vos
		List<CategoryVo> subCtgyVos = null; 
		List<List<CategoryVo>> subCtgyList = new ArrayList<>();	//서브 카테고리
		for(int i = 0; i < mainCtgyVos.size(); i++) {
			subCtgyVos = communityService.getSubCategoryList(mainCtgyVos.get(i).getName());	//서브 카테고리vos
			subCtgyList.add(subCtgyVos);
		}

		// 페이지
		PageVo pageVo = pagination.getTotRecCnt(pag,pageSize,"community",search,searchString);	// (페이지번호,한 페이지분량,section,part,검색어)
				
		// 보드
		List<BoardVo> boardVos = communityService.getBoardList(category, pageVo.getStartIndexNo(), pageVo.getPageSize(), search, searchString);

		
		model.addAttribute("category", category);
		model.addAttribute("mainCtgyVos", mainCtgyVos);
		model.addAttribute("subCtgy", subCtgyList);
		model.addAttribute("boardVos", boardVos);
		model.addAttribute("pageVo", pageVo);

		return "community/main";
	}
	
	@SuppressWarnings("null")
	@RequestMapping(value="/cmtyContent", method=RequestMethod.GET)
	public String cmtyContentGet(Model model, 
			@RequestParam(name="boardIdx", defaultValue = "", required = false) int boardIdx,
			@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
			@RequestParam(name="pageSize", defaultValue = "10", required = false) int pageSize,
			@RequestParam(name="search", defaultValue = "", required = false) String search,
			@RequestParam(name="searchString", defaultValue = "", required = false) String searchString
			) {
		String memberId = "user123";	//나중에 session에 있는 값 꺼내오기
		
		BoardVo boardVo = communityService.getBoardContent(boardIdx);
		
		List<CommentVo> commentVos = communityService.getCommentVos(boardIdx);
		List<CommentVo> replyVos = null; 
		List<List<CommentVo>> replyList = new ArrayList<>();	//서브 카테고리
		for(int i = 0; i < commentVos.size(); i++) {
			replyVos = communityService.getReplyList(commentVos.get(i).getIdx());	//서브 카테고리vos
			replyList.add(replyVos);
		}
		
		LikesVo boardLikesVo = communityService.getLikes("board", boardIdx, memberId);
		List<LikesVo> commentLikesVos = communityService.getLikesVos("comment", "board", boardIdx);	//comment, reply
		
		model.addAttribute("boardVo", boardVo);
		model.addAttribute("commentVos", commentVos);
		model.addAttribute("replyList", replyList);
		model.addAttribute("pag", pag);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("search", search);
		model.addAttribute("searchString", searchString);
		model.addAttribute("boardLikesVo", boardLikesVo);
		model.addAttribute("commentLikesVos", commentLikesVos);
		
		return "community/content";
	}
	
	@ResponseBody
	@RequestMapping(value="/boardLikesCheck", method=RequestMethod.POST)
	public int boardLikesCheck(int idx, int parentIdx) {		
		String memberId = "user123";	//나중에 session에 있는 값 꺼내오기
		LikesVo likesVo = communityService.getLikes("board", idx, memberId);

		if(likesVo == null) {
			System.out.println("실행됨null");
			int cres = communityService.setCreateLikes("board", idx, memberId, "", parentIdx);
			if(cres != 0) {
				cres = communityService.setUpdateLikeCnt("board", idx, 1);
			}
			return 1;
		}
		else {
			System.out.println("실행됨notnull");
			int cres = communityService.setDeleteLikes(likesVo.getIdx());
			if(cres != 0) {
				cres = communityService.setUpdateLikeCnt("board", idx, -1);
			}
			return -1;
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/commentLikesCheck", method=RequestMethod.POST)
	public int commentLikesCheck(int idx, int parentIdx) {		
		String memberId = "user123";	//나중에 session에 있는 값 꺼내오기
		LikesVo likesVo = communityService.getLikes("comment", idx, memberId);
		
		if(likesVo == null) {
			int cres = communityService.setCreateLikes("comment", idx, memberId, "board", parentIdx);
			if(cres != 0) {
				cres = communityService.setUpdateLikeCnt("comment", idx, 1);
			}
			return 1;
		}
		else {
			int cres = communityService.setDeleteLikes(likesVo.getIdx());
			if(cres != 0) {
				cres = communityService.setUpdateLikeCnt("comment", idx, -1);
			}
			return -1;
		}
	}
}
