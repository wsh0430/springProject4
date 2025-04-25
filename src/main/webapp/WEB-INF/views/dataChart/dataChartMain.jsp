<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>dataChartMain.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs5.jsp" />
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
	  google.charts.load('current', {'packages':['corechart']});
	  //google.charts.setOnLoadCallback(loadAndDraw);
		
	  function loadAndDraw() {
		  const selectedAttr = document.getElementById("attrSelect").value;
		  
		  console.log("선택된 속성:", selectedAttr);
		  
		  fetch(`${ctp}/dataChart/getAverageData?columnName=${selectedAttr}&startYear=2010&endYear=2023`)
		    .then(response => response.json())
		    .then(json => {
		      const dataArray = [['Year', selectedAttr.toUpperCase()]];
		      json.forEach(item => {
		        dataArray.push([item.year, item.average_value]);
		      });
		
		      const data = google.visualization.arrayToDataTable(dataArray);
		
		      const options = {
		        title: `년도별 ${selectedAttr.toUpperCase()} 평균`,
		        hAxis: {title: 'Year'},
		        vAxis: {title: selectedAttr.toUpperCase()},
		        legend: 'none'
		      };
		
		      const chart = new google.visualization.ScatterChart(document.getElementById('chart_div'));
		      chart.draw(data, options);
		    })
		    .catch(err => console.error('데이터 가져오기 실패:', err));
		}
	</script>
</head>
<body>
<div id="chart_div" style="width: 900px; height: 500px;"></div>
<div class="mb-3">
	<label for="attrSelect" class="form-label">속성 선택</label>
	<select id="attrSelect" class="form-select" style="width:200px; display:inline-block;">
	  <option value="games">경기수</option>
	  <option value="tasuk">타석</option>
	  <option value="at_bats">타수</option>
	  <option value="runs">득점</option>
	  <option value="hits">안타</option>
	  <option value="doubles">2루타</option>
	  <option value="triples">3루타</option>
	  <option value="total_bases">루타</option>
	  <option value="rbi">타점</option>
	  <option value="home_runs">홈런</option>
	  <option value="stolen_bases">도루</option>
	  <option value="stolen_bases_fail">도루실패</option>
	  <option value="bb">사사구</option>
	  <option value="strikeouts">삼진</option>
	  <option value="double_plays">병살</option>
	  <option value="sac_hits">희생타</option>
	  <option value="sac_flies">희생플라이</option>
	  <option value="avg">타율 (AVG)</option>
	  <option value="obp">출루율 (OBP)</option>
	  <option value="slg">장타율 (SLG)</option>
	  <option value="ops">OPS</option>
	  <option value="war">WAR</option>
  </select>
  <button class="btn btn-primary" onclick="loadAndDraw()">차트 보기</button>
</div>
</body>
</html>