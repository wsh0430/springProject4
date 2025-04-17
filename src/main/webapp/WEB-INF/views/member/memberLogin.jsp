<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<html>
<head>
  <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>memberLogin</title>
	<link rel="stylesheet" type="text/css" href="${ctp}/css/memberLogin.css">
</head>
<body>
<!-- Navbar -->
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
	<div class="container">
		<h3>로 그 인</h3>
		  <form name="myform" method="post">
				<table class="loginTable">
				  <tr>
				    <th>아이디</th>
				    <td><input type="text" name="mid" id="mid" value="${mid}" placeholder="아이디를 입력하세요" required class="loginInput" /></td>
				  </tr>
				  <tr>
				    <th>비밀번호</th>
				    <td><input type="password" name="pwd" id="pwd" placeholder="비밀번호를 입력하세요." required class="loginInput" /></td>
				  </tr>
				  <tr>
				    <td colspan="2" class="loginOptions">
				      <label><input type="checkbox" name="idSave" checked /> 로그인 상태 유지</label>
				    </td>
				  </tr>
				</table>
				<div class="loginLinks">
				      <a href="javascript:midSearch()">아이디 찾기</a> |
				      <a href="javascript:pwdSearch()">비밀번호 찾기</a> |
				      <a href="javascript:memberJoin()">회원가입</a>
				</div>
				<div class="loginSubmit">
				  <input type="submit" value="로그인" class="loginBtn"/>
				</div>	
		    <!-- 소셜 간편 로그인 -->
		    <div class="social-buttons">
				  <button type="button" class="naver-btn"></button>
				  <button type="button" class="google-btn"></button>
				  <button type="button" class="kakao-btn"></button>
				</div>
		  </form>
	</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>

