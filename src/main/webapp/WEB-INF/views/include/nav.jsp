<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>

<html>
<head>
  <meta charset="UTF-8">
  <title>nav</title>
  <link rel="stylesheet" href="${ctp}/css/nav.css">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
  <link rel="icon" type="image/x-icon" href="${ctp}/images/HITBox.ico">
</head>
	<header>
		<!-- navbar 1번(로그인/회원가입/검색창) -->
		<div class="navbar1">
		  <!-- 검색창 -->
		  <div class="search-container">
		    <input type="text" class="search-input" placeholder="검색어를 입력하세요...">
		    <button class="search-button">검색</button>
		  </div>
		
		  <!-- 유저 메뉴 (드롭다운) -->
		  <div class="user-menu">
		    <button class="user-icon" onclick="toggleUserDropdown()">
		    	<i class="fas fa-user"></i>
		    </button>
		    <div class="dropdown-menu" id="userDropdown">
		      <!-- 아래 항목은 로그인 상태에 따라 JS로 제어 -->
		      <c:if test="${empty sLevel}">
			      <a href="${ctp}/member/memberLogin">로그인</a>
			      <a href="${ctp}/member/memberJoin">회원가입</a>
		      </c:if>
		      <c:if test="${sLevel == 1}"><a href="${ctp}/member/memberMypage">마이페이지</a></c:if>
		      <c:if test="${sLevel == 0}"><a href="#">관리자페이지</a></c:if>
		      <c:if test="${sLevel < 3}"><a href="${ctp}/member/memberLogout">로그아웃</a></c:if>
		    </div>
		  </div>
		</div>
		
		<!-- navbar 2번 목록들 -->
		<div class="navbar2">
			<div class="mainTitle"><a href="http://localhost:8080/springProject4"><img alt="MainLogo" src="${ctp}/images/HITBox.png">HITBox</a></div>
			<ul class="nav-items">
				<li class="nav-li"><a href="${ctp}/record/recordMain">기록실</a>
				 	<!-- 하위메뉴 -->
					<ul class="dropdown">
						<li><a href="${ctp}/record/recordMain?sidebar=player" >시즌 기록실</a></li>
						<li><a href="${ctp}/record/recordMain?sidebar=career">통산 기록실</a></li>
						<li><a href="${ctp}/record/recordMain?sidebar=team">팀 기록실</a></li>
					</ul>
				</li>	
				<li class="nav-li"><a href="#">분석실</a>
					<!-- 하위메뉴 -->
					<ul class="dropdown">
						<li><a href="${ctp}/record/recordMain?sidebar=player" >개인기록변화</a></li>
						<li><a href="${ctp}/record/recordMain?career=player">선수기록비교</a></li>
						<li><a href="${ctp}/record/recordMain?team=player">팀 평균기록(타자)</a></li>
						<li><a href="${ctp}/record/recordMain?team=player">팀 평균기록(투수)</a></li>
					</ul>
				</li>
				<li><a href="#">선수</a></li>
				<li><a href="#">구단</a></li>
				<li><a href="#">커뮤니티</a></li>
				<li><a href="#">뉴스/하이라이트</a></li>
				<li><a href="#">후원사이트</a></li>
			</ul>
		</div>
	</header>

	<!-- 시즌기록 사이드바 -->
	<div class="sidebar" id="sidebar-player" style="display: none;">
	  <h2>기록실<br></h2>
	  <hr>
	  <div class="menu-section">
	    <h3>시즌기록</h3>
	    <ul>
	      <li>타자</li>
	      <li>투수</li>
	    </ul>
	  </div>
	</div>
	
	<!-- 통산기록 사이드바 -->
	<div class="sidebar" id="sidebar-career" style="display: none;">
	  <h2>기록실<br></h2>
	  <hr>
	  <div class="menu-section">
	    <h3>통산기록</h3>
	    <ul>
	      <li>타자</li>
	      <li>투수</li>
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
	      <li>타격</li>
	      <li>투구</li>
	      <li></li>
	    </ul>
	  </div>
	</div>
<script type="text/javascript" src="${ctp}/js/nav.js"></script>
</html>