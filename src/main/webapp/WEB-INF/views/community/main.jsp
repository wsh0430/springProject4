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
    				<c:forEach var="mcVos" items="${mainCtgyVos}">
    					<td>${mcVos.name}</td>
    				</c:forEach>
    			</tr>
    			<c:if test="${subCtgy != null}">
	    			<tr>
	    				<c:forEach var="sCtgy" items="${subCtgy}">
	    					<c:forEach var="scVos" items="${sCtgy}">
								 <td>${scVos.name}</td>				
		    				</c:forEach>
	    				</c:forEach>
	    			</tr>
    			</c:if>
    		</table>
    	</div>
    	<div id="board">
    		<table>
    			<c:forEach var="bVos" items="${boardVos}">
	    			<tr>
	    				<td>${bVos.idx}</td>
	    				<td>${bVos.title}(${bVos.commentCount})</td>
	    				<td>${bVos.memberNickname}</td>
	    				<td>
	    					<c:if test="${bVos.createdAt == updateAt}">
	    						${bVos.createdAt}
	    					</c:if>
	    					<c:if test="${bVos.createdAt != updateAt}">
	    						${bVos.updateAt}(수정됨)
	    					</c:if>
	    				</td>
	    				<td>${bVos.viewCount}</td>
	    				<td>${bVos.likeCount}</td>
	    			</tr>
    			</c:forEach>
    		</table>
    	</div>
	</div>
</body>
</html>