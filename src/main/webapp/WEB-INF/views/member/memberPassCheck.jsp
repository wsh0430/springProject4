<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>비밀번호 확인하기</title>
	<link rel="stylesheet" type="text/css" href="${ctp}/css/memberPassCheck.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<div class="container">
	<h2 class="pwdCheck-title">비밀번호 확인</h2>
	<form name="myform" method="post">
    <table class="pwdCheck-form">
      <tr>
        <th>현재 비밀번호</th>
	        <td>
	          <div style="position: relative;">
	            <input type="password" name="nowPwd" id="nowPwd" placeholder="현재 비밀번호 입력" class="pwdChange"  />
	            <i class="fa fa-eye" id="eye-icon" onclick="togglePassword('nowPwd', this)"></i>
	          </div>
	          <div id="nowPwdMessage" class="error-msg"></div>
	        </td>
      </tr>
    </table>
    <div class="btn-wrapper">
			<button type="submit" class="deleteBtn">회원탈퇴</button>
		</div>
	</form>
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<script type="text/javascript" src="${ctp}/js/memberPassCheck.js"></script>
</body>
</html>