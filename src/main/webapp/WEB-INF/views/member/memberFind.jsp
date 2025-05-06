<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>아이디/비밀번호 찾기</title>
	<link rel="stylesheet" type="text/css" href="${ctp}/css/memberFind.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<link rel="icon" type="image/x-icon" href="${ctp}/images/HITBox.ico">
	<script>
	  const ctp = "${ctp}"; // JSTL 값을 JS에서 사용
	</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />

<div class="height">
	<div class="container">
	  <h2 class="idSearch-title">아이디 찾기</h2>
	  <form name="idFindForm" id="idFindForm" method="post">
	    <table class="idSearch-title-form">
	      <tr>
	        <th class="idSearch-name">이름</th>
	        <td>
	          <div class="inline-block">
	            <input type="text" name="name" id="idName" placeholder="이름을 입력해주세요." class="idSearch-nameInput" required />         
	          </div>	 
	        </td>
	      </tr>
	      <tr>
	        <th>휴대폰 번호</th>
	        <td>
	          <div>
	            <select name="tel1" id="idTel1" class="telSelect" required>
	              <option value="010" selected>010</option>
	              <option value="011">011</option>
	              <option value="016">016</option>
	              <option value="017">017</option>
	              <option value="018">018</option>
	              <option value="019">019</option>
	              <option value="043">043</option>
	            </select> -
	            <input type="text" name="tel2" id="idTel2" required maxlength="4" /> -
	            <input type="text" name="tel3" id="idTel3" required maxlength="4" />
	            <button type="button" onclick="sendVerificationCode('id')" class="VsendBtn">인증번호 받기</button>
	          </div>
	          <div id="idVerifySection" >
	            <input type="text" id="idVerificationCode" placeholder="인증번호 입력" class="verificationInput"/>
	            <button type="button" onclick="verifyCode('id')" class="verificationBtn">인증확인</button>
	            <span id="idVerifyMessage" ></span>
	          </div>
	        </td>
	      </tr>
	      <tr>
	        <td colspan="2">
		        <div class="button-group">
		          <input type="button" value="아이디 찾기" onclick="idSearch()" class="idSearchBtn" />
		          <input type="button" value="돌아가기" class="returnBtn" onclick="location.href='${ctp}/member/memberLogin';" />
		        </div> 
	        </td>
	      </tr>
	    </table>
	  </form>
	</div>

	<div class="container">
	  <h2 class="pwdSearch-title">비밀번호 찾기</h2>
	  <form name="pwFindForm" id="pwFindForm" method="post">
	    <table class="pwdSearch-title-form">
	      <tr>
	        <th class="pwdSearch-name">아이디</th>
	        <td>
	          <div class="inline-block">
	            <input type="text" name="memberId" id="pwMemberId" placeholder="아이디를 입력해주세요." class="pwdSearch-idInput" required />         
	          </div>	 
	        </td>
	      </tr>
	      <tr>
	        <th>휴대폰 번호</th>
	        <td>
	          <div>
	            <select name="tel1" id="pwTel1" class="telSelect" required>
	              <option value="010" selected>010</option>
	              <option value="011">011</option>
	              <option value="016">016</option>
	              <option value="017">017</option>
	              <option value="018">018</option>
	              <option value="019">019</option>
	              <option value="043">043</option>
	            </select> -
	            <input type="text" name="tel2" id="pwTel2" required maxlength="4" /> -
	            <input type="text" name="tel3" id="pwTel3" required maxlength="4" />
	            <button type="button" onclick="sendVerificationCode('pw')" class="VsendBtn">인증번호 받기</button>
	          </div>
	          <div id="pwVerifySection" >
	            <input type="text" id="pwVerificationCode" placeholder="인증번호 입력" class="verificationInput"/>
	            <button type="button" onclick="verifyCode('pw')" class="verificationBtn">인증확인</button>
	            <span id="pwVerifyMessage" ></span>
	          </div>
	        </td>
	      </tr>
	      <tr>
	        <td colspan="2">
	        	<div class="button-group">
		          <input type="button" value="비밀번호 찾기" onclick="pwdSearch()" class="pwdSearchBtn" />
		          <input type="button" value="돌아가기" class="returnBtn" onclick="location.href='${ctp}/member/memberLogin';" />
	          </div>
	        </td>
	      </tr>
	    </table>
	  </form>
	</div>
</div>

<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${ctp}/js/memberFind.js"></script>
</body>
</html>