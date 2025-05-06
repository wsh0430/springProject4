<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후원 사이트</title>
<jsp:include page="/WEB-INF/views/include/bs5.jsp" />
    <style>
        body { font-family: Arial, sans-serif; padding: 20px; background-color: #f8f9fa; }
        h1 { color: #333; }
        .sponsor-list { margin-top: 20px; }
        .sponsor-item {
            background: #fff;
            padding: 15px;
            border: 1px solid #ccc;
            border-radius: 10px;
            margin-bottom: 15px;
            display: flex;
            align-items: center;
        }
        .sponsor-item img {
            width: 100px;
            height: auto;
            margin-right: 20px;
        }
        .sponsor-info {
            flex: 1;
        }
        .sponsor-info a {
            color: #007bff;
            text-decoration: none;
        }
        .sponsor-info a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/nav.jsp" />
  <h1>Supporters</h1>
  <div class="sponsor-list">
    <div class="sponsor-item">
      <img src="${ctp}/resources/images/ssk.png" alt="SSK 로고" onerror="this.style.display='none'"/>
      <div class="sponsor-info">
        <h3>SSK Baseball Shop</h3>
        <p>SSK 공식 야구용품 쇼핑몰</p>
        <p><a href="https://sskbaseballshop.com/" target="_blank">사이트 방문하기</a></p>
      </div>
    </div>
		<div class="sponsor-item">
		    <img src="${ctp}/resources/images/tigers.png" alt="KIA 타이거즈 로고" onerror="this.style.display='none'"/>
		    <div class="sponsor-info">
		        <h3>KIA 타이거즈</h3>
		        <p>KBO 리그 소속 기아 타이거즈 구단 공식 홈페이지</p>
		        <p><a href="https://www.tigers.co.kr/" target="_blank">사이트 방문하기</a></p>
		    </div>
		</div>
    <div class="sponsor-item">
      <img src="${ctp}/resources/images/BE.png" alt="Baseball Express 로고" onerror="this.style.display='none'"/>
 		  <div class="sponsor-info">
        <h3>Baseball Express</h3>
        <p>미국 야구용품 전문 쇼핑몰</p>
        <p><a href="https://www.baseballexpress.com/" target="_blank">사이트 방문하기</a></p>
      </div>
    </div>
    <div class="sponsor-item">
      <img src="${ctp}/resources/images/mizuno.png" alt="Mizuno 로고" onerror="this.style.display='none'"/>
      <div class="sponsor-info">
        <h3>Mizuno Baseball</h3>
        <p>미즈노 공식 야구 제품 사이트</p>
        <p><a href="https://www.mizunousa.com/category/sports/baseball.do" target="_blank">사이트 방문하기</a></p>
      </div>
    </div>
    <div class="sponsor-item">
      <img src="${ctp}/resources/images/KBO.png" alt="KBO 로고" onerror="this.style.display='none'"/>
      <div class="sponsor-info">
        <h3>KBO 공식 홈페이지</h3>
        <p>KBO 리그 공식사이트</p>
        <p><a href="https://www.koreabaseball.com/" target="_blank">사이트 방문하기</a></p>
      </div>
    </div>
  </div>
  <jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>