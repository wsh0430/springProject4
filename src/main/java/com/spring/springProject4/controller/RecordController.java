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
	@RequestMapping(value = "/selenium2", method = RequestMethod.POST)
	public List<Map<String, Object>> selenium2Post(HttpServletRequest request, String url, String searchString) throws IOException {
		List<Map<String, Object>> vos = new ArrayList<>();
		
		ChromeOptions options = new ChromeOptions();
		options.addArguments("--headless"); // 브라우저 창 없이 실행
		options.addArguments("--disable-gpu"); // GPU 가속 비활성화 (headless 안정성)
		options.addArguments("--window-size=1920,1080"); // 창 크기 설정 (필수는 아님)
		options.addArguments("--no-sandbox"); // 리눅스 환경에서 권한 이슈 방지
		options.addArguments("--disable-dev-shm-usage"); // 메모리 부족 방지용
		//WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(5));
		WebDriverManager.chromedriver().setup();  
		WebDriver driver = new ChromeDriver(options); // 옵션 적용
		
		driver.get("http://www.cgv.co.kr/movies/?lt=1&ft=0");
		
		WebElement btnMore = driver.findElement(By.id("chk_nowshow"));
		btnMore.click();
		
		try { Thread.sleep(1000); } catch (Exception e) {}
		
		btnMore = driver.findElement(By.className("link-more"));
		btnMore.click();
		
		try { Thread.sleep(2000); } catch (Exception e) {}
		
		List<WebElement> elements = driver.findElements(By.cssSelector("div.sect-movie-chart ol li"));
		//int i=0;
		for(WebElement element : elements) {
			//i++;
			Map<String, Object> map = new HashMap<String, Object>();
			String link = element.findElement(By.tagName("a")).getAttribute("href");
			String title = "<a href='"+link+"' target='_blank'>" + element.findElement(By.className("title")).getText() + "</a>";
			String image = "<img src='"+ element.findElement(By.tagName("img")).getAttribute("src") +"' width='200px' />";
			String percent = element.findElement(By.className("percent")).getText();
			//String percent = element.findElement(By.xpath("//*[@id=\"contents\"]/div[1]/div[3]/ol[1]/li[1]/div[2]/div/div/span[2]")).getText();
			
			System.out.println("title : " + title);
			System.out.println("image : " + image);
			System.out.println("percent : " + percent);
			
			map.put("title", title);
			map.put("image", image);
			map.put("percent", percent);
			
			vos.add(map);
		}
		// DB저장처리
		
		driver.close();
		return vos;
	}
	
	@ResponseBody
	@RequestMapping(value = "/selenium3", method = RequestMethod.POST)
	public List<Map<String, Object>> selenium3Post(HttpServletRequest request) throws IOException {
	    List<Map<String, Object>> vos = new ArrayList<>();

	    ChromeOptions options = new ChromeOptions();
	    options.addArguments("--headless");
	    options.addArguments("--disable-gpu");
	    options.addArguments("--window-size=1920,1080");
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
	            
	            // 직접 하나씩 추출
	            String rank     = tds.get(0).getText();  // 순위
	            String player   = tds.get(1).getText();  // 선수명
	            String team     = tds.get(2).getText();  // 팀명
	            String g        = tds.get(3).getText();  // 경기수
	            String pa       = tds.get(4).getText();  // 타석
	            String ab       = tds.get(5).getText();  // 타수
	            String h        = tds.get(6).getText();  // 안타
	            String hr       = tds.get(7).getText();  // 홈런
	            String rbi      = tds.get(8).getText();  // 타점
	            String avg      = tds.get(9).getText();  // 타율
	            
	            map.put("순위", rank);
	            map.put("선수명", player);
	            map.put("년도/포지션", team);
	            map.put("경기", g);
	            map.put("타석", pa);
	            map.put("타수", ab);
	            map.put("안타", h);
	            map.put("홈런", hr);
	            map.put("타점", rbi);
	            map.put("타율", avg);

	            vos.add(map);
	        }
	    }

	    driver.quit();
	    return vos;
	}
}
