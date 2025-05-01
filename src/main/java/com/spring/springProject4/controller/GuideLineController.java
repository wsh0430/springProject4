package com.spring.springProject4.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/guideLine")
public class GuideLineController {
	
	@GetMapping("/guideLineMain")
	public String showGuideLine() {
	   return "guideLine/guideLineMain"; 
	}
}
