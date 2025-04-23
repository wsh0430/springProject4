<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>recordHitterView.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs5.jsp" />
	<script>
  function applyFilters() {
    const sort = document.getElementById("sortOptions").value;
    const order = document.getElementById("orderBy").value;
    const team = document.getElementById("team").value;
    const position = document.getElementById("positionOrder").value;
    const startYear = document.getElementById("startYear").value;
    const endYear = document.getElementById("endYear").value;

    const url = `/HitterRecords?sortOptions=${sort}&orderBy=${order}&team=${team}&position=${position}&startYear=${startYear}&endYear=${endYear}`;
    window.location.href = url;
  }
</script>
</head>
<body>
<p><br/></p>
<div class="container">
<form action="/recordHitterView" method="get">
	<label for="sortOptions">정렬 기준 선택:</label><br>
	<select id="sortOptions" name="sortOptions">
	  <option value="WAR" selected>WAR</option>
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
	<select id="team" name="team" class="form-select">
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
	<select id="positionOrder" name="positionOrder" class="form-select">
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
	<select id="startYear" name="startYear" class="form-select">
	  <c:forEach var="i" begin="1982" end="2025">
		<option value="${i}">${i}</option>
		</c:forEach>
	</select>

	<label for="endYear" class="input-group-text">끝 년도</label>
	<select id="endYear" name="endYear" class="form-select">
	  <c:forEach var="i" begin="1982" end="2025">
		<option value="${i}" <c:if test="${i == 2025}">selected</c:if>>${i}</option>
		</c:forEach>
	</select>
<button onclick="applyFilters()">조회</button>
</form>
</div>
<p><br/></p>
</body>
</html>