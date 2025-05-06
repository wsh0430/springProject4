<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>비밀번호 변경</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
	<link rel="stylesheet" type="text/css" href="${ctp}/css/memberPassChange.css">
	<link rel="icon" type="image/x-icon" href="${ctp}/images/HITBox.ico">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script>
	  const ctp = "${ctp}"; // JSTL 값 JS 변수로 저장 외부에서 js를 불러오는데 ajax에서 ${ctp}를 인식하지못해서!
	</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<div class="container">
  <h2 class="pwdChange-title">비밀번호 변경</h2>
  <form name="myform" method="post">
    <table class="pwdChange-form">
      <tr>
        <th>현재 비밀번호</th>
	        <td>
	          <div style="position: relative;">
	            <input type="password" name="nowPwd" id="nowPwd" placeholder="현재 비밀번호 입력" class="pwdChange" required />
	            <i class="fa fa-eye-slash" id="eye-icon" onclick="togglePassword('nowPwd', this)"></i>
	          </div>
	          <div id="nowPwdMessage" class="error-msg"></div>
	        </td>
      </tr>
      <tr>
        <th>새 비밀번호</th>
        <td>
          <div style="position: relative;">
            <input type="password" name="newPwd" id="newPwd" placeholder="새 비밀번호 입력" class="pwdChange" required />
            <i class="fa fa-eye-slash" id="eye-icon" onclick="togglePassword('newPwd', this)" ></i>
          </div>
          <div id="newPwdMessage" class="error-msg"></div>
        </td>
      </tr>
      <tr>
        <th>비밀번호 확인</th>
        <td>
          <div style="position: relative;">
            <input type="password" name="newPwdCheck" id="newPwdCheck" placeholder="새 비밀번호 확인" class="pwdChange" required />
            <i class="fa fa-eye-slash" id="eye-icon" onclick="togglePassword('newPwdCheck', this)" ></i>
          </div>
          <div id="newPwdCheckMessage" class="error-msg"></div>
        </td>
      </tr>
      <tr>
        <td colspan="2">
          <input type="submit" value="비밀번호 변경" onclick="pCheck()" class="pwdChangeBtn" />
          <input type="button" value="돌아가기" class="returnBtn" onclick="location.href='${ctp}/member/memberMypage';" />
        </td>
      </tr>
    </table>
  </form>
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${ctp}/js/memberPassChange.js"></script>
</body>
</html>