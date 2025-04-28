package com.spring.springProject4.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CmtyMessageController {
	
	@RequestMapping(value = "/message/{msgFlag}", method = RequestMethod.GET)
	public String getMessage(Model model, @PathVariable String msgFlag,
			HttpSession session,
			@RequestParam(name="memberId", defaultValue = "", required = false) String memberId,
			@RequestParam(name="idx", defaultValue = "0", required = false) int idx,
			@RequestParam(name="category", defaultValue = "전체", required = false) String category,
			@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
			@RequestParam(name="pageSize", defaultValue = "10", required = false) int pageSize,
			@RequestParam(name="search", defaultValue = "", required = false) String search,
			@RequestParam(name="searchString", defaultValue = "", required = false) String searchString
		) {
		
		if(msgFlag.equals("cmtyBoardCreateOk")) {
			model.addAttribute("message", "게시글이 생성되었습니다.");
			model.addAttribute("url", "community/cmtyMain");
		}
		else if(msgFlag.equals("cmtyBoardCreateNo")) {
			model.addAttribute("message", "잠시 후 다시 시도해주세요.");
			model.addAttribute("url", "community/cmtyBoardCreate");
		}
		else if(msgFlag.equals("cmtyBoardUpdateOk")) {
			model.addAttribute("message", "게시글이 변경되었습니다.");
			model.addAttribute("url", "community/cmtyContent?boardIdx="+idx+"&category="+category+"&pag="+pag+"&pagSize="+pageSize+"&search"+search+"&searchString"+searchString);
		}
		else if(msgFlag.equals("cmtyBoardUpdateNo")) {
			model.addAttribute("message", "잠시 후 다시 시도해주세요.");
			model.addAttribute("url", "community/cmtyBoardUpdate?boardIdx="+idx+"&category="+category+"&pag="+pag+"&pagSize="+pageSize+"&search"+search+"&searchString"+searchString);
		}
		else if(msgFlag.equals("cmtyBoardDeleteCheckOk")) {
			model.addAttribute("message", "게시글이 삭제되었습니다.");
			model.addAttribute("url", "community/cmtyMain?category="+category+"&pag="+pag+"&pagSize="+pageSize+"&search"+search+"&searchString"+searchString);
		}
		else if(msgFlag.equals("cmtyBoardDeleteCheckNo")) {
			model.addAttribute("message", "잠시 후 다시 시도해주세요.");
			model.addAttribute("url", "community/cmtyBoardUpdate?boardIdx="+idx+"&category="+category+"&pag="+pag+"&pagSize="+pageSize+"&search"+search+"&searchString"+searchString);
		}
		
		return "include/message";
	}
}
