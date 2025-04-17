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
		    let sortOptions = $("#sortOptions").val(); // 다중 선택 값 배열
		    let orderBy = $("#orderBy").val(); // DESC or ASC
		    let startYear = $("#startYear").val();
		    let endYear = $("#endYear").val();
		    let team = $("#team").val();
		    let positionOrder = $("#positionOrder").val();
		    
		    $.ajax({
		        url: "HitterRecord",
		        type: "post",
		        data: {
		        		sortOptions: sortOptions,
		        		orderBy: orderBy,
		            startYear: startYear,
		            endYear: endYear,
		            team: team,
		            positionOrder: positionOrder
		        },
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
  <h2>SELENIUM 연습</h2>
  <hr class="border-secondary">
  <div><a href="javascript:location.reload()" class="btn btn-warning form-control">다시검색</a></div>
  <hr class="border-secondary">
  <div id="demo"></div>
  <hr class="border-secondary">
  
  <h4>테스트</h4>
  <div class="input-group mb-3">
    <div class="input-group-text">기록테스트</div>
    <div class="input-group mb-3">
    
  	  <label for="sortOptions">정렬 기준 선택:</label><br>
			<select id="sortOptions" name="sortOptions">
			  <option value="WAR">WAR</option>
			  <option value="R">득점 (R)</option>
			  <option value="H">안타 (H)</option>
			  <option value="2B">2루타</option>
			  <option value="3B">3루타</option>
			  <option value="HR">홈런</option>
			  <option value="TB">누타수 (TB)</option>
			  <option value="RBI">타점</option>
			  <option value="SB">도루</option>
			  <option value="CS">도루실패</option>
			  <option value="BB">볼넷</option>
			  <option value="SO">삼진</option>
			  <option value="GDP">병살</option>
			  <option value="SH">희생번트</option>
			  <option value="SF">희생플라이</option>
			  <option value="AVG">타율</option>
			  <option value="OBP">출루율</option>
			  <option value="SLG">장타율</option>
			  <option value="OPS">OPS</option>
			  <option value="PA">타석</option>
			  <option value="AB">타수</option>
			  <option value="year">연도</option>
			</select>
			
		  <label for="orderBy">정렬 방향:</label><br>
			<select id="orderBy" name="orderBy">
			  <option value="DESC" selected>내림차순 (높은 순)</option>
			  <option value="ASC">오름차순 (낮은 순)</option>
			</select><br><br>
			
			<label for="team">팀</label><br>
			<select id="team" class="form-select">
			  <option value="">전체</option>
			  <option value="9002">SSG</option>
			  <option value="5002">LG</option>
			  <option value="12001">KT</option>
			  <option value="11001">NC</option>
			  <option value="2002">KIA</option>
			  <option value="1001">삼성</option>
			  <option value="6002">두산</option>
			  <option value="3001">롯데</option>
			  <option value="7002">한화</option>
			  <option value="10001">키움</option>
			  <!-- 올드팀 -->
			  <option value="9001">SK</option>
			  <option value="10003">넥센</option>
			  <option value="10002">히어로즈</option>
			  <option value="6001">OB</option>
			  <option value="2001">해태</option>
			  <option value="5001">MBC</option>
			  <option value="4004">현대</option>
			  <option value="8001">쌍방울</option>
			  <option value="4001">삼미</option>
			  <option value="7001">빙그레</option>
			</select>
			
			<label for="positionOrder">포지션</label><br>
			<select id="positionOrder" class="form-select">
			  <option value="">전체</option>
			  <option value="1">투수</option>
			  <option value="2">포수</option>
			  <option value="3">1루수</option>
			  <option value="4">2루수</option>
			  <option value="5">3루수</option>
			  <option value="6">유격수</option>
			  <option value="7">좌익수</option>
			  <option value="8">중견수</option>
			  <option value="9">우익수</option>
			  <option value="10">지명타자</option>
			  <option value="13">내야수</option>
			  <option value="14">외야수</option>
			</select>
			
	    <label for="startYear" class="input-group-text">시작 년도</label>
	    <select id="startYear" class="form-select">
        <c:forEach var="i" begin="1982" end="2025">
          <option value="${i}">${i}</option>
        </c:forEach>
	    </select>
	
	    <label for="endYear" class="input-group-text">끝 년도</label>
	    <select id="endYear" class="form-select">
        <c:forEach var="i" begin="1982" end="2025">
          <option value="${i}" <c:if test="${i == 2025}">selected</c:if>>${i}</option>
        </c:forEach>
	    </select>
		</div>
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
<p><br/></p>
</body>
</html>