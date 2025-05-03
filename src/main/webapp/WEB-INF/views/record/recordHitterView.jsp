<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

			const url = contextPath + "/recordHitterView" +
			`?sortOptions=${sort}&orderBy=${order}&team=${team}&position=${position}&startYear=${startYear}&endYear=${endYear}`;
			window.location.href = url;
			form.submit();
		}
		
	  document.addEventListener('DOMContentLoaded', function () {
	    const tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
	    tooltipTriggerList.map(function (tooltipTriggerEl) {
	      return new bootstrap.Tooltip(tooltipTriggerEl)
	    })
	  });
	</script>
</head>
<body>

<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<div class="container">
<!-- 정렬 필터 폼-->
<form action="${ctp}/record/recordHitterView" method="get">
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
	<select id="positionOrder" name="position" class="form-select">
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
<button type="submit">조회</button>
</form>

<!-- 조회 결과 테이블 -->
<table class="table">
    <thead>
        <tr>
            <th>선수</th>
            <th>팀</th>
            <th>포지션</th>
            <th>연도</th>
			      <th data-bs-toggle="tooltip" title="출전한 경기의 총 수">게임 수</th>
			      <th data-bs-toggle="tooltip" title="타석에 들어선 횟수">타석</th>
			      <th data-bs-toggle="tooltip" title="실제 스윙하여 결과가 난 타격 수">타수</th>
			      <th data-bs-toggle="tooltip" title="득점한 횟수">득점</th>
			      <th data-bs-toggle="tooltip" title="모든 안타 수의 합">안타</th>
			      <th data-bs-toggle="tooltip" title="2루타 수">2루타</th>
			      <th data-bs-toggle="tooltip" title="3루타 수">3루타</th>
			      <th data-bs-toggle="tooltip" title="모든 안타로 얻은 루타 수의 합">누타수</th>
			      <th data-bs-toggle="tooltip" title="타자가 만들어낸 타점">타점</th>
			      <th data-bs-toggle="tooltip" title="홈런 수">홈런</th>
			      <th data-bs-toggle="tooltip" title="도루 성공 수">도루</th>
			      <th data-bs-toggle="tooltip" title="도루 실패 수">도루실패</th>
			      <th data-bs-toggle="tooltip" title="볼넷 수(사사구+사구+고의사구)">볼넷</th>
			      <th data-bs-toggle="tooltip" title="삼진 수">삼진</th>
			      <th data-bs-toggle="tooltip" title="병살타 수">병살</th>
			      <th data-bs-toggle="tooltip" title="희생번트 수">희생번트</th>
			      <th data-bs-toggle="tooltip" title="희생플라이 수">희생플라이</th>
			      <th data-bs-toggle="tooltip" title="안타 ÷ 타수">타율</th>
			      <th data-bs-toggle="tooltip" title="(안타+볼넷+사구) ÷ 타석">출루율</th>
			      <th data-bs-toggle="tooltip" title="총 루타 ÷ 타수">장타율</th>
			      <th data-bs-toggle="tooltip" title="출루율 + 장타율">OPS</th>
			      <th data-bs-toggle="tooltip" title="대체 선수 대비 기여도 (Wins Above Replacement)">WAR</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="record" items="${records}">
            <tr>
                <td>${record.player}</td>
                <td><img src="${record.teamLogo}" alt="팀 로고" width="30" height="30"></td>
                <td>${record.position}</td>
                <td>${record.year}</td>
                <td>${record.games}</td>
                <td>${record.tasuk}</td>
                <td>${record.atBats}</td>
                <td>${record.runs}</td>
                <td>${record.hits}</td>
                <td>${record.doubles}</td>
                <td>${record.triples}</td>
                <td>${record.totalBases}</td>
                <td>${record.rbi}</td>
                <td>${record.homeRuns}</td>
                <td>${record.stolenBases}</td>
                <td>${record.stolenBasesFail}</td>
                <td>${record.bb}</td>
                <td>${record.strikeouts}</td>
                <td>${record.doublePlays}</td>
                <td>${record.sacHits}</td>
                <td>${record.sacFlies}</td>
                <td>${record.avg}</td>
                <td>${record.obp}</td>
                <td>${record.slg}</td>
                <td>${record.ops}</td>
                <td>${record.war}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>