package com.spring.springProject4.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.springProject4.service.CommunityService;
import com.spring.springProject4.vo.CategoryVo;

@Controller
@RequestMapping("/community")
public class CommunityController {
	
	@Autowired
	CommunityService communityService;
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String cmtyMainGet(Model model, String parentName) {
		parentName = "구단";
		
		List<CategoryVo> mainCategory = communityService.getCategoryList(null);
		List<CategoryVo> subCategory = communityService.getCategoryList(parentName);
		
		model.addAttribute("mainCategory", mainCategory);
		model.addAttribute("subCategory", subCategory);

		return "community/main";
	}
}
