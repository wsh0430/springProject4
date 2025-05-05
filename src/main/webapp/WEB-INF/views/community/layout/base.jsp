<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath }" />
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hitbox</title> 
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<style>
	#community{
		display: flex;
		justify-content: center;
		background-color: #f1f1f1;
		padding-bottom: 80px; 
	}

	.content {
		min-height: 700px;
		width: 1200px;
		display: flex;
		justify-content: center;
	}
	
	
</style>
</head>
<body>
	<div id="community">
		<div class="content">
			<tiles:insertAttribute name="ad_left" />
			<tiles:insertAttribute name="body" />
			<tiles:insertAttribute name="ad_right" />
		</div>
	</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>