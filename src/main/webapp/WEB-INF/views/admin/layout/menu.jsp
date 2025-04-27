<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>adminMenu.jsp</title>
    <style>
    	#admin--menu_bar{
			position: fixed;
	     	left: 0;
	     	width: 200px;
	     	height: 100vh;
	     	display: flex;
	     	flex-direction: column;
	     	padding: 10px;
		}
		
		#a-mb_title{
			padding-left: 8px;
		}

		#a-mb_btn{
			height: 70%;
		}

		#a-mb_btn td{
			height: 25px;
		}
		#a-mb_btn input{
			width: 100%;
			background-color: transparent;
			border: none;
			text-align: left;
		}
    </style>
</head>
<body>
	<div id="admin--menu_bar">
		<div id="a-mb_title">
			<h2>HitBox</h2>
		</div>
		<div id="a-mb_btn">
			<table>
				<tr><td><input type="button" value="대시보드" onclick="location.href='${ctp}/admin/dashBoard'"></td></tr>
				<tr><td><input type="button" value="멤버관리" onclick="location.href='${ctp}/admin/dashBoard'"></td></tr>
				<tr><td><input type="button" value="게시글관리" onclick="location.href='${ctp}/admin/dashBoard'"></td></tr>
				<tr><td><input type="button" value="통계" onclick="location.href='${ctp}/admin/dashBoard'"></td></tr>
				<tr><td><input type="button" value="??" onclick="location.href='${ctp}/admin/dashBoard'"></td></tr>
			</table> 
		</div>
	</div>
</body>
</html>