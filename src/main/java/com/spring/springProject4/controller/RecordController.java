package com.spring.springProject4.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.springProject4.dto.PitcherRecordDto;
import com.spring.springProject4.dto.PitcherTotalRecordDto;
import com.spring.springProject4.dto.PlayerRecordDto;
import com.spring.springProject4.dto.PlayerTotalRecordDto;
import com.spring.springProject4.dto.TeamPitcherRecordDto;
import com.spring.springProject4.dto.TeamPlayerRecordDto;
import com.spring.springProject4.service.PitcherRecordService;
import com.spring.springProject4.service.PitcherTotalRecordService;
import com.spring.springProject4.service.PlayerRecordService;
import com.spring.springProject4.service.PlayerTotalRecordService;
import com.spring.springProject4.service.TeamPitcherRecordService;
import com.spring.springProject4.service.TeamPlayerRecordService;

import io.github.bonigarcia.wdm.WebDriverManager;

@Controller
@RequestMapping("/record")
public class RecordController {
	
	@Autowired
	private PlayerRecordService playerRecordService; 
	
	@Autowired
	private PitcherRecordService pitcherRecordService;
	
	@Autowired
	private PlayerTotalRecordService playerTotalRecordService;
	
	@Autowired
	private PitcherTotalRecordService pitcherTotalRecordService;
	
	@Autowired
	private TeamPlayerRecordService teamPlayerRecordService;
	
	@Autowired
	private TeamPitcherRecordService teamPitcherRecordService;
	
	@RequestMapping("/recordCrawl")
	public String recordget() {
		return "record/recordCrawl";
	}

	//연도 보정 함수 (1982~1999은 1900+, 2000~2025는 2000+)
	private int fixYear(String y) {
	   int num = Integer.parseInt(y);
	   return (num >= 82) ? 1900 + num : 2000 + num;
	}
	
	//타자(시즌)
	@ResponseBody
	@RequestMapping(value = "/HitterRecord", method = RequestMethod.POST)
	public List<PlayerRecordDto> HitterPostAndSave(
      @RequestParam("startYear") int startYear,
      @RequestParam("orderBy") String orderBy,
      @RequestParam("endYear") int endYear,
      @RequestParam("sortOptions") String sortOptions,
      @RequestParam("team") String team,
      @RequestParam("positionOrder") String positionOrder
      ) throws IOException {
	    List<PlayerRecordDto> recordList = new ArrayList<>();

	    ChromeOptions options = new ChromeOptions();
	    options.addArguments("--headless", "--disable-gpu", "--no-sandbox", "--disable-dev-shm-usage");

	    WebDriverManager.chromedriver().setup();
	    WebDriver driver = new ChromeDriver(options);


	    try {
	        for (int year = startYear; year <= endYear; year++) {
        
            String url = "https://statiz.sporki.com/stats/?m=main&m2=batting&m3=default"
                       + "&so=" + sortOptions
                       + "&ob=" + orderBy
                       + "&year=" + year
                       + "&te=" + team
                       + "&po=" + positionOrder
                       + "&reg=R";
            System.out.println(url);
            driver.get(url);
            Thread.sleep(5500); // 페이지 로딩 대기(5.5초), 스탯티즈는 robots.txt 기준 5초 권장 중

            List<WebElement> rows = driver.findElements(By.cssSelector("table tbody tr"));

            for (WebElement row : rows) {	
              List<WebElement> tds = row.findElements(By.tagName("td"));
              if (tds.size() > 10) {
                  try {
                      String player = tds.get(1).getText().trim();
                      WebElement teamTd = tds.get(2);
                      String teamLogo = teamTd.findElement(By.tagName("img")).getAttribute("src");
                      List<WebElement> spans = teamTd.findElements(By.tagName("span"));
                      String yearText = spans.get(0).getText().trim();
                      String position = spans.get(2).getText().trim();

                      PlayerRecordDto dto = new PlayerRecordDto();
                      dto.setPlayer(player);
                      dto.setTeamLogo(teamLogo);
                      dto.setPosition(position);
                      dto.setYear(fixYear(yearText));

                      dto.setGames(Integer.parseInt(tds.get(4).getText().trim()));
                      dto.setTasuk(Integer.parseInt(tds.get(7).getText().trim()));
                      dto.setAtBats(Integer.parseInt(tds.get(9).getText().trim()));
                      dto.setRuns(Integer.parseInt(tds.get(10).getText().trim()));
                      dto.setHits(Integer.parseInt(tds.get(11).getText().trim()));
                      dto.setDoubles(Integer.parseInt(tds.get(12).getText().trim()));
                      dto.setTriples(Integer.parseInt(tds.get(13).getText().trim()));
                      dto.setHomeRuns(Integer.parseInt(tds.get(14).getText().trim()));
                      dto.setRbi(Integer.parseInt(tds.get(16).getText().trim()));
                      dto.setStolenBases(Integer.parseInt(tds.get(17).getText().trim()));
                      dto.setStolenBasesFail(Integer.parseInt(tds.get(18).getText().trim()));
                      int bb = Integer.parseInt(tds.get(19).getText().trim())
                              + Integer.parseInt(tds.get(20).getText().trim())
                              + Integer.parseInt(tds.get(21).getText().trim());
                      dto.setBb(bb);
                      dto.setStrikeouts(Integer.parseInt(tds.get(22).getText().trim()));
                      dto.setDoublePlays(Integer.parseInt(tds.get(23).getText().trim()));
                      dto.setSacHits(Integer.parseInt(tds.get(24).getText().trim()));
                      dto.setSacFlies(Integer.parseInt(tds.get(25).getText().trim()));
                      dto.setAvg(Float.parseFloat(tds.get(26).getText().trim()));
                      dto.setObp(Float.parseFloat(tds.get(27).getText().trim()));
                      dto.setSlg(Float.parseFloat(tds.get(28).getText().trim()));
                      dto.setOps(Float.parseFloat(String.format("%.3f",
                              dto.getObp() + dto.getSlg())));
                      dto.setWar(Float.parseFloat(tds.get(3).getText().trim()));

                      int totalBases = (dto.getHits() - dto.getDoubles() - dto.getTriples() - dto.getHomeRuns())
                              + dto.getDoubles() * 2 + dto.getTriples() * 3 + dto.getHomeRuns() * 4;
                      dto.setTotalBases(totalBases);

                      playerRecordService.savePlayerRecord(dto);
                      recordList.add(dto);
                  } catch (Exception e) {
                      System.err.println("[" + year + "][" + sortOptions + "] 파싱 오류: " + e.getMessage());
                      continue;
                  }
            }
          }
	      }
	    } catch (InterruptedException e1) {
				e1.printStackTrace();
			} finally {
	        driver.quit();
	    }

	    return recordList;
	}

	
	//투수(시즌)
	@ResponseBody
	@RequestMapping(value = "/PitcherRecord", method = RequestMethod.POST)
	public List<PitcherRecordDto> PitcherPostAndSave(
	    @RequestParam("startYearPic") int startYear,
	    @RequestParam("orderByPic") String orderBy,
	    @RequestParam("endYearPic") int endYear,
	    @RequestParam("sortOptionsPic") String sortOptions,
	    @RequestParam("teamPic") String team
	) throws IOException {
	    List<PitcherRecordDto> recordList = new ArrayList<>();

	    ChromeOptions options = new ChromeOptions();
	    options.addArguments("--headless", "--disable-gpu", "--no-sandbox", "--disable-dev-shm-usage");

	    WebDriverManager.chromedriver().setup();
	    WebDriver driver = new ChromeDriver(options);

	    try {
	        for (int year = startYear; year <= endYear; year++) {
	            String url = "https://statiz.sporki.com/stats/?m=main&m2=pitching&m3=default"
	                    + "&so=" + sortOptions
	                    + "&ob=" + orderBy
	                    + "&year=" + year
	                    + "&te=" + team
	                    + "&reg=R";
	            System.out.println(url);
	            driver.get(url);
	            Thread.sleep(5500);

	            List<WebElement> rows = driver.findElements(By.cssSelector("table tbody tr"));

	            for (WebElement row : rows) {
	                List<WebElement> tds = row.findElements(By.tagName("td"));
	                if (tds.size() > 10) {
	                    try {
	                        String player = tds.get(1).getText().trim();
	                        WebElement teamTd = tds.get(2);
	                        String teamLogo = teamTd.findElement(By.tagName("img")).getAttribute("src");
	                        List<WebElement> spans = teamTd.findElements(By.tagName("span"));
	                        String yearText = spans.get(0).getText().trim();

	                        PitcherRecordDto dto = new PitcherRecordDto();
	                        dto.setPlayer(player);
	                        dto.setTeamLogo(teamLogo);
	                        dto.setYear(Integer.parseInt(yearText));
	                        dto.setWar(Float.parseFloat(tds.get(3).getText().trim()));
	                        dto.setGamesP(Integer.parseInt(tds.get(4).getText().trim()));
	                        dto.setGamesStart(Integer.parseInt(tds.get(5).getText().trim()));
	                        dto.setCompleteGames(Integer.parseInt(tds.get(8).getText().trim()));
	                        dto.setShutouts(Integer.parseInt(tds.get(9).getText().trim()));
	                        dto.setWins(Integer.parseInt(tds.get(10).getText().trim()));
	                        dto.setLosses(Integer.parseInt(tds.get(11).getText().trim()));
	                        dto.setSaves(Integer.parseInt(tds.get(12).getText().trim()));
	                        dto.setHolds(Integer.parseInt(tds.get(13).getText().trim()));
	                        dto.setInnings(Float.parseFloat(tds.get(14).getText().trim()));
	                        dto.setEarnedRuns(Integer.parseInt(tds.get(15).getText().trim()));
	                        dto.setRunsAllowed(Integer.parseInt(tds.get(16).getText().trim()));
	                        dto.setHitsAllowed(Integer.parseInt(tds.get(19).getText().trim()));
	                        dto.setHomeRunsAllowed(Integer.parseInt(tds.get(22).getText().trim()));
	                        int bb = Integer.parseInt(tds.get(23).getText().trim())
	                                 + Integer.parseInt(tds.get(24).getText().trim())
	                                 + Integer.parseInt(tds.get(25).getText().trim());
	                        dto.setBbAllowed(bb);
	                        dto.setStrikeouts(Integer.parseInt(tds.get(26).getText().trim()));
	                        dto.setBalks(Integer.parseInt(tds.get(28).getText().trim()));
	                        dto.setWildPitches(Integer.parseInt(tds.get(29).getText().trim()));
	                        
	                        dto.setEra(Float.parseFloat(tds.get(30).getText().trim()));
	                        dto.setFip(Float.parseFloat(tds.get(34).getText().trim()));
	                        dto.setWhip(Float.parseFloat(tds.get(35).getText().trim()));

	                        pitcherRecordService.savePitcherRecord(dto);
	                        recordList.add(dto);
	                    } catch (Exception e) {
	                        System.err.println("[" + year + "][" + sortOptions + "] 파싱 오류: " + e.getMessage());
	                        continue;
	                    }
	                }
	            }
	        }
	    } catch (InterruptedException e1) {
	        e1.printStackTrace();
	    } finally {
	        driver.quit();
	    }

	    return recordList;
	}
	
	//타자(통산)
	@ResponseBody
	@RequestMapping(value = "/HitterTotalRecord", method = RequestMethod.POST)
	public List<PlayerTotalRecordDto> HitterTotalPostAndSave(
	    @RequestParam("startYearTotal") int startYear,
	    @RequestParam("endYearTotal") int endYear,
	    @RequestParam("orderByTotal") String orderBy,
	    @RequestParam("sortOptionsTotal") String sortOptions,
	    @RequestParam("teamTotal") String team,
	    @RequestParam("positionOrderTotal") String positionOrder
	) throws IOException {
	    List<PlayerTotalRecordDto> recordList = new ArrayList<>();

	    ChromeOptions options = new ChromeOptions();
	    options.addArguments("--headless", "--disable-gpu", "--no-sandbox", "--disable-dev-shm-usage");

	    WebDriverManager.chromedriver().setup();
	    WebDriver driver = new ChromeDriver(options);

	    try {
	            String url = "https://statiz.sporki.com/stats/?m=total&m2=batting&m3=default"
	                       + "&so=" + sortOptions
	                       + "&ob=" + orderBy
	                       + "&sy=" + startYear
	                       + "&ey=" + endYear
	                       + "&te=" + team
	                       + "&po=" + positionOrder
	                       + "&reg=R";
	            System.out.println("[크롤링 URL] " + url);
	            driver.get(url);
	            Thread.sleep(5500); // 로딩 대기

	            List<WebElement> rows = driver.findElements(By.cssSelector("table tbody tr"));

	            for (WebElement row : rows) {
	                List<WebElement> tds = row.findElements(By.tagName("td"));
	                if (tds.size() > 10) {
	                    try {
	                        String player = tds.get(1).getText().trim();
	                        WebElement teamTd = tds.get(2);
	                        List<WebElement> spans = teamTd.findElements(By.tagName("span"));
	                        String yearText = spans.get(0).getText().trim();  // ex: 2007-2023+
	                        String teamLogo = spans.get(1).getText().trim();
	                        String position = spans.get(2).getText().trim();

	                        PlayerTotalRecordDto dto = new PlayerTotalRecordDto();
	                        dto.setPlayer(player);
	                        dto.setTeamLogo(teamLogo);
	                        dto.setPosition(position);
	                        dto.setYear(yearText);  // VARCHAR로 저장

	                        dto.setGames(Integer.parseInt(tds.get(4).getText().trim()));
	                        dto.setTasuk(Integer.parseInt(tds.get(7).getText().trim()));
	                        dto.setAtBats(Integer.parseInt(tds.get(9).getText().trim()));
	                        dto.setRuns(Integer.parseInt(tds.get(10).getText().trim()));
	                        dto.setHits(Integer.parseInt(tds.get(11).getText().trim()));
	                        dto.setDoubles(Integer.parseInt(tds.get(12).getText().trim()));
	                        dto.setTriples(Integer.parseInt(tds.get(13).getText().trim()));
	                        dto.setHomeRuns(Integer.parseInt(tds.get(14).getText().trim()));
	                        dto.setRbi(Integer.parseInt(tds.get(16).getText().trim()));
	                        dto.setStolenBases(Integer.parseInt(tds.get(17).getText().trim()));
	                        dto.setStolenBasesFail(Integer.parseInt(tds.get(18).getText().trim()));
	                        int bb = Integer.parseInt(tds.get(19).getText().trim())
	                                + Integer.parseInt(tds.get(20).getText().trim())
	                                + Integer.parseInt(tds.get(21).getText().trim());
	                        dto.setBb(bb);
	                        dto.setStrikeouts(Integer.parseInt(tds.get(22).getText().trim()));
	                        dto.setDoublePlays(Integer.parseInt(tds.get(23).getText().trim()));
	                        dto.setSacHits(Integer.parseInt(tds.get(24).getText().trim()));
	                        dto.setSacFlies(Integer.parseInt(tds.get(25).getText().trim()));
	                        dto.setAvg(Float.parseFloat(tds.get(26).getText().trim()));
	                        dto.setObp(Float.parseFloat(tds.get(27).getText().trim()));
	                        dto.setSlg(Float.parseFloat(tds.get(28).getText().trim()));
	                        dto.setOps(Float.parseFloat(String.format("%.3f",
	                                dto.getObp() + dto.getSlg())));
	                        dto.setWar(Float.parseFloat(tds.get(3).getText().trim()));

	                        int totalBases = (dto.getHits() - dto.getDoubles() - dto.getTriples() - dto.getHomeRuns())
	                                + dto.getDoubles() * 2 + dto.getTriples() * 3 + dto.getHomeRuns() * 4;
	                        dto.setTotalBases(totalBases);

	                        playerTotalRecordService.savePlayerRecord(dto);  // 메서드명도 수정됨
	                        recordList.add(dto);
	                    } catch (Exception e) {
	                        System.err.println("[" + startYear + "][" + sortOptions + "] 파싱 오류: " + e.getMessage());
	                        continue;
	                    }
	                }
	            }
	        
	    } catch (InterruptedException e1) {
	        e1.printStackTrace();
	    } finally {
	        driver.quit();
	    }

	    return recordList;
	}
	
	
	//투수(통산)
	@ResponseBody
	@RequestMapping(value = "/PitcherTotalRecord", method = RequestMethod.POST)
	public List<PitcherTotalRecordDto> PitcherTotalPostAndSave(
	    @RequestParam("startYearTotalPic") int startYear,
	    @RequestParam("orderByTotalPic") String orderBy,
	    @RequestParam("endYearTotalPic") int endYear,
	    @RequestParam("sortOptionsTotalPic") String sortOptions,
	    @RequestParam("teamTotalPic") String team
	) throws IOException {
	    List<PitcherTotalRecordDto> recordList = new ArrayList<>();

	    ChromeOptions options = new ChromeOptions();
	    options.addArguments("--headless", "--disable-gpu", "--no-sandbox", "--disable-dev-shm-usage");

	    WebDriverManager.chromedriver().setup();
	    WebDriver driver = new ChromeDriver(options);

	    try {
	        
	            String url = "https://statiz.sporki.com/stats/?m=total&m2=pitching&m3=default"
	                    + "&so=" + sortOptions
	                    + "&ob=" + orderBy
                      + "&sy=" + startYear
                      + "&ey=" + endYear
	                    + "&te=" + team
	                    + "&reg=R";
	            System.out.println(url);
	            driver.get(url);
	            Thread.sleep(5500);

	            List<WebElement> rows = driver.findElements(By.cssSelector("table tbody tr"));

	            for (WebElement row : rows) {
	                List<WebElement> tds = row.findElements(By.tagName("td"));
	                if (tds.size() > 10) {
	                    try {
	                        String player = tds.get(1).getText().trim();
	                        WebElement teamTd = tds.get(2);
	                        List<WebElement> spans = teamTd.findElements(By.tagName("span"));
	                        String yearText = spans.get(0).getText().trim();
	                        String teamLogo = spans.get(1).getText().trim();

	                        PitcherTotalRecordDto dto = new PitcherTotalRecordDto();
	                        dto.setPlayer(player);
	                        dto.setTeamLogo(teamLogo);
	                        dto.setYear(yearText);
	                        dto.setWar(Float.parseFloat(tds.get(3).getText().trim()));
	                        dto.setGamesP(Integer.parseInt(tds.get(4).getText().trim()));
	                        dto.setGamesStart(Integer.parseInt(tds.get(5).getText().trim()));
	                        dto.setCompleteGames(Integer.parseInt(tds.get(8).getText().trim()));
	                        dto.setShutouts(Integer.parseInt(tds.get(9).getText().trim()));
	                        dto.setWins(Integer.parseInt(tds.get(10).getText().trim()));
	                        dto.setLosses(Integer.parseInt(tds.get(11).getText().trim()));
	                        dto.setSaves(Integer.parseInt(tds.get(12).getText().trim()));
	                        dto.setHolds(Integer.parseInt(tds.get(13).getText().trim()));
	                        dto.setInnings(Float.parseFloat(tds.get(14).getText().trim()));
	                        dto.setEarnedRuns(Integer.parseInt(tds.get(15).getText().trim()));
	                        dto.setRunsAllowed(Integer.parseInt(tds.get(16).getText().trim()));
	                        dto.setHitsAllowed(Integer.parseInt(tds.get(19).getText().trim()));
	                        dto.setHomeRunsAllowed(Integer.parseInt(tds.get(22).getText().trim()));
	                        int bb = Integer.parseInt(tds.get(23).getText().trim())
	                                 + Integer.parseInt(tds.get(24).getText().trim())
	                                 + Integer.parseInt(tds.get(25).getText().trim());
	                        dto.setBbAllowed(bb);
	                        dto.setStrikeouts(Integer.parseInt(tds.get(26).getText().trim()));
	                        dto.setBalks(Integer.parseInt(tds.get(28).getText().trim()));
	                        dto.setWildPitches(Integer.parseInt(tds.get(29).getText().trim()));
	                        
	                        dto.setEra(Float.parseFloat(tds.get(30).getText().trim()));
	                        dto.setFip(Float.parseFloat(tds.get(34).getText().trim()));
	                        dto.setWhip(Float.parseFloat(tds.get(35).getText().trim()));

	                        pitcherTotalRecordService.savePitcherRecord(dto);
	                        recordList.add(dto);
	                    } catch (Exception e) {
	                        System.err.println("[" + startYear + "][" + sortOptions + "] 파싱 오류: " + e.getMessage());
	                        continue;
	                    }
	                }
	            }
	        
	    } catch (InterruptedException e1) {
	        e1.printStackTrace();
	    } finally {
	        driver.quit();
	    }

	    return recordList;
	}


	//팀(타자)
	@ResponseBody
	@RequestMapping(value = "/TeamHitterRecord", method = RequestMethod.POST)
	public List<TeamPlayerRecordDto> TeamHitterRecordPostAndSave(
	    @RequestParam("teamsstartYearhit") int startYear,
	    @RequestParam("teamsendYearhit") int endYear,
	    @RequestParam("teamsorderByhit") String orderBy,
	    @RequestParam("teamssortOptionshit") String sortOptions,
	    @RequestParam("teamsteamhit") String team,
	    @RequestParam("teamspositionOrderhit") String positionOrder
	) throws IOException {
	    List<TeamPlayerRecordDto> recordList = new ArrayList<>();

	    ChromeOptions options = new ChromeOptions();
	    options.addArguments("--headless", "--disable-gpu", "--no-sandbox", "--disable-dev-shm-usage");

	    WebDriverManager.chromedriver().setup();
	    WebDriver driver = new ChromeDriver(options);

	    try {
	            String url = "https://statiz.sporki.com/stats/?m=team&m2=batting&m3=default"
	                       + "&so=" + sortOptions
	                       + "&ob=" + orderBy
	                       + "&sy=" + startYear
	                       + "&ey=" + endYear
	                       + "&te=" + team
	                       + "&po=" + positionOrder
	                       + "&reg=R";
	            System.out.println("[크롤링 URL] " + url);
	            driver.get(url);
	            Thread.sleep(5500); // 로딩 대기
	            
	            List<WebElement> rows = driver.findElements(By.cssSelector("table:nth-of-type(2) tbody tr"));
	            
	            for (WebElement row : rows) {
	                List<WebElement> tds = row.findElements(By.tagName("td"));
	                if (tds.size() > 10) {
	                    try {
	                        String teamName = tds.get(1).getText().trim();
	                        WebElement teamTd = tds.get(1);
	                        String teamLogo = teamTd.findElement(By.tagName("img")).getAttribute("src");
	                        String yearText = tds.get(2).getText().trim();

	                        TeamPlayerRecordDto dto = new TeamPlayerRecordDto();
	                        dto.setTeamName(teamName);
	                        dto.setTeamLogo(teamLogo);
	                        dto.setYear(Integer.parseInt(yearText));

	                        dto.setGames(Integer.parseInt(tds.get(4).getText().trim()));
	                        dto.setTasuk(Integer.parseInt(tds.get(7).getText().trim()));
	                        dto.setAtBats(Integer.parseInt(tds.get(9).getText().trim()));
	                        dto.setRuns(Integer.parseInt(tds.get(10).getText().trim()));
	                        dto.setHits(Integer.parseInt(tds.get(11).getText().trim()));
	                        dto.setDoubles(Integer.parseInt(tds.get(12).getText().trim()));
	                        dto.setTriples(Integer.parseInt(tds.get(13).getText().trim()));
	                        dto.setHomeRuns(Integer.parseInt(tds.get(14).getText().trim()));
	                        dto.setRbi(Integer.parseInt(tds.get(16).getText().trim()));
	                        dto.setStolenBases(Integer.parseInt(tds.get(17).getText().trim()));
	                        dto.setStolenBasesFail(Integer.parseInt(tds.get(18).getText().trim()));
	                        int bb = Integer.parseInt(tds.get(19).getText().trim())
	                                + Integer.parseInt(tds.get(20).getText().trim())
	                                + Integer.parseInt(tds.get(21).getText().trim());
	                        dto.setBb(bb);
	                        dto.setStrikeouts(Integer.parseInt(tds.get(22).getText().trim()));
	                        dto.setDoublePlays(Integer.parseInt(tds.get(23).getText().trim()));
	                        dto.setSacHits(Integer.parseInt(tds.get(24).getText().trim()));
	                        dto.setSacFlies(Integer.parseInt(tds.get(25).getText().trim()));
	                        dto.setAvg(Float.parseFloat(tds.get(26).getText().trim()));
	                        dto.setObp(Float.parseFloat(tds.get(27).getText().trim()));
	                        dto.setSlg(Float.parseFloat(tds.get(28).getText().trim()));
	                        dto.setOps(Float.parseFloat(String.format("%.3f",
	                                dto.getObp() + dto.getSlg())));
	                        dto.setWar(Float.parseFloat(tds.get(3).getText().trim()));

	                        int totalBases = (dto.getHits() - dto.getDoubles() - dto.getTriples() - dto.getHomeRuns())
	                                + dto.getDoubles() * 2 + dto.getTriples() * 3 + dto.getHomeRuns() * 4;
	                        dto.setTotalBases(totalBases);

	                        teamPlayerRecordService.savePlayerRecord(dto);  // 메서드명도 수정됨
	                        recordList.add(dto);
	                    } catch (Exception e) {
	                        System.err.println("[" + startYear + "][" + sortOptions + "] 파싱 오류: " + e.getMessage());
	                        continue;
	                    }
	                }
	            }
	        
	    } catch (InterruptedException e1) {
	        e1.printStackTrace();
	    } finally {
	        driver.quit();
	    }

	    return recordList;
	}
	
	
	//팀(투수)
	@ResponseBody
	@RequestMapping(value = "/TeamPitcherRecord", method = RequestMethod.POST)
	public List<TeamPitcherRecordDto> TeamPitcherRecordPostAndSave(
	    @RequestParam("teamsstartYearPic") int startYear,
	    @RequestParam("teamsendYearPic") int endYear,
	    @RequestParam("teamsorderByPic") String orderBy,
	    @RequestParam("teamssortOptionsPic") String sortOptions,
	    @RequestParam("teamsteamPic") String team,
	    @RequestParam("teamspositionOrderPic") String positionOrder
	) throws IOException {
	    List<TeamPitcherRecordDto> recordList = new ArrayList<>();

	    ChromeOptions options = new ChromeOptions();
	    options.addArguments("--headless", "--disable-gpu", "--no-sandbox", "--disable-dev-shm-usage");

	    WebDriverManager.chromedriver().setup();
	    WebDriver driver = new ChromeDriver(options);

	    try {
	            String url = "https://statiz.sporki.com/stats/?m=team&m2=pitching&m3=default"
	                       + "&so=" + sortOptions
	                       + "&ob=" + orderBy
	                       + "&sy=" + startYear
	                       + "&ey=" + endYear
	                       + "&te=" + team
	                       + "&po=" + positionOrder
	                       + "&reg=R";
	            System.out.println("[크롤링 URL] " + url);
	            driver.get(url);
	            Thread.sleep(5500); // 로딩 대기
	            
	            List<WebElement> rows = driver.findElements(By.cssSelector("table:nth-of-type(2) tbody tr"));
	            
	            for (WebElement row : rows) {
	                List<WebElement> tds = row.findElements(By.tagName("td"));
	                if (tds.size() > 10) {
	                    try {
	                        String teamName = tds.get(1).getText().trim();
	                        WebElement teamTd = tds.get(1);
	                        String teamLogo = teamTd.findElement(By.tagName("img")).getAttribute("src");
	                        String yearText = tds.get(2).getText().trim();

	                        TeamPitcherRecordDto dto = new TeamPitcherRecordDto();
	                        dto.setTeamName(teamName);
	                        dto.setTeamLogo(teamLogo);
	                        dto.setYear(Integer.parseInt(yearText));

	                        dto.setWar(Float.parseFloat(tds.get(3).getText().trim()));
	                        dto.setGamesP(Integer.parseInt(tds.get(4).getText().trim()));
	                        dto.setGamesStart(Integer.parseInt(tds.get(5).getText().trim()));
	                        dto.setCompleteGames(Integer.parseInt(tds.get(8).getText().trim()));
	                        dto.setShutouts(Integer.parseInt(tds.get(9).getText().trim()));
	                        dto.setWins(Integer.parseInt(tds.get(10).getText().trim()));
	                        dto.setLosses(Integer.parseInt(tds.get(11).getText().trim()));
	                        dto.setSaves(Integer.parseInt(tds.get(12).getText().trim()));
	                        dto.setHolds(Integer.parseInt(tds.get(13).getText().trim()));
	                        dto.setInnings(Float.parseFloat(tds.get(14).getText().trim()));
	                        dto.setEarnedRuns(Integer.parseInt(tds.get(15).getText().trim()));
	                        dto.setRunsAllowed(Integer.parseInt(tds.get(16).getText().trim()));
	                        dto.setHitsAllowed(Integer.parseInt(tds.get(19).getText().trim()));
	                        dto.setHomeRunsAllowed(Integer.parseInt(tds.get(22).getText().trim()));
	                        int bb = Integer.parseInt(tds.get(23).getText().trim())
	                                 + Integer.parseInt(tds.get(24).getText().trim())
	                                 + Integer.parseInt(tds.get(25).getText().trim());
	                        dto.setBbAllowed(bb);
	                        dto.setStrikeouts(Integer.parseInt(tds.get(26).getText().trim()));
	                        dto.setBalks(Integer.parseInt(tds.get(28).getText().trim()));
	                        dto.setWildPitches(Integer.parseInt(tds.get(29).getText().trim()));
	                        
	                        dto.setEra(Float.parseFloat(tds.get(30).getText().trim()));
	                        dto.setFip(Float.parseFloat(tds.get(33).getText().trim()));
	                        dto.setWhip(Float.parseFloat(tds.get(34).getText().trim()));
	                        
	                        teamPitcherRecordService.savePlayerRecord(dto);  // 메서드명도 수정됨
	                        recordList.add(dto);
	                    } catch (Exception e) {
	                        System.err.println("[" + startYear + "][" + sortOptions + "] 파싱 오류: " + e.getMessage());
	                        continue;
	                    }
	                }
	            }
	        
	    } catch (InterruptedException e1) {
	        e1.printStackTrace();
	    } finally {
	        driver.quit();
	    }

	    return recordList;
	}
	
	
	@GetMapping("/recordHitterView")
	public String showSortedHitterRecords(
		    @RequestParam(defaultValue = "war") String sortOptions,
		    @RequestParam(defaultValue = "DESC") String orderBy,
		    @RequestParam(required = false, defaultValue = "") String team,
		    @RequestParam(required = false, defaultValue = "") String position,
		    @RequestParam(required = false, defaultValue = "1982") Integer startYear,
		    @RequestParam(required = false, defaultValue = "2025") Integer endYear,
		    Model model) {
		
		System.out.println("sortOptions: " + sortOptions);
		System.out.println("orderBy: " + orderBy);
		System.out.println("team: " + team);
    System.out.println("position: " + position);
    System.out.println("startYear: " + startYear);
    System.out.println("endYear: " + endYear);
    
    if (startYear != null && endYear != null && startYear > endYear) {
      int temp = startYear;
      startYear = endYear;
      endYear = temp;
    }
    
    // 허용된 컬럼만 필터링
		Map<String, String> columnMap = new HashMap<>();
		columnMap.put("WAR", "war");
		columnMap.put("R", "runs");
		columnMap.put("H", "hits");
		columnMap.put("2B", "doubles");
		columnMap.put("3B", "triples");
		columnMap.put("HR", "home_runs");
		columnMap.put("TB", "total_bases");
		columnMap.put("RBI", "rbi");
		columnMap.put("SB", "stolen_bases");
		columnMap.put("CS", "stolen_bases_fail");
		columnMap.put("BB", "bb");
		columnMap.put("SO", "strikeouts");
		columnMap.put("GDP", "double_plays");
		columnMap.put("SH", "sac_hits");
		columnMap.put("SF", "sac_flies");
		columnMap.put("AVG", "avg");
		columnMap.put("OBP", "obp");
		columnMap.put("SLG", "slg");
		columnMap.put("OPS", "ops");
		columnMap.put("PA", "tasuk");
		columnMap.put("AB", "at_bats");
		columnMap.put("year", "year");

    String sortColumn = columnMap.getOrDefault(sortOptions.toUpperCase(), "war");

    List<PlayerRecordDto> records = playerRecordService.getSortedHitterRecords(
        sortColumn, orderBy, team, position, startYear, endYear);
    System.out.println("Retrieved records: " + records.size());
    model.addAttribute("records", records);
    return "record/recordHitterView";
	}
	
}
