package com.spring.springProject4.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.springProject4.service.AdService;
import com.spring.springProject4.vo.AdvertisementVo;

@Controller
@RequestMapping("/ad")
public class AdController {

	@Autowired
	AdService adService;
	
	@RequestMapping(value="/cmtyMain", method=RequestMethod.GET)
	public String cmtyMainGet(Model model) {
		
		 AdvertisementVo adVo = adService.getAdVo("모비노기");
		 
		 model.addAttribute("adVo", adVo);
		
		return "layout/ad_lr";
	}
}
