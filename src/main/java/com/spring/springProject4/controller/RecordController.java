package com.spring.springProject4.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.springProject4.dto.PlayerRecordDto;
import com.spring.springProject4.service.PlayerRecordService;

import io.github.bonigarcia.wdm.WebDriverManager;

@Controller
@RequestMapping("/record")
public class RecordController {
	
	@Autowired
	private PlayerRecordService playerRecordService; 
	
	@RequestMapping("/recordMain")
	public String recordget() {
		return "record/recordMain";
	}

	@ResponseBody
	@RequestMapping(value = "/HitterRecord", method = RequestMethod.POST)
	public List<PlayerRecordDto> HitterPostAndSave() throws IOException {
	    List<PlayerRecordDto> recordList = new ArrayList<>();

	    ChromeOptions options = new ChromeOptions();
	    options.addArguments("--headless", "--disable-gpu", "--no-sandbox", "--disable-dev-shm-usage");

	    WebDriverManager.chromedriver().setup();
	    WebDriver driver = new ChromeDriver(options);

	    driver.get("https://statiz.sporki.com/stats/");
	    try { Thread.sleep(2000); } catch (Exception e) {}

	    List<WebElement> rows = driver.findElements(By.cssSelector("table tbody tr"));

	    for (WebElement row : rows) {
	        List<WebElement> tds = row.findElements(By.tagName("td"));
	        if (tds.size() > 10) {
	            try {
	                String player   = tds.get(1).getText().trim();

	                WebElement teamTd = tds.get(2);
	                String teamLogo = teamTd.findElement(By.tagName("img")).getAttribute("src");
	                List<WebElement> spans = teamTd.findElements(By.tagName("span"));
	                String year = spans.get(0).getText().trim();
	                String position = spans.get(2).getText().trim();

	                PlayerRecordDto dto = new PlayerRecordDto();
	                dto.setPlayer(player);
	                dto.setTeamLogo(teamLogo);
	                dto.setPosition(position);
	                dto.setYear(Integer.parseInt(year));
	                
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
	                System.err.println("파싱 오류: " + e.getMessage());
	                continue;
	            }
	        }
	    }

	    driver.quit();
	    return recordList;
	}

}
