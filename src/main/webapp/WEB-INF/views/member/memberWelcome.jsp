<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
</head>
<body>
	 <img src="${ctp}/images/welcome.webp" alt="환영합니다."/>
	 <p>스탯티즈 회원가입이 완료되었습니다.</p>
	 <br/>
	 <p>로그인 후 스탯티즈의 다양한 서비스를 이용하실 수 있습니다.</p>
</body>
</html>