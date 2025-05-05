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
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<style>
	#admin{
		display: flex;
		background-color: #f1f1f1; 
		align-items: stretch;
	}
	
	#admin_menu{
		border-right: 1px solid black;	
			
	}

	#admin_content{
		display: flex;
		flex-direction: column;
		margin: 0px 50px;
		padding: 20px 20px 80px 20px;
		width: 100%;
	}
	
	
</style>
</head>
<body>
	<div id="admin">
		<div id="admin_menu">
			<tiles:insertAttribute name="menu" />
		</div>
		<div id="admin_content">
			<tiles:insertAttribute name="body" />
		</div>
	</div>
</body>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</html>