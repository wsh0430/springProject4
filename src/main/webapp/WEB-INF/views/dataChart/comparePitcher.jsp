<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
  <title>투수 기록 비교</title>
	<jsp:include page="/WEB-INF/views/include/bs5.jsp" />

  <!-- Google Charts 로드 -->
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  <script>
      // 구글 차트 초기화
      google.charts.load('current', {'packages':['line']});
      google.charts.setOnLoadCallback(init);

      function init() {
          // 초기화 작업 필요하면 여기 작성
      }

      function fetchDataAndDrawChart() {
          var player1 = $('#player1').val();
          var player2 = $('#player2').val();
          var startYear = $('#startYear').val();
          var endYear = $('#endYear').val();
          var field = $('#field').val();
          var valid = true;
          $('#alertMessage').addClass('d-none'); // 경고 메시지 숨기기
          $('#player1, #player2, #startYear, #endYear').removeClass('is-invalid'); // 초기화

          // 연도 유효성 검사
          if (isNaN(startYear) || startYear < 1982 || startYear > 2025 || isNaN(endYear) || endYear < 1982 || endYear > 2025 || endYear < startYear) {
              $('#startYear, #endYear').addClass('is-invalid');
              $('#alertMessage').text('올바른 년도를 입력해주세요(1982~2025)').removeClass('d-none');
              return;
          }

          // 선수 이름 유효성 검사
          if (!player1 || !player2) {
              if (!player1) $('#player1').addClass('is-invalid');
              if (!player2) $('#player2').addClass('is-invalid');
              $('#alertMessage').text('유효하지 않은 선수명입니다.').removeClass('d-none');
              return;
          }

          $.ajax({
              url: '/springProject4/dataChart/comparePitchers2',
              type: 'GET',
              data: {
                  player1: player1,
                  player2: player2,
                  startYear: startYear,
                  endYear: endYear,
                  field: field
              },
              success: function(response) {
            	    if (!response || response.length === 0) {
            	        $('#alertMessage').text('유효하지 않은 선수명입니다.').removeClass('d-none');
            	        return;
            	    }

            	    // 응답에서 선수명 추출
            	    var foundPlayers = new Set(response.map(item => item.player));

            	    // 두 선수 모두 있는지 확인
            	    if (!foundPlayers.has(player1) || !foundPlayers.has(player2)) {
            	        $('#alertMessage').text('유효하지 않은 선수명입니다.').removeClass('d-none');
            	        return;
            	    }

            	    $('#alertMessage').addClass('d-none');
            	    drawChart(response, player1, player2);
            	},
              error: function(xhr, status, error) {
                  $('#alertMessage').text('데이터를 불러오는 중 오류가 발생했습니다.').removeClass('d-none');
                  console.error('에러 발생:', error);
              }
          });
      }

      function drawChart(data, player1, player2) {
          var dataTable = new google.visualization.DataTable();
          dataTable.addColumn('string', '년도');
          dataTable.addColumn('number', player1);
          dataTable.addColumn('number', player2);

          // 연도별 데이터 맵핑
          var yearMap = {};

          data.forEach(function(item) {
              if (!yearMap[item.year]) {
                  yearMap[item.year] = {};
              }
              yearMap[item.year][item.player] = item.value;
          });

          var rows = [];
          for (var year in yearMap) {
              var row = [
                  year,
                  yearMap[year][player1] != null ? yearMap[year][player1] : null,
                  yearMap[year][player2] != null ? yearMap[year][player2] : null
              ];
              rows.push(row);
          }
					
          if (rows.length === 0) {
        	    $('#alertMessage').text('유효한 데이터를 입력해주세요.').removeClass('d-none');
        	    return;
        	}
          
          // 연도 오름차순 정렬
          rows.sort(function(a, b) {
              return parseInt(a[0]) - parseInt(b[0]);
          });

          dataTable.addRows(rows);

          var options = {
              chart: {
                  title: '투수 기록 비교'
              },
              hAxis: {
                  title: '연도'
              },
              vAxis: {
                  title: '선택한 기록'
              },
              bars: 'vertical',
              height: 500
          };

          var chart = new google.charts.Line(document.getElementById('chart_div'));
          chart.draw(dataTable, google.charts.Line.convertOptions(options));
      }
  </script>

</head>
<body>

<h2>투수 기록 비교</h2>

<div id="chart_div" style="width: 1000px; height: 600px;"></div>

<div>
		<label>선수1 이름: </label>
		<input type="text" id="player1" class="form-control d-inline-block w-auto">
		<label>선수2 이름: </label>
		<input type="text" id="player2" class="form-control d-inline-block w-auto">
    <br><br>
		<label>시작 연도: </label>
		<input type="number" id="startYear" class="form-control d-inline-block w-auto">
		<label>끝 연도: </label>
		<input type="number" id="endYear" class="form-control d-inline-block w-auto">
    <br><br>
    <label>비교할 속성: </label>
    <select id="field">
        <option value="war">WAR</option>
        <option value="gamesP">경기수(등판)</option>
        <option value="gamesStart">경기수(선발)</option>
        <option value="completegames">완투</option>
        <option value="shutouts">완봉</option>
        <option value="wins">승</option>
        <option value="losses">패</option>
        <option value="saves">세이브</option>
        <option value="holds">홀드</option>
        <option value="innings">이닝</option>
        <option value="earnedRuns">자책점</option>
        <option value="runsAllowed">실점</option>
        <option value="hitsAllowed">피안타</option>
        <option value="homeRunsAllowed">피홈런</option>
        <option value="bbAllowed">볼넷허용</option>
        <option value="strikeouts">삼진</option>
        <option value="balks">보크</option>
        <option value="wildPitches">폭투</option>
        <option value="era">ERA</option>
        <option value="fip">FIP</option>
        <option value="whip">WHIP</option>
    </select>
    <br><br>

    <button onclick="fetchDataAndDrawChart()">비교하기</button>
    <div id="alertMessage" class="alert alert-danger d-none" role="alert">
    유효한 값을 입력해주세요.
		</div>
</div>

<br>



</body>
</html>
