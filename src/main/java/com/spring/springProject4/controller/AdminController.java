package com.spring.springProject4.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.springProject4.common.Pagination;
import com.spring.springProject4.common.StatData;
import com.spring.springProject4.service.AdminService;
import com.spring.springProject4.vo.BoardVo;
import com.spring.springProject4.vo.CategoryVo;
import com.spring.springProject4.vo.ChartVo;
import com.spring.springProject4.vo.PageVo;
import com.spring.springProject4.vo.StatDataVo;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	@Autowired
	StatData statData;
	
	@Autowired
	Pagination pagination;
	
	@RequestMapping(value="/dashBoard", method=RequestMethod.GET)
	public String dashBoardGet(Model model,
			@RequestParam(name="day", defaultValue = "7", required = false) int day) {
		String part = "line";
		
		
		//Today Stats
		StatDataVo statDataVo = statData.getStatDataVo();
		 
		//Visit Chart
		if(part.equals("line")) {
			String[] chartDates = new String[day];
			List<Integer[]> chartCounts = new ArrayList<Integer[]>();
			
			String[] legend = new String[4];
			legend[0] = "visit";
			legend[1] = "board";
			legend[2] = "join";
			legend[3] = "ad";
 			
			for(int l = 0; l < legend.length; l++) {
				//List<ChartVo> chartVos = ChartData.getChartVos(legend[l], day);
				List<ChartVo> chartVos = adminService.getRecentlyChartCount(legend[l], day);
				System.out.println("chartVos: " + chartVos);
				if(chartVos.size() < day) {
					int size = day - chartVos.size();
					String dateString = chartVos.get(chartVos.size()-1).getChartDate();
					for(int i = 0; i < size; i++) {
						ChartVo vo = new ChartVo();

				        // 문자열을 LocalDate로 변환
				        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
				        LocalDate date = LocalDate.parse(dateString, formatter);

				        // 1일 차감
				        LocalDate previousDate = date.minusDays(i+1);
						
				        vo.setChartDate(previousDate.format(formatter));
				        
				        chartVos.add(vo);
					}
				} 
				
				// vos자료를 차트에 표시처리가 잘 되지 않을경우에는 각각의 자료를 다시 편집해서 차트로 보내줘야 한다.
				String[] dates = new String[day];
				Integer[] counts = new Integer[day];

				for(int i=0; i<day; i++) {
					chartDates[i] = chartVos.get(i).getChartDate();
					counts[i] = chartVos.get(i).getChartCount();
				}
				
				chartCounts.add(counts);
			}
			
			
			System.out.println(chartCounts);
			
			
			model.addAttribute("part", part);
			model.addAttribute("xTitle", "방문날짜");
			model.addAttribute("legend", legend);
			
			model.addAttribute("chartDates", chartDates);
			model.addAttribute("chartCounts", chartCounts);
			model.addAttribute("title", "최근 "+day+"일간 방문횟수");
			model.addAttribute("subTitle", "(최근 "+day+"일간 방문한 해당일자의 방문자 총수를 표시합니다.");
			
			model.addAttribute("day", day);
		}
		
		model.addAttribute("statDataVo", statDataVo);
		
		return "admin/dashBoard";
	}
	
	@ResponseBody
	@RequestMapping(value="/getChartNum", method=RequestMethod.POST)
	public int getChartNumPost(Model model, int day) {
		model.addAttribute("day", day);	
		return 1;
	}
	
	@RequestMapping(value="/memberManager", method=RequestMethod.GET)
	public String memberManagerGet(Model model) {
		
		
		return "admin/memberManager";
	}
	
	@RequestMapping(value="/boardManager", method=RequestMethod.GET)
	public String boardManagerGet(Model model,
			@RequestParam(name="mainCategory", defaultValue = "전체", required = false) String category,
			@RequestParam(name="subCategory", defaultValue = "", required = false) String subCategory,
			@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
			@RequestParam(name="pageSize", defaultValue = "10", required = false) int pageSize,
			@RequestParam(name="search", defaultValue = "", required = false) String search,
			@RequestParam(name="searchString", defaultValue = "", required = false) String searchString,
			@RequestParam(name="startDate", defaultValue = "", required = false) String startDate,
			@RequestParam(name="lastDate", defaultValue = "", required = false) String lastDate
			) {
		if(!subCategory.equals("")) category = subCategory;
		
		// 카테고리
			List<CategoryVo> mainCtgyVos = adminService.getMainCategoryVos();	// 메인 카테고리vos
			List<CategoryVo> subCtgyVos = null; 
			List<List<CategoryVo>> subCtgyList = new ArrayList<>();	//서브 카테고리
			for(int i = 0; i < mainCtgyVos.size(); i++) {
				subCtgyVos = adminService.getSubCategoryVos(mainCtgyVos.get(i).getName());	//서브 카테고리vos
				subCtgyList.add(subCtgyVos);
			}
	
		// 페이지
		PageVo pageVo = pagination.getTotRecCnt(category, pag,pageSize,"community",search,searchString, startDate, lastDate);	// (페이지번호,한 페이지분량,section,part,검색어)
		
		List<BoardVo> boardVos = adminService.getBoardVos(category, pageVo.getStartIndexNo(), pageVo.getPageSize(), search, searchString, startDate, lastDate);
		
		
		model.addAttribute("curCategory", category);
		model.addAttribute("mainCtgyVos", mainCtgyVos);
		model.addAttribute("subCtgyList", subCtgyList);
		
		model.addAttribute("boardVos", boardVos);
		model.addAttribute("pageVo", pageVo);
		
		return "admin/boardManager";
	}
	
	@ResponseBody
	@RequestMapping(value="/getSubCategory", method=RequestMethod.GET)
	public List<CategoryVo> getSubCategoryGet(String categoryName) {
		return adminService.getSubCategoryVos(categoryName);
	}
}
