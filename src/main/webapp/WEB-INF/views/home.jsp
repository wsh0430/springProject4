<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>임시메인화면</h1>
<a href="${ctp}/record/recordMain" class="w3-bar-item w3-button">기록실</a>
</body>
</html>
