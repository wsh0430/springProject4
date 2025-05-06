<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<html>
<head>
  <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>memberLogin</title>
	<link rel="stylesheet" type="text/css" href="${ctp}/css/memberLogin.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
	<link rel="icon" type="image/x-icon" href="${ctp}/images/HITBox.ico">
</head>
<body>
<!-- Navbar -->
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
	<div class="container">
		<h3>로 그 인</h3>
		  <form name="myform" method="post">
				<table class="login-form">
				  <tr>
				    <th>아이디</th>
				    <td><input type="text" name="memberId" id="memberId" value="${memberId}" placeholder="아이디를 입력하세요"  class="mLoginInput" /></td>
				  </tr>
				  <tr>
				    <th>비밀번호</th>
				    <td>
				    	<input type="password" name="password" id="password" placeholder="비밀번호를 입력하세요."  class="pLoginInput" />
				    	<i class="fa fa-eye-slash" id="eye-icon" onclick="togglePassword('password', this)"></i>
	          	<div id="nowPwdMessage" class="error-msg"></div>
				    </td>
				  </tr>
				  <tr>
					  <td colspan="2" class="loginOptions">
					    <label class="switch">
					      <input type="checkbox" id="idSave" name="idSave" />
					      <span class="slider"></span>
					      <span class="toggle-text">로그인 상태 유지</span>
					    </label>
					  </td>
					</tr>
				</table>
				<div class="loginSubmit">
				  <input type="submit" value="Login" class="loginBtn"/>
				</div>	
				<div class="loginLinks">
				      <a href="${ctp}/member/memberFind">아이디/비밀번호 찾기</a> |
				      <a href="${ctp}/member/memberJoin">회원가입</a>
				</div>
				
				<!-- 소셜 간편 로그인 -->
		    <div class="social-buttons">
				  <!-- 네이버 로그인 -->
				  <button type="button" class="social-btn naver-btn" title="네이버 로그인" onmouseenter="triggerPulse(this)">
				    <img src="${ctp}/images/naver-logo.svg" alt="네이버"/>
				  </button>
				
				  <!-- 구글 로그인 -->
				  <button type="button" class="social-btn google-btn" title="구글 로그인" onmouseenter="triggerPulse(this)">
				     <img src="${ctp}/images/google-logo.svg" alt="구글" />
				  </button>
				
				  <!-- 카카오 로그인 -->
				  <button type="button" class="social-btn kakao-btn" title="카카오 로그인" onmouseenter="triggerPulse(this)">
				    <img src="${ctp}/images/kakao-logo.svg" alt="카카오"/>
				  </button>
				</div>
		  </form>
	</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<script type="text/javascript" src="${ctp}/js/memberLogin.js"></script>
</body>
</html>

