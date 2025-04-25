package com.spring.springProject4.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.springProject4.service.DataChartService;
import com.spring.springProject4.service.PitcherRecordService;
import com.spring.springProject4.service.PlayerRecordService;
import com.spring.springProject4.service.TeamPitcherRecordService;
import com.spring.springProject4.service.TeamPlayerRecordService;

@Controller
@RequestMapping("/dataChart")
public class DataChartController {

  @Autowired
  private DataChartService dataChartService;

  @Autowired
  private PlayerRecordService playerRecordService;

  @Autowired
  private PitcherRecordService pitcherRecordService;

  @Autowired
  private TeamPlayerRecordService teamPlayerRecordService;

  @Autowired
  private TeamPitcherRecordService teamPitcherRecordService;
	//JSP 호출용
	@GetMapping("/dataChartMain")
	public String showChartPage() {
	   return "dataChart/dataChartMain";  // 너의 jsp 위치에 맞춰서 경로 수정
	}
	
	//데이터 응답용
	@GetMapping("/getAverageData")
	@ResponseBody
	public List<Map<String, Object>> getAverageData(
	       @RequestParam String columnName,
	       @RequestParam int startYear,
	       @RequestParam int endYear) {
	   return teamPlayerRecordService.getAverageByAttribute(columnName, startYear, endYear);
	}
}