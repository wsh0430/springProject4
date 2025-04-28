<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<html>
<head>
  <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Main</title>

</head>
<body>
<!-- Navbar -->
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
안녕하세요 테스트입니다

<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>
