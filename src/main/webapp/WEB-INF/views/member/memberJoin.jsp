<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
</head>
<body>
	<div class="container">
		<h3>회 원 가 입</h3>
		<form name="myform" method="post" enctype="multipart/form-data" action=""> 
			<table>
				<tr>
					<th>아이디</th>
					<td>
					<div>
						<input type="text" name="memberId" id="memberId" placeholder="아이디를 입력하세요" autofocus required />
						<input type="button" value="아이디 중복체크" id="memberBtn" onclick="idCheck()" />											
					</div>
					
			</table>
		</form>
	</div>
</body>
</html>