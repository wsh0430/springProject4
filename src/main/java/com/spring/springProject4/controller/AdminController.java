package com.spring.springProject4.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.springProject4.common.StatData;
import com.spring.springProject4.service.AdminService;
import com.spring.springProject4.vo.StatDataVo;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	@Autowired
	StatData statData;
	
	@RequestMapping(value="/dashBoard", method=RequestMethod.GET)
	public String dashBoardGet(Model model) {
		
		StatDataVo statDataVo = statData.getStatDataVo();
		statDataVo.setDailyVisitDelta(-1);
		 
		model.addAttribute("statDataVo", statDataVo);
		
		return "admin/dashBoard";
	}
}
