package com.spring.springProject4.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.springProject4.common.Pagination;
import com.spring.springProject4.common.SetCommunityVar;
import com.spring.springProject4.service.CommunityService;
import com.spring.springProject4.vo.BoardVo;
import com.spring.springProject4.vo.CategoryVo;
import com.spring.springProject4.vo.ChartVo;
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
		PageVo pageVo = pagination.getTotRecCnt(category, pag,pageSize,"community",search,searchString);	// (페이지번호,한 페이지분량,section,part,검색어)
			
		
		// 보드
		List<BoardVo> boardVos = communityService.getBoardList(category, pageVo.getStartIndexNo(), pageVo.getPageSize(), search, searchString);

		// 핫게시판
		List<BoardVo> hotBoardVos = communityService.getHotBoardList(category);
		System.out.println(hotBoardVos);
		
		model.addAttribute("category", category);
		model.addAttribute("mainCtgyVos", mainCtgyVos);
		model.addAttribute("subCtgy", subCtgyList);
		model.addAttribute("boardVos", boardVos);
		model.addAttribute("hotBoardVos", hotBoardVos);
		model.addAttribute("pageVo", pageVo);

		return "community/main";
	}
	
	@SuppressWarnings("null")
	@RequestMapping(value="/cmtyContent", method=RequestMethod.GET)
	public String cmtyContentGet(Model model, 
			@RequestParam(name="boardIdx", defaultValue = "", required = false) int boardIdx,
			@RequestParam(name="category", defaultValue = "전체", required = false) String category,
			@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
			@RequestParam(name="pageSize", defaultValue = "10", required = false) int pageSize,
			@RequestParam(name="search", defaultValue = "", required = false) String search,
			@RequestParam(name="searchString", defaultValue = "", required = false) String searchString
			) {
		String memberId = "user123";	//나중에 session에 있는 값 꺼내오기
		
		BoardVo boardVo = communityService.getBoardVo(boardIdx);
		
		List<CommentVo> commentVos = communityService.getCommentVos(boardIdx);
		List<CommentVo> replyVos = null; 
		List<List<CommentVo>> replyList = new ArrayList<>();	
		for(int i = 0; i < commentVos.size(); i++) {
			replyVos = communityService.getReplyList(commentVos.get(i).getIdx());	
			replyList.add(replyVos);
		}
		
		LikesVo boardLikesVo = communityService.getLikes("board", boardIdx, memberId);
		List<LikesVo> cmtLikesList = communityService.getLikesVos("comment", "board", boardIdx, memberId);	//comment, reply
		Map<Integer, LikesVo> cmtLikesMap = SetCommunityVar.getLikesMap(cmtLikesList);
		
		List<Map<Integer, LikesVo>> replyLikesList = new ArrayList<Map<Integer, LikesVo>>();
		for(int i = 0; i < commentVos.size(); i++) {
			List<LikesVo> temp = communityService.getLikesVos("reply", "comment", commentVos.get(i).getIdx(), memberId);
			Map<Integer, LikesVo> map = SetCommunityVar.getLikesMap(temp);
			
			replyLikesList.add(map);
		}
		
		communityService.setUpdateBoardViewCnt(boardIdx);
		
		model.addAttribute("sMemberId", "user123"); //나중에 세션으로 넣는 id
		model.addAttribute("sNickname", "프로니");	//나중에 세션으로 넣는 nickname
		model.addAttribute("boardVo", boardVo);
		model.addAttribute("commentVos", commentVos);
		model.addAttribute("replyList", replyList);
		model.addAttribute("category", category);
		model.addAttribute("pag", pag);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("search", search);
		model.addAttribute("searchString", searchString);
		model.addAttribute("boardLikesVo", boardLikesVo);
		model.addAttribute("cmtLikesVos", cmtLikesMap);
		model.addAttribute("replyLikesList", replyLikesList);
		
		return "community/content";
	}
	
	@ResponseBody
	@RequestMapping(value="/likesCheck", method=RequestMethod.POST)
	public int likesCheckPost(int idx, String part, String parent, int parentIdx) {		
		String memberId = "user123";	//나중에 session에 있는 값 꺼내오기
		LikesVo likesVo = communityService.getLikes(part, idx, memberId);

		if(likesVo == null) {
			int cres = communityService.setCreateLikes(part, idx, memberId, parent, parentIdx);
			if(cres != 0) {
				cres = communityService.setUpdateLikeCnt(part, idx, 1);
			}
			return 1;
		}
		else {
			int cres = communityService.setDeleteLikes(likesVo.getIdx());
			if(cres != 0) {
				cres = communityService.setUpdateLikeCnt(part, idx, -1);
			}
			return -1;
		}
	}
		
	
	@ResponseBody
	@RequestMapping(value="/cmtInput", method=RequestMethod.POST)
	public int cmtInputPost(CommentVo cmtVo) {
		int res = communityService.setUpdateCommetCnt("comment", cmtVo.getBoardId());
		return communityService.setCreateComment(cmtVo);
	}
	
	@ResponseBody
	@RequestMapping(value="/replyInput", method=RequestMethod.POST)
	public int replyInputPost(CommentVo cmtVo) {
		int res = communityService.setUpdateCommetCnt("reply", cmtVo.getParentId());
		return communityService.setCreateReply(cmtVo);
	}
	
	@ResponseBody
	@RequestMapping(value="/cmtUpdate", method=RequestMethod.POST)
	public int cmtUpdatePost(int idx, String content) {
		return communityService.setUpdateComment(idx, content);
	}
	
	@ResponseBody
	@RequestMapping(value="/replyUpdate", method=RequestMethod.POST)
	public int replyUpdatePost(int idx, String content) {
		return communityService.setUpdateComment(idx, content);
	}
	
	@ResponseBody
	@RequestMapping(value="/cmtDeleteCheck", method=RequestMethod.POST)
	public int cmtDeleteCheckPost(int idx) {
		
		if(communityService.setUpdateDeleteCheck("reply", idx) != 0)
			return communityService.setUpdateDeleteCheck("comment", idx);
		
		return 0;
	}
	
	@ResponseBody
	@RequestMapping(value="/replyDeleteCheck", method=RequestMethod.POST)
	public int replyDeleteCheckPost(int idx) {
		return communityService.setUpdateDeleteCheck("comment", idx);
	}
	
	@RequestMapping(value = "/cmtyBoardCreate", method = RequestMethod.GET)
	public String cmtyBoardCreateGet(Model model) {
		// 카테고리
		List<CategoryVo> mainCtgyVos = communityService.getMainCategoryList();	// 메인 카테고리vos
		List<CategoryVo> subCtgyVos = null; 
		List<List<CategoryVo>> subCtgyList = new ArrayList<>();	//서브 카테고리
		for(int i = 0; i < mainCtgyVos.size(); i++) {
			subCtgyVos = communityService.getSubCategoryList(mainCtgyVos.get(i).getName());	//서브 카테고리vos
			subCtgyList.add(subCtgyVos);
		}
		
		model.addAttribute("mainCtgyVos", mainCtgyVos);
		model.addAttribute("subCtgyList", subCtgyList);
		
		return "community/boardCreate";
	}
	
	@RequestMapping(value = "/cmtyBoardCreate", method = RequestMethod.POST)
	public String cmtyBoardCreatePost(BoardVo vo) {
		if(vo.getCategoryName() == null || vo.getCategoryName() == "")
			vo.setCategoryName("전체");
		vo.setMemberId("user123"); //나중에 session꺼 넣기
		vo.setMemberNickname("프로니"); //나중에 session꺼 넣기
		
		if(vo.getContent().indexOf("src=\"/") != -1) communityService.imgCheck(vo.getContent());
		
		vo.setContent(vo.getContent().replace("/data/ckeditor/", "/data/cmtyBoard/"));		
		
		int res = communityService.setCreateBoard(vo);
		
		if(res == 1) return "redirect:/message/cmtyBoardCreateOk";
		else return "redirect:/message/cmtyBoardCreateNo";
	}
	
	@RequestMapping(value="/cmtyBoardUpdate", method=RequestMethod.GET)
	public String cmtyBoardUpdateGet(Model model, 
			@RequestParam(name="boardIdx", defaultValue = "", required = false) int boardIdx,
			@RequestParam(name="category", defaultValue = "전체", required = false) String category,
			@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
			@RequestParam(name="pageSize", defaultValue = "10", required = false) int pageSize,
			@RequestParam(name="search", defaultValue = "", required = false) String search,
			@RequestParam(name="searchString", defaultValue = "", required = false) String searchString
			) {
		
		BoardVo boardVo = communityService.getBoardVo(boardIdx);
		if(boardVo.getContent().indexOf("src=\"/") != -1) communityService.imgBackup(boardVo.getContent());
		
		// 카테고리
		List<CategoryVo> mainCtgyVos = communityService.getMainCategoryList();	// 메인 카테고리vos
		List<CategoryVo> subCtgyVos = null; 
		List<List<CategoryVo>> subCtgyList = new ArrayList<>();	//서브 카테고리
		for(int i = 0; i < mainCtgyVos.size(); i++) {
			subCtgyVos = communityService.getSubCategoryList(mainCtgyVos.get(i).getName());	//서브 카테고리vos
			subCtgyList.add(subCtgyVos);
		}
				
				
		model.addAttribute("mainCtgyVos", mainCtgyVos);
		model.addAttribute("subCtgyList", subCtgyList);
		model.addAttribute("boardVo", boardVo);
		model.addAttribute("idx", boardIdx);
		model.addAttribute("category", category);
		model.addAttribute("pag", pag);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("search", search);
		model.addAttribute("searchString", searchString);
		
		return "community/boardUpdate";
	}
	
	@RequestMapping(value = "/cmtyBoardUpdate", method = RequestMethod.POST)
	public String cmtyBoardUpdatePost(Model model, BoardVo vo,
			@RequestParam(name="category", defaultValue = "전체", required = false) String category,
			@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
			@RequestParam(name="pageSize", defaultValue = "10", required = false) int pageSize,
			@RequestParam(name="search", defaultValue = "", required = false) String search,
			@RequestParam(name="searchString", defaultValue = "", required = false) String searchString
			) {
		if(vo.getCategoryName() == null || vo.getCategoryName() == "")
			vo.setCategoryName("전체");
		vo.setMemberId("user123"); //나중에 session꺼 넣기
		vo.setMemberNickname("프로니");
		
		// 수정된 자료가 원본자료와 완전히 동일하다면 수정할 필요가 없다.
		BoardVo dbVo = communityService.getBoardVo(vo.getIdx());
				
		// content의 내용이 조금이라도 변경이 되었다면 내용을 수정처리한것이기에, 그림파일 처리유무를 결정한다.
		if(!dbVo.getContent().equals(vo.getContent())) {
			// 1.기존 board폴더의 그림이 존재했다면,원본그림을 모두 삭제처리한다.
			if(dbVo.getContent().indexOf("src=\"/") != -1) communityService.imgDelete(dbVo.getContent());
					
			// 2.삭제후 'board'폴더를 'ckeditor'폴더로 경로 변경
			vo.setContent(vo.getContent().replace("/data/cmtyBoard/", "/data/ckeditor/"));
					
			// 1,2번 작업을 마치면 처음 글을 올릴때와 똑 같은 상황으로 처리하면 된다.
			if(vo.getContent().indexOf("src=\"/") != -1) communityService.imgCheck(vo.getContent());
					
			// 이미지 복사작업을 모두 마치면(ckeditor폴더에서 board폴더로) 'ckeditor -> board' 변경한다.
			vo.setContent(vo.getContent().replace("/data/ckeditor/", "/data/cmtyBoard/"));
		}
		int res = communityService.setUpdateBoard(vo);
		
		model.addAttribute("idx", vo.getIdx());
		model.addAttribute("category", category);
		model.addAttribute("pag", pag);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("search", search);
		model.addAttribute("searchString", searchString);
		
		if(res == 1) return "redirect:/message/cmtyBoardUpdateOk";
		else return "redirect:/message/cmtyBoardUpdateNo?";
	}
	
	
	@RequestMapping(value="/cmtyBoardDeleteCheck", method=RequestMethod.GET)
	public String cmtyBoardDeleteGet(Model model, 
			@RequestParam(name="boardIdx", defaultValue = "", required = false) int boardIdx,
			@RequestParam(name="category", defaultValue = "전체", required = false) String category,
			@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
			@RequestParam(name="pageSize", defaultValue = "10", required = false) int pageSize,
			@RequestParam(name="search", defaultValue = "", required = false) String search,
			@RequestParam(name="searchString", defaultValue = "", required = false) String searchString
			) {
		
		int res = communityService.setUpdateBoardDeleteCheck(boardIdx);
		
		model.addAttribute("category", category);
		model.addAttribute("pag", pag);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("search", search);
		model.addAttribute("searchString", searchString);
		
		if(res == 1) return "redirect:/message/cmtyBoardDeleteCheckOk";
		else return "redirect:/message/cmtyBoardDeleteCheckNo?idx="+boardIdx;
	}

}
