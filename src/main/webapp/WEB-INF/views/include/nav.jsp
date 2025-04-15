<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>nav.jsp</title>
	<link rel="stylesheet" type="text/css" href="${ctp}/css/nav.css">
	<script type="text/javascript" src="${ctp}/js/main.js"></script>
</head>
	
<body>
	<header>
		<!-- navbar 1번(로그인/회원가입/검색창) -->
		<div class="navbar1">
			<span><a href="${ctp}/member/memberLogin">로그인</a></span>
			<span class="text-muted ms-2 me-2"> | </span>
			<span><a href="${ctp}/member/memberJoin">회원가입</a></span>
			
			<!-- 검색창 -->
			<div class="search-container">
    		<input type="text" class="search-input" placeholder="검색어를 입력하세요...">
    		<button class="search-button">검색</button>
  		</div>
		</div>
		
		<!-- navbar 2번 목록들 -->
		<div class="navbar2">
			<div class="title"><a href="http://localhost:8080/springProject4">HeatBox</a></div>
			<ul class="nav-items">
				<li class="nav-record"><a href="#">기록실</a>
				 	<!-- 하위메뉴 -->
					<ul class="dropdown">
						<li><a href="#">선수기록</a></li>
						<li><a href="#">팀 기록</a></li>
					</ul>
				</li>	
				<li><a href="#">분석실</a></li>
				<li><a href="#">선수</a></li>
				<li><a href="#">구단</a></li>
				<li><a href="#">커뮤니티</a></li>
				<li><a href="#">뉴스/하이라이트</a></li>
				<li><a href="#">후원사이트</a></li>
			</ul>
		</div>
	</header>
	<hr>

	<!-- 선수기록 사이드바 -->
	<div class="sidebar" id="sidebar-player" style="display: none;">
	  <h2>기록실<br></h2>
	  <hr>
	  <div class="menu-section">
	    <h3>선수기록</h3>
	    <ul>
	      <li>투수</li>
	      <li>타자</li>
	      <li>개인 통계</li>
	    </ul>
	  </div>
	</div>
	
	<!-- 팀기록 사이드바 -->
	<div class="sidebar" id="sidebar-team" style="display: none;">
	  <h2>기록실<br></h2>
	  <hr>
	  <div class="menu-section">
	    <h3>팀기록</h3>
	    <ul>
	      <li>공격력</li>
	      <li>수비력</li>
	      <li>팀 순위</li>
	    </ul>
	  </div>
	</div>
 	<footer></footer>
</body>
</html>