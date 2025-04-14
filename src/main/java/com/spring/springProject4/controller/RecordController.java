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
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import io.github.bonigarcia.wdm.WebDriverManager;

@Controller
@RequestMapping("/record")
public class RecordController {
	
	
	@RequestMapping("/recordMain")
	public String recordget() {
		return "record/recordMain";
	}

	@ResponseBody
	@RequestMapping(value = "/selenium3", method = RequestMethod.POST)
	public List<Map<String, Object>> selenium3Post(HttpServletRequest request) throws IOException {
	    List<Map<String, Object>> vos = new ArrayList<>();

	    ChromeOptions options = new ChromeOptions();
	    options.addArguments("--headless");
	    options.addArguments("--disable-gpu");
	    options.addArguments("--no-sandbox");
	    options.addArguments("--disable-dev-shm-usage");

	    WebDriverManager.chromedriver().setup();
	    WebDriver driver = new ChromeDriver(options);

	    driver.get("https://statiz.sporki.com/stats/");

	    try { Thread.sleep(2000); } catch (Exception e) {}

	    List<WebElement> rows = driver.findElements(By.cssSelector("table tbody tr"));

	    for (WebElement row : rows) {
	        List<WebElement> tds = row.findElements(By.tagName("td"));
	        if (tds.size() > 10) {
	            Map<String, Object> map = new LinkedHashMap<>();

	            String rank     = tds.get(0).getText().trim();
	            String player   = tds.get(1).getText().trim();

	            // 팀 로고 + 년도 + 포지션 분리
	            WebElement teamTd = tds.get(2);
	            String teamLogo = teamTd.findElement(By.tagName("img")).getAttribute("src");
	            List<WebElement> spans = teamTd.findElements(By.tagName("span"));
	            String year = spans.get(0).getText().trim();        // 년도
	            String position = spans.get(2).getText().trim();    // 포지션

	            String war        = tds.get(3).getText().trim();
	            String g       = tds.get(4).getText().trim();
	            String tasuk       = tds.get(7).getText().trim();
	            String tasu        = tds.get(9).getText().trim();
	            String run       = tds.get(10).getText().trim();
	            String hit      = tds.get(11).getText().trim();
	            String secBs      = tds.get(12).getText().trim(); //
	            String thirdBs      = tds.get(13).getText().trim(); 
	            String hr      = tds.get(14).getText().trim(); 
	            String tajum      = tds.get(16).getText().trim(); 
	            String sb      = tds.get(17).getText().trim(); 
	            String sbFail      = tds.get(18).getText().trim();
	            String bbFour      = tds.get(19).getText().trim();
	            String bbHit      = tds.get(20).getText().trim();
	            String bbFourP      = tds.get(21).getText().trim();
	            String strOut      = tds.get(22).getText().trim();
	            String doubleP      = tds.get(23).getText().trim();
	            String sacHit      = tds.get(24).getText().trim();
	            String sacFly= tds.get(25).getText().trim();
	            String avg= tds.get(26).getText().trim();
	            String obp= tds.get(27).getText().trim();
	            String slg= tds.get(28).getText().trim();
	            
	            

	            map.put("순위", rank);
	            map.put("선수명", player);
	            map.put("팀로고", "<img src='" + teamLogo + "' width='40px'/>");
	            map.put("년도", year);
	            map.put("포지션", position);
	            map.put("WAR", war);
	            map.put("경기", g);
	            map.put("타석", tasuk);
	            map.put("타수", tasu);
	            map.put("득점", run);
	            map.put("안타", hit);
	            map.put("2루타", secBs);
	            map.put("3루타", thirdBs);
	            map.put("루타", (Integer.parseInt(hit)-Integer.parseInt(secBs)-Integer.parseInt(thirdBs)-Integer.parseInt(hr))+Integer.parseInt(secBs)*2+Integer.parseInt(thirdBs)*3+Integer.parseInt(hr)*4);
	            map.put("타점", tajum);
	            map.put("홈런", hr);
	            map.put("도루", sb);
	            map.put("도루실패", sbFail);
	            map.put("사사구", Integer.parseInt(bbFour)+Integer.parseInt(bbHit)+Integer.parseInt(bbFourP));
	            map.put("삼진", strOut);
	            map.put("병살", doubleP);
	            map.put("희생타", sacHit);
	            map.put("희생플라이", sacFly);
	            map.put("타율", avg);
	            map.put("출루율", obp);
	            map.put("장타율", slg);
	            map.put("OPS", String.format("%.3f", Double.parseDouble(obp)+Double.parseDouble(slg)));
	            
	            

	            vos.add(map);
	        }
	    }

	    driver.quit();
	    return vos;
	}
}
