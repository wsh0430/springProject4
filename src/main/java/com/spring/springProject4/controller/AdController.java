package com.spring.springProject4.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.springProject4.service.AdService;

@Controller
@RequestMapping("/ad")
public class AdController {

	@Autowired
	AdService adService;
	
	@ResponseBody
	@RequestMapping(value="/adClose", method=RequestMethod.POST)
	public int adClosePost(int idx, String reason) {
		int res = 0;
		String sMemberId = "user123"; // 나중에 세션으로
		
		res = adService.setUpdateAdReportCnt(idx);
		
		if(res == 0) return 0;
		return adService.setCreateAdReport(sMemberId, idx,  reason);
	}
	
}
