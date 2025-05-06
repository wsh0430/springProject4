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
	<title>선수 기록 변화 조회</title>
	<link rel="icon" type="image/x-icon" href="${ctp}/images/HITBox.ico">
	<jsp:include page="/WEB-INF/views/include/bs5.jsp" />
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
    google.charts.load('current', {'packages':['corechart']});

    function drawChart() {
        const playerName = $('#playerName').val();
        const position = $('#position').val();
        const field = $('#field').val();
        const startYear = $('#startYear').val();
        const endYear = $('#endYear').val();

        $.ajax({
            url: '/springProject4/dataChart/playerInfo2',
            method: 'GET',
            data: { playerName, position, field, startYear, endYear },
            success: function(response) {
                if (response.length === 0) {
                    $('#chart_div').html('<div style="text-align:center; font-size:1.2em; color:red;">해당 선수의 정보가 없습니다. 값을 다시 입력해주세요.</div>');
                    return;
                }
                const data = new google.visualization.DataTable();
                data.addColumn('string', '년도');
                data.addColumn('number', '값');

                response.forEach(function(item) {
                    data.addRow([item.year.toString(), item.value]);
                });

                const options = {
                    title: playerName+ '(' +position + ')의 ' + $('#field option:selected').text() + ' 평균 변화',
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

    // 속성별 설명 텍스트
    const fieldDescriptions = {
        games: '게임 수: 팀이 치른 경기 수입니다. 시대 또는 리그의 구단 수에 따라 변화합니다.',
        tasuk: '타석: 타자가 타석에 들어선 총 횟수입니다.',
        at_bats: '타수: 실제로 결과가 나온 타격 시도 수입니다. 타석-(사사구+희생타+타격방해+주루방해)=타수',
        runs: '득점: 타자가 홈을 밟아 얻은 점수입니다. 팀의 공격능력을 판별하는 지표입니다.',
        hits: '안타: 타자가 공을 치고 1루 이상 진루한 경우입니다.',
        doubles: '2루타: 타자가 두 개의 베이스를 진루한 경우입니다. 장타력이 좋다는 지표로도 사용되나 발이 빠른 선수도 2루타가 많은 경향을 보입니다.',
        triples: '3루타: 타자가 세 개의 베이스를 진루한 경우입니다. 장타력 뿐만 아니라 발까지 빨라야 나오는 경우가 많으므로 호타준족의 선수들이 높은 수치를 보입니다.',
        total_bases: '총루타: 타격으로 얻은 총 베이스 수입니다. 1루타는 1, 2루타는 2, 3루타는 3, 홈런은 4로 계산하여 합한 숫자입니다.',
        rbi: '타점: 타격으로 주자를 홈으로 불러들인 수입니다. 득점과 마찬가지로 팀의 공격능력을 판별하는 지표입니다.',
        home_runs: '홈런: 타자가 한 번에 홈까지 돌아온 경우입니다. 보통은 외야의 펜스를 넘긴 타구로 달성되나 그렇지 않은 경우 인사이드 더 파크 홈런이라고 불립니다.',
        stolen_bases: '도루: 주자가 투구 중 베이스를 추가로 훔친 횟수입니다.',
        stolen_bases_fail: '도루 실패: 도루 시도 중 실패한 횟수입니다.',
        bb: '볼넷: 스트라이크 존을 벗어난 공으로 1루에 진루한 경우입니다. 출루율에 영향을 줍니다.',
        strikeouts: '삼진: 세 번 스트라이크로 아웃당한 횟수입니다.',
        double_plays: '병살타: 한 번의 타격으로 두 명이 아웃된 경우입니다.',
        sac_hits: '희생번트: 주자를 진루시키기 위해 일부러 번트한 경우입니다.',
        sac_flies: '희생플라이: 주자가 홈으로 들어오게 한 플라이 아웃입니다.',
        avg: '타율: 안타를 기록할 확률입니다. (안타/타수)',
        obp: '출루율: 타자가 출루하는 비율입니다. 볼넷을 많이 얻는 타자는 타율이 낮아도 출루율이 높기 때문에 고평가 받습니다.',
        slg: '장타율: 한 타석당 평균 베이스 수를 의미합니다.',
        ops: 'OPS: 출루율과 장타율을 합친 수치입니다. 타자의 종합적인 공격능력을 판단하는데 이용되는 지표입니다.',
        war: 'WAR: 해당 선수가 팀 승리에 기여한 승수입니다. 타자의 가치를 평가하는 지표로 널리 사용되지만 통계자료를 수집하고 가공하는 주체마다 계산방법이 다르므로 절대적인 지표는 아닙니다.'
    };

    // 속성 설명 업데이트
    function updateFieldDescription() {
        const selectedField = $('#field').val();
        const description = fieldDescriptions[selectedField] || '';
        $('#fieldDescription').text(description);
    }

    // 페이지 로딩 시 기본 설명 세팅
    $(document).ready(function() {
        updateFieldDescription();
    });
	</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<div style="padding-left: 200px; padding-right: 200px;"></div>
<h2 class="text-center mt-4 mb-4">📈선수 기록 변화 조회📈</h2>
<h5 class="text-center mt-4 mb-4">특정 선수의 연간 변화를 보여줍니다.</h5>

<!-- 차트를 먼저 보여준다 -->
<div id="chart_div" style="width: 1200px; height: 600px; margin: 0 auto 50px auto; " ></div>

<!-- 설명 표시 영역 -->
<div id="fieldDescription" style="margin-bottom: 10px; text-align: center; font-size: 1.1em; color: #555;"></div>

<!-- 차트 아래에 검색 폼 -->
<form id="searchForm" style="text-align: center;">
  선수 이름: <input type="text" id="playerName" name="playerName" style="width: 150px;">
  포지션:
  <select id="position" name="position">
	  <option value="">전체</option>
	  <option value="P">투수</option>
	  <option value="C">포수</option>
	  <option value="1B">1루수</option>
	  <option value="2B">2루수</option>
	  <option value="3B">3루수</option>
	  <option value="SS">유격수</option>
	  <option value="LF">좌익수</option>
	  <option value="CF">중견수</option>
	  <option value="RF">우익수</option>
	  <option value="DH">지명타자</option>
	  <option value="IF">내야수</option>
	  <option value="OF">외야수</option>
	</select>
  속성 선택: 
  <select id="field" name="field" onchange="updateFieldDescription()">
    <option value="games">게임 수</option>
    <option value="tasuk">타석</option>
    <option value="at_bats">타수</option>
    <option value="runs">득점</option>
    <option value="hits">안타</option>
    <option value="doubles">2루타</option>
    <option value="triples">3루타</option>
    <option value="total_bases">총루타</option>
    <option value="rbi">타점</option>
    <option value="home_runs" selected>홈런</option>
    <option value="stolen_bases">도루</option>
    <option value="stolen_bases_fail">도루 실패</option>
    <option value="bb">볼넷</option>
    <option value="strikeouts">삼진</option>
    <option value="double_plays">병살타</option>
    <option value="sac_hits">희생번트</option>
    <option value="sac_flies">희생플라이</option>
    <option value="avg">타율</option>
    <option value="obp">출루율</option>
    <option value="slg">장타율</option>
    <option value="ops">OPS</option>
    <option value="war">WAR</option>
  </select>
  시작 연도: <input type="number" id="startYear" name="startYear" value="1982" style="width: 100px;">
  종료 연도: <input type="number" id="endYear" name="endYear" value="2025" style="width: 100px;">

  <button type="button" onclick="drawChart()" class="btn btn-danger">조회</button>
  <br><br>
</form>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>
