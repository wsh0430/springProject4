<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath }" />
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<h2>안녕하세요.</h2>
<h2>안녕하세요.</h2>
<h2>안녕하세요.</h2>
<h2>안녕하세요.</h2>
<h2>안녕하세요.</h2>
<h2>안녕하세요.</h2>
<a href="${ctp}/community/main">커뮤니티 main화면 이동</a>
</body>
</html>
