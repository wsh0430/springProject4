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
	<title>연간 팀 평균수치 조회(투수)</title>
	<link rel="icon" type="image/x-icon" href="${ctp}/images/HITBox.ico">
	<jsp:include page="/WEB-INF/views/include/bs5.jsp" />
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
    google.charts.load('current', {'packages':['corechart']});

    function drawChart() {
        const field = $('#field').val();
        const startYear = $('#startYear').val();
        const endYear = $('#endYear').val();

        $.ajax({
            url: '/springProject4/dataChart/teamPitcherAverage2',
            method: 'GET',
            data: { field, startYear, endYear },
            success: function(response) {
                if (response.length === 0) {
                    $('#chart_div').html('<div style="text-align:center; font-size:1.2em; color:red;">해당 조건에 대한 팀 투구 기록이 없습니다. 빠른 시일 내로 추가하도록 하겠습니다.</div>');
                    return;
                }
            		
            	
                const data = new google.visualization.DataTable();
                data.addColumn('string', '년도');
                data.addColumn('number', $('#field option:selected').text());

                response.forEach(function(item) {
                    data.addRow([item.year.toString(), item.value]);
                });

                const options = {
                    title: '년도별 평균 ' + $('#field option:selected').text(),
                    curveType: 'function',
                    legend: { position: 'bottom' }
                };

                const chart = new google.visualization.LineChart(document.getElementById('chart_div'));
                chart.draw(data, options);
            },
            error: function(xhr, status, error) {
                console.error('차트 데이터 가져오기 실패:', error);
            }
        });
    }
    
    const fieldDescriptions = {
    	    gamesP: '경기수: 투수가 출전한 총 경기 수입니다.',
    	    gamesStart: '선발: 선발 투수로 나온 경기 수입니다.',
    	    completegames: '완투: 투수가 단독으로 경기를 끝낸 수입니다.',
    	    shutouts: '완봉: 투수가 9이닝을 던져 점수 없이 경기를 마친 수입니다.',
    	    wins: '승: 투수가 승리한 경기 수입니다.',
    	    losses: '패: 투수가 패배한 경기 수입니다.',
    	    saves: '세이브: 팀 리드를 지킨 채 마무리한 경기 수입니다.',
    	    holds: '홀드: 중간계투가 리드를 유지한 채 이어준 경우입니다.',
    	    innings: '이닝: 투수가 던진 이닝 수입니다. (아웃카운트/3)',
    	    earned_runs: '자책점: 투수의 실책이 아닌 책임으로 허용한 점수입니다.',
    	    runs_allowed: '실점: 투수가 허용한 총 점수입니다.',
    	    hits_allowed: '피안타: 투수가 허용한 안타 수입니다.',
    	    home_runs_allowed: '피홈런: 투수가 허용한 홈런 수입니다.',
    	    bbAllowed: '볼넷: 투수가 허용한 볼넷 수입니다.',
    	    strikeouts: '탈삼진: 투수가 삼진으로 잡은 수입니다.',
    	    balks: '보크: 투수의 규정 위반으로 주자가 진루하는 경우입니다.',
    	    wildPitches: '폭투: 포수가 막지 못한 투수의 실책입니다.',
    	    era: '평균자책점: 9이닝당 허용한 평균 자책점입니다. 투수 평가의 핵심 지표이지만 수비의 도움을 많이 받을수록 유리해집니다.',
    	    fip: 'FIP: 수비 무관 평균 자책점입니다. 볼넷, 삼진, 피홈런만 반영하므로 맞춰잡는 투수보다 삼진을 많이 내는 투수가 유리합니다.',
    	    whip: 'WHIP: 이닝당 허용한 출루 수입니다. (볼넷 + 안타) / 이닝',
    	    war: 'WAR: 선수의 가치 지표입니다. 리그와 팀에 기여한 정도를 나타냅니다.'
    	};

    function updateFieldDescription() {
        const selectedField = $('#field').val();
        const description = fieldDescriptions[selectedField] || '';
        $('#fieldDescription').text(description);
    }

    $(document).ready(function() {
        updateFieldDescription();
    });
	</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/nav.jsp" />
	<div style="padding-left: 200px; padding-right: 200px;"></div>
	<h2 class="text-center mt-4 mb-4">📈연간 팀 평균수치 조회(투수)📈</h2>
	<h5 class="text-center mt-4 mb-4">리그의 평균적인 수치를 보여줍니다. 해당 년도에 리그가 타고투저인지 투고타저인지 판별하기 쉽습니다.</h5>
	
	<div id="chart_div" style="width: 1200px; height: 600px; margin: 0 auto 50px auto;"></div>
	
	<div id="fieldDescription" style="margin-bottom: 10px; text-align: center; font-size: 1.1em; color: #555;"></div>
	
	<form id="searchForm" style="text-align: center;">
	    속성 선택: 
	<select id="field" name="field" onchange="updateFieldDescription()">
	    <option value="gamesP">경기수</option>
	    <option value="gamesStart">선발</option>
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
	    <option value="bbAllowed">사사구</option>
	    <option value="strikeouts">탈삼진</option>
	    <option value="balks">보크</option>
	    <option value="wildPitches">폭투</option>
	    <option value="era">평균자책점</option>
	    <option value="fip">FIP</option>
	    <option value="whip">WHIP</option>
	    <option value="war">WAR</option>
	</select>
	    시작 연도: <input type="number" id="startYear" name="startYear" value="1982" style="width: 100px;">
	    종료 연도: <input type="number" id="endYear" name="endYear" value="2025" style="width: 100px;">
	    <button type="button" onclick="drawChart()" class="btn btn-danger">조회</button>
	</form>
	<br><br>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>