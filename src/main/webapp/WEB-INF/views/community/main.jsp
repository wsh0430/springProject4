<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hitbox</title>
    <style>
    	#main{
    		min-width: 80%; 		
    	}	
    </style>
</head>
<body>
    <div id="main">
    	<span>선택 카테고리</span>
    	<div id="category">
    		<table>
    			<tr>
    				<c:forEach var="mCtgy" items="${mainCategory}">
    					<td>${mCtgy.name}</td>
    				</c:forEach>
    			</tr>
    			<c:if test="${subCategory != null}">
	    			<tr>
	    				<c:forEach var="sCtgy" items="${subCategory}">
	    					<td>${sCtgy.name}</td>
	    				</c:forEach>
	    			</tr>
    			</c:if>
    		</table>
    	</div>
	</div>
</body>
</html>