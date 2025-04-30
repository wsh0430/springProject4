<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ad_lr.jsp</title>
    <style>
    	#ad_lr{
    		min-width: 10%;
    		height: 300px;
    	}
    </style>
</head>
<body>
	<div id="ad_lr">
		<span>ad test(좌우)</span>
		<span>${adVo.title}</span>
		<span>${adVo.imageUrl}</span>
	</div>
</body>
</html>