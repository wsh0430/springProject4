package com.spring.springProject4.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.springProject4.dto.PitcherRecordDto;
import com.spring.springProject4.dto.PlayerRecordDto;
import com.spring.springProject4.dto.TeamPitcherRecordDto;
import com.spring.springProject4.dto.TeamPlayerRecordDto;
import com.spring.springProject4.service.PitcherRecordService;
import com.spring.springProject4.service.PlayerRecordService;
import com.spring.springProject4.service.TeamPitcherRecordService;
import com.spring.springProject4.service.TeamPlayerRecordService;

@Controller
@RequestMapping("/dataChart")
public class DataChartController {

  @Autowired
  private PlayerRecordService playerRecordService;

  @Autowired
  private PitcherRecordService pitcherRecordService;

  @Autowired
  private TeamPlayerRecordService teamPlayerRecordService;

  @Autowired
  private TeamPitcherRecordService teamPitcherRecordService;
  
	//JSP 호출(팀타격)
	@GetMapping("/teamPlayerAverage")
	public String showChartPage() {
	   return "dataChart/teamPlayerAverage"; 
	}
	
	//차트(팀타격)
  @GetMapping("/teamPlayerAverage2")
  @ResponseBody
  public List<TeamPlayerRecordDto> getTeamPlayerAverage(
      @RequestParam("field") String field,
      @RequestParam("startYear") int startYear,
      @RequestParam("endYear") int endYear) {
      return teamPlayerRecordService.getAverageByYear(field, startYear, endYear);
  }
  
	//JSP 호출(팀투구)
	@GetMapping("/teamPitcherAverage")
	public String showTeamPitcherChartPage() {
	   return "dataChart/teamPitcherAverage"; 
	}
  
	//차트(팀투구)
  @RequestMapping("/teamPitcherAverage2")
  @ResponseBody
  public List<TeamPitcherRecordDto> getPitcherAverageByYear(
          @RequestParam("field") String field,
          @RequestParam("startYear") int startYear,
          @RequestParam("endYear") int endYear) {
      return teamPitcherRecordService.getPitcherAverageByYear(field, startYear, endYear);
  }
  
	//JSP 호출(개인타자)
	@GetMapping("/playerInfo")
	public String showChartPage2() {
	   return "dataChart/playerInfo"; 
	}
	
	//차트(개인타자)
  @GetMapping("/playerInfo2")
  @ResponseBody
  public List<PlayerRecordDto> getPlayerAverage(
      @RequestParam("playerName") String playerName,
      @RequestParam("position") String position,
      @RequestParam("field") String field,
      @RequestParam("startYear") int startYear,
      @RequestParam("endYear") int endYear
      ) {
      return playerRecordService.getAverageCompaerByYear(playerName, position, field, startYear, endYear);
  }
  
	//JSP 호출(개인투수)
	@GetMapping("/comparePitcher")
	public String showChartPage3() {
	   return "dataChart/comparePitcher"; 
	}
  
  //차트(개인투수)
  @GetMapping("/comparePitchers2")
  @ResponseBody
  public List<PitcherRecordDto> compareTwoPitchers(
          @RequestParam String player1,
          @RequestParam String player2,
          @RequestParam int startYear,
          @RequestParam int endYear,
          @RequestParam String field) {
      return pitcherRecordService.compareTwoPitchersByYear(player1, player2, startYear, endYear, field);
  }

}
