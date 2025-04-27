<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath }" />
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hitbox  관리자메뉴</title> 
<style>
	#content{
		display: flex;
		flex-direction: column;
		margin-left: 350px;
		padding: 20px;
		height: 100vh;
	}
	
	
</style>
</head>
<body>
	<div id="admin">
		<tiles:insertAttribute name="menu" />
		<div id="content">
			<tiles:insertAttribute name="body" />
		</div>
	</div>
</body>
</html>