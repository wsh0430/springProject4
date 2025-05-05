<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>HitBox 관리자페이지</title>
	<jsp:include page="/WEB-INF/views/include/bs5.jsp" />
	 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script>
	 	'use strict';
	
	 	$(document).ready(function() { 
	 		$('select[name="day"]').change(function() {
	 	        document.vcForm.submit();
	 	    });
	 		
	 		  $('.ri_c-delta').each(function() { 
	 		    let $delta = $(this); 

	 		    let value = parseInt($delta.text());

	 		    if (value > 0) {
		 		      $delta.html(value + "<i class='fa-solid fa-sm fa-arrow-up'></i>");
		 		      $delta.css('color', 'red');
		 		    } else if (value < 0) {
		 		      $delta.html(Math.abs(value) + "<i class='fa-solid fa-sm fa-arrow-down'></i>");
		 		      $delta.css('color', 'blue');
		 		    }
		 		  });
		 		});
		 	
		 	
		 	//방문자수 차트
		 	 google.charts.load('current', {'packages':['line']});
		     google.charts.setOnLoadCallback(drawChart);
		     function drawChart() {
		    	    var data = google.visualization.arrayToDataTable([
		    	        ['${xTitle}', 
		    	         <c:forEach var="lg" begin="0" end="${fn:length(legend) - 1}" varStatus="st">
		    	             '${legend[lg]}'<c:if test="${!st.last}">,</c:if>
		    	         </c:forEach>
		    	        ],
		    	        <c:forEach var="i" begin="0" end="${day - 1}" varStatus="st">
		    	            ['${chartDates[(day-1)-i]}',
		    	            <c:forEach var="j" begin="0" end="${fn:length(legend) - 1}" varStatus="st2">
		    	                ${chartCounts[j][(day-1)-i]}<c:if test="${!st2.last}">,</c:if>
		    	            </c:forEach>
		    	            ]<c:if test="${!st.last}">,</c:if>
		    	        </c:forEach>
		    	    ]);

		    	    var options = {
		    	        chart: {
		    	            title: '${title}',
		    	            subtitle: '${subTitle}',
		    	        },
		    	        series: {
		    	            0: { targetAxisIndex: 0, color: 'blue' },  
		    	            1: { targetAxisIndex: 0, color: 'green' },  
		    	            2: { targetAxisIndex: 0, color: 'orange' },  
		    	            3: { targetAxisIndex: 0, color: 'purple' }
		    	        },
		    	    };

		    	    var chart = new google.charts.Line(document.getElementById('vc_material'));
		    	    chart.draw(data, google.charts.Line.convertOptions(options));
	     }
	</script>
 	<link rel="stylesheet" href="${ctp}/css/dashBoard.css">
</head>
<body>
	<div id="range-daily">
		<div id="rd_title">
			<h2>Today Stats</h2>
		</div>
		<table>
			<tr>
				<td>	<!-- foreach로 해도 될지도 ? -->
					<div class="range-item">
						<span class="ri_title">방문수</span>
						<div class="ri_content">
							<span class="ri_c-rate">${statDataVo.dailyVisitCnt}</span>
							<span class="ri_c-delta">${statDataVo.dailyVisitDelta}</span>
						</div>
					</div>
				</td>
				<td>
					<div class="range-item">
						<span class="ri_title">게시글수</span>
						<div class="ri_content">
							<span class="ri_c-rate">${statDataVo.dailyWriteBoardCnt}</span>
							<span class="ri_c-delta">${statDataVo.dailyWriteBoardDelta}</span>
						</div>
					</div>
				</td>
				<td>
					<div class="range-item">
						<span class="ri_title">회원가입수</span>
						<div class="ri_content">
							<span class="ri_c-rate">${statDataVo.dailyJoinCnt}</span>
							<span class="ri_c-delta">${statDataVo.dailyJoinDelta}</span>
						</div>
					</div>
				</td>
				<td>
					<div class="range-item">
						<span class="ri_title">광고클릭수</span>
						<div class="ri_content">
							<span class="ri_c-rate">${statDataVo.dailyAdClickCnt}</span>
							<span class="ri_c-delta">${statDataVo.dailyAdClickDelta}</span>
						</div>
					</div>
				</td>
			</tr>		
		</table>
	</div>
	<div id="visit-chart">
		<div id="vc_high-bar">
			<div id="vc_title"><h1>Activity</h1></div>
			<div id="vc_select">
				<form name="vcForm" method="get" action="${ctp}/admin/dashBoard">		
					<select name="day">
						<option value="7" ${day == 7 ? 'selected' : ''}>7일</option>
						<option value="30" ${day == 30 ? 'selected' : ''}>30일</option>
						<option value="90" ${day == 90 ? 'selected' : ''}>90일</option>
					</select>
				</form>
			</div>
		</div>
		<div id="vc_material"></div>
	</div>
</body>
</html>