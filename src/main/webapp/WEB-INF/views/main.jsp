<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>HITBox</title>
  <link rel="icon" type="image/x-icon" href="${ctp}/images/HITBox.ico">
  <link rel="stylesheet" type="text/css" href="${ctp}/css/main.css">
</head>
<body>
  <!-- 네비게이션 바 포함 -->
  <jsp:include page="/WEB-INF/views/include/nav.jsp" />

	<section>
		<div class="main-container">
			<div class="clubs">
				<a href="https://tigers.co.kr/"><img alt="KIA" src="${ctp}/images/KIA.jpg"></a>
				<a href="https://www.samsunglions.com/"><img alt="삼성" src="${ctp}/images/삼성.png"></a>
				<a href="https://www.lgtwins.com/service/html.ncd?view=/pc_twins/twins_main/twins_main"><img alt="LG" src="${ctp}/images/LG.png"></a>
				<a href="https://www.doosanbears.com/"><img alt="두산" src="${ctp}/images/두산.png"></a>
				<a href="https://www.ncdinos.com/"><img alt="NC" src="${ctp}/images/NC.png"></a>
				<a href="https://www.ktwiz.co.kr/sports/site/baseball/main.do"><img alt="KT" src="${ctp}/images/KT.png"></a>
				<a href="https://www.giantsclub.com/html/"><img alt="롯데" src="${ctp}/images/롯데.png"></a>
				<a href="https://www.hanwhaeagles.co.kr/index.do"><img alt="한화" src="${ctp}/images/한화.png"></a>
				<a href="https://www.ssglanders.com/main"><img alt="SSG" src="${ctp}/images/SSG.png"></a>
				<a href="https://heroesbaseball.co.kr/index.do"><img alt="키움" src="${ctp}/images/키움.png"></a>
			</div>
			<div>여기가 순위</div>
			<div>여기가 kbo경기 일정</div>
			<div>여기가 하이라이트</div>
			<div>
			<div>kbo뉴스</div>
			<div>HITBox 최신글</div>
			</div>
		</div>
	</section>




  <!-- 푸터 포함 -->
  <jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>