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
<a href="${ctp}/record/recordCrawl" class="w3-bar-item w3-button">크롤링</a>
<a href="${ctp}/record/recordHitterView" class="w3-bar-item w3-button">기록실(타자-시즌)</a>
<a href="${ctp}/dataChart/teamPlayerAverage" class="w3-bar-item w3-button">팀-타격</a>
<a href="${ctp}/dataChart/teamPitcherAverage" class="w3-bar-item w3-button">팀-투구</a>
<a href="${ctp}/dataChart/playerCompare" class="w3-bar-item w3-button">개인-타자</a>
</body>
</html>
