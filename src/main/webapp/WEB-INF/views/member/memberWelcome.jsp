<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Welcome</title>
	<link rel="stylesheet" type="text/css" href="${ctp}/css/memberWelcome.css">
	<link rel="icon" type="image/x-icon" href="${ctp}/images/HITBox.ico">
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
 <div class="main-content">
	 <div class="welcome-container">
        <img src="${ctp}/images/welcome.webp" alt="환영합니다." />
        <h1>${nickName}님 회원가입을 축하드립니다! 🎉</h1>
        <p>스탯티즈에 오신 것을 진심으로 환영합니다.</p>
        <p>로그인 후 다양한 서비스를 자유롭게 이용해보세요!</p>
        <a class="login-btn" href="${ctp}/member/memberLogin">로그인 하러 가기</a>
    </div>
 </div>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>