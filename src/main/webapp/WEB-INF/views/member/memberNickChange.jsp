<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>닉네임 변경하기</title>
	<link rel="stylesheet" type="text/css" href="${ctp}/css/memberNickChange.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script>
    const sNickName = '${sNickName}';  // JSP에서 서버 변수를 JavaScript 변수로 전달
	</script>
	<script>
	  const ctp = "${ctp}"; // JSTL 값 JS 변수로 저장 외부에서 js를 불러오는데 ajax에서 ${ctp}를 인식하지못해서!
	  console.log(ctp);  // ctp 값이 제대로 출력되는지 확인
	</script>
	
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<div class="container">
  <h2 class="nickChange-title">닉네임 변경</h2>
  <form name="myform" method="post">
    <table class="nickChange-form">
      <tr>
        <th class="nickTh">닉네임</th>
	        <td>
	          <div class="inline-block">
	            <input type="text" name="nickName" id="nickName" placeholder="닉네임을 입력해주세요." class="nickChange" required />         
	            <input type="button" value="닉네임 중복확인" class="check-btn" id="nickNameBtn" onclick="memberNickCheck()" />
	          </div>
	         	<div id="nickNameMessage" class="error-msg"></div>	 
	        </td>
      </tr>
      <tr>
        <td colspan="2">
          <input type="button" value="닉네임 변경" onclick="nCheck()" class="nickChangeBtn" />
          <input type="button" value="돌아가기" class="returnBtn" onclick="location.href='${ctp}/member/memberMypage';" />
        </td>
      </tr>
    </table>
  </form>
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${ctp}/js/memberNickChange.js"></script>
</body>
</html>