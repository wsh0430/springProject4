<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>아이디 찾기</title>
	<link rel="stylesheet" type="text/css" href="${ctp}/css/memberFind.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	
	<script>
	  const ctp = "${ctp}"; // JSTL 값 JS 변수로 저장 외부에서 js를 불러오는데 ajax에서 ${ctp}를 인식하지못해서!
	</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<div class="height">
	<div class="container">
	  <h2 class="idSearch-title">아이디 찾기</h2>
	  <form name="myform" method="post">
	    <table class="idSearch-title-form">
	      <tr>
	        <th class="idSearch-name">이름</th>
		        <td>
		          <div class="inline-block">
		            <input type="text" name="name" id="name" placeholder="이름을 입력해주세요." class="idSearch-nameInput" required />         
		          </div>	 
		        </td>
	      </tr>
	      <tr>
	      	<th class="idSearch-phone">휴대폰 번호</th>
			      <td>
			        <div class="inline-block">
			          <input type="tel" name="tel" id="tel" placeholder="숫자만 입력 (예: 01012345678)" class="phone-Input" required />
			          <input type="button" value="인증번호 요청" onclick="sendVerificationCode()" class="VsendBtn" />
			        </div>
			      </td>
	      </tr>
	      <tr id="verifySection" >
	        <th class="idSearch-code">인증번호</th>
		        <td>
		          <div class="inline-block">
		            <input type="text" id="verificationCode" placeholder="인증번호 입력" class="verification-Input" />
		            <input type="button" value="확인" onclick="verifyCode()" class="verificationBtn" />
		          </div>
		        </td>
	      </tr>
	      <tr>
	        <td colspan="2">
	          <input type="button" value="아이디 찾기" onclick="idSearch()" class="idSearchBtn" />
	          <input type="button" value="돌아가기" class="returnBtn" onclick="location.href='${ctp}/member/memberLogin';" />
	        </td>
	      </tr>
	    </table>
	  </form>
	</div>
	<div class="container">
		  <h2 class="pwdSearch-title">비밀번호 찾기</h2>
		  <form name="myform" method="post">
		    <table class="pwdSearch-title-form">
		      <tr>
		        <th class="pwdSearch-name">아이디</th>
			        <td>
			          <div class="inline-block">
			            <input type="text" name="memberId" id="memberId" placeholder="아이디를 입력해주세요." class="pwdSearch-idInput" required />         
			          </div>	 
			        </td>
		      </tr>
		      <tr>
		      	<th class="pwdSearch-phone">휴대폰 번호</th>
				      <td>
				        <div class="inline-block">
				          <input type="tel" name="tel" id="tel" placeholder="숫자만 입력 (예: 01012345678)" class="phone-Input" required />
				          <input type="button" value="인증번호 요청" onclick="sendVerificationCode()" class="VsendBtn" />
				        </div>
				      </td>
		      </tr>
		      <tr id="verifySection" >
		        <th class="pwdSearch-code">인증번호</th>
			        <td>
			          <div class="inline-block">
			            <input type="text" id="verificationCode" placeholder="인증번호 입력" class="verification-Input" />
			            <input type="button" value="확인" onclick="verifyCode()" class="verificationBtn" />
			          </div>
			        </td>
		      </tr>
		      <tr>
		        <td colspan="2">
		          <input type="button" value="비밀번호 찾기" onclick="pwdSearch()" class="pwdSearchBtn" />
		          <input type="button" value="돌아가기" class="returnBtn" onclick="location.href='${ctp}/member/memberLogin';" />
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