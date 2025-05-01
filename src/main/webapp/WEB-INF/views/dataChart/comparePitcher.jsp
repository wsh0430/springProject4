<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>투수 기록 비교</title>

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
                    drawChart(response, player1, player2);
                },
                error: function(xhr, status, error) {
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
    <label>선수1 이름: </label><input type="text" id="player1">
    <label>선수2 이름: </label><input type="text" id="player2">
    <br><br>
    <label>시작 연도: </label><input type="number" id="startYear" placeholder="예: 2015">
    <label>끝 연도: </label><input type="number" id="endYear" placeholder="예: 2024">
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
</div>

<br>



</body>
</html>
