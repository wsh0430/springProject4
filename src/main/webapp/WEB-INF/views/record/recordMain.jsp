<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>recordMain.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs5.jsp" />
	<script>
		'use strict';
		// 페이지가 로드되면 자동으로 크롤링 시작
/* 		window.onload = function() {
			crawling2();
		}; */

		function hitterstat() {
		    $("#spinnerIcon").show();

		    $.ajax({
		        url: "HitterRecord",
		        type: "post",
		        success:function(vos) {
		            if(vos.length > 0) {
		                let str = '<table class="table table-bordered text-center align-middle">';
		                str += '<tr class="table-secondary">';
		                str += '<th>선수명</th><th>팀로고</th><th>년도</th><th>포지션</th>';
		                str += '<th>WAR</th><th>경기</th><th>타석</th><th>타수</th><th>득점</th><th>안타</th>';
		                str += '<th>2루타</th><th>3루타</th><th>루타</th><th>타점</th><th>홈런</th><th>도루</th>';
		                str += '<th>도루실패</th><th>사사구</th><th>삼진</th><th>병살</th>';
		                str += '<th>희생타</th><th>희생플라이</th><th>타율</th><th>출루율</th><th>장타율</th><th>OPS</th>';
		                str += '</tr>';

		                for(let i = 0; i < vos.length; i++) {
		                    str += '<tr>';
		                    str += '<td>'+vos[i].player+'</td>';
		                    str += '<td><img src="'+vos[i].teamLogo+'" width="40px"/></td>';
		                    str += '<td>'+vos[i].year+'</td>';
		                    str += '<td>'+vos[i].position+'</td>';
		                    str += '<td>'+vos[i].war+'</td>';
		                    str += '<td>'+vos[i].games+'</td>';
		                    str += '<td>'+vos[i].tasuk+'</td>';
		                    str += '<td>'+vos[i].atBats+'</td>';
		                    str += '<td>'+vos[i].runs+'</td>';
		                    str += '<td>'+vos[i].hits+'</td>';
		                    str += '<td>'+vos[i].doubles+'</td>';
		                    str += '<td>'+vos[i].triples+'</td>';
		                    str += '<td>'+vos[i].totalBases+'</td>';
		                    str += '<td>'+vos[i].rbi+'</td>';
		                    str += '<td>'+vos[i].homeRuns+'</td>';
		                    str += '<td>'+vos[i].stolenBases+'</td>';
		                    str += '<td>'+vos[i].stolenBasesFail+'</td>';
		                    str += '<td>'+vos[i].bb+'</td>';
		                    str += '<td>'+vos[i].strikeouts+'</td>';
		                    str += '<td>'+vos[i].doublePlays+'</td>';
		                    str += '<td>'+vos[i].sacHits+'</td>';
		                    str += '<td>'+vos[i].sacFlies+'</td>';
		                    str += '<td>'+vos[i].avg.toFixed(3)+'</td>';
		                    str += '<td>'+vos[i].obp.toFixed(3)+'</td>';
		                    str += '<td>'+vos[i].slg.toFixed(3)+'</td>';
		                    str += '<td>'+vos[i].ops.toFixed(3)+'</td>';
		                    str += '</tr>';
		                }

		                str += '</table>';
		                $("#demo").html(str);
		            } else {
		                $("#demo").html("검색된 자료가 없습니다.");
		            }
		            $("#spinnerIcon").hide();
		        },
		        error: function() {
		            alert("전송 오류!");
		            $("#spinnerIcon").hide();
		        }
		    });
		}
	</script>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>기록실 메인화면</h2>
  <div class="container">
  <h2>SELENIUM 연습</h2>
  <hr class="border-secondary">
  <div><a href="javascript:location.reload()" class="btn btn-warning form-control">다시검색</a></div>
  <hr class="border-secondary">
  <div id="demo"></div>
  <hr class="border-secondary">
  <h4>테스트</h4>
  <div class="input-group mb-3">
    <div class="input-group-text">기록테스트</div>
    <input type="button" value="크롤링3" onclick="hitterstat()" class="btn btn-success"/>
    <div class="input-group-append">
      <span id="spinnerIcon" style="display:none">
	      <span class="spinner-border"></span>
	      &nbsp;&nbsp; 데이터를 입력하는 중입니다. &nbsp;&nbsp;
	      <span class="spinner-border"></span>
      </span>
    </div>
  </div>
  <hr class="border">
</div>
</div>
<p><br/></p>
</body>
</html>