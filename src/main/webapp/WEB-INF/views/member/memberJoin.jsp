<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<html>
<head>
  <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Main</title>
	<link rel="stylesheet" type="text/css" href="${ctp}/css/memberJoin.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="${ctp}/js/woo.js"></script>
	<script>
	  const ctp = "${ctp}"; // JSTL 값 JS 변수로 저장
	</script>
</head>
<body>
<!-- Navbar -->
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
	<div class="container">
		<h3>회 원 가 입</h3>
		<form name="myform" method="post" enctype="multipart/form-data"> 
			<table>
				<tr>
					<th>아이디</th>
					<td>
						<div class="form-inline">
							<input type="text" name="memberId" id="memberId" placeholder="아이디를 입력하세요"  required />
							<input type="button" value="아이디 중복체크" class="check-btn" id="midBtn" onclick="idCheck()" />											
						</div>
						<div id="idMessage" class="error-msg"></div>
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
						<td>
								<div>
									<input type="password" name="password" id="password" placeholder="비밀번호를 입력하세요." required />
								</div>
									<div id="pwdMessage" class="error-msg"></div>
						</td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
						<td>
								<div>
									<input type="password" name="memberPwdCheck" id="memberPwdCheck" placeholder="비밀번호를 다시 입력해주세요." required />
								</div>
									<div id="pwdCheckMessage" class="error-msg"></div>
						</td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td>
							<div class="form-inline">
								<input type="text" name="nickName" id="nickName" placeholder="닉네임을 입력하세요" required  />
	         	 		<input type="button" value="닉네임중복체크" class="check-btn" id="nickNameBtn" onclick="memberNickCheck()" />
							</div>
							<div id="nickNameMessage" class="error-msg"></div>	         	 		
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>
							<div>
								<input type="text" name="name" id="name" placeholder="이름을 입력하세요" required />
							</div>
							<div id="nameMessage" class="error-msg"></div>
					</td>
				</tr>
				<tr>
				  <th>성별</th>
				   <td class="gender-group">
				    <input type="radio" name="gender" id="gender1" value="남자" required />
				    <label for="gender1">남자</label>
				    <input type="radio" name="gender" id="gender2" value="여자" required />
				    <label for="gender2">여자</label>
				  </td>
				</tr>				
				<tr>
					<th>전화번호</th>
					 <td>
	          <div>
		          <select name="tel1" class="telSelect" required >
		            <option value="010" selected>010</option>
		            <option value="011">011</option>
		            <option value="016">016</option>
		            <option value="017">017</option>
		            <option value="018">018</option>
		            <option value="019">019</option>
		          </select>-
		          <input type="text" name="tel2" id="tel2" required />-
		          <input type="text" name="tel3" id="tel3" required />
	          </div>
        	</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
							<div>
								<input type="text" name="email" id="email1" placeholder="이메일 주소" required />@
								<input type="text" name="email" id="email2"  required />
								<select name="email" class="emailSelect" onchange="setEmailDomain(this.value)">
		            <option value="self" selected>직접입력</option>
		            <option value="naver.com">naver.com</option>
		            <option value="gamil.com">gmail.com</option>
		            <option value="yahoo.com">yahoo.com</option>
		            <option value="nate.com">nate.com</option>
		            <option value="daum.com">daum.net</option>
		            <option value="hanmail.com">hanmail.net</option>
		          </select>
							</div>
					</td>
				</tr>
	      <tr>
	        <th>좋아하는 팀</th>
	        <td>
	          <select name="likeTeam" class="teamSelect" required >
	            <option selected>선택안함</option>
	            <option>LG</option>
	            <option>SSG</option>
	            <option>KT</option>
	            <option>삼성</option>
	            <option>KIA</option>
	            <option>롯데</option>
	            <option>NC</option>
	            <option>두산</option>
	            <option>한화</option>
	            <option>키움</option>
	          </select>
	        </td>
	      </tr>
	      <tr>
	        <th>정보공개</th>
	        <td>
	        	<div class="userInfo-group">
		        	<input type="radio" name="userInfo" id="userInfo1" value="공개"   />
		        	<label for="userInfo1">공개</label>
		        	<input type="radio" name="userInfo" id="userInfo2" value="비공개"  />
		        	<label for="userInfo2">비공개</label>
	        	</div>
	        </td>
	      </tr>
	     </table>
	     <div id="addContentCheckDiv">
	     	<input type="button" onclick="optionCheck()" id="addContentCheck" name="addContentCheck" value="선택항목 ▼"/>
	     </div>
	     <div  id="choiceSection" style="display: none;">
		     <table>
			      <tr>
			      	<th>주소</th>
				      	<td>
				      		<div class="address-group">
				      			<div class="find-address">
				      				<input type="text" name="postcode" id="sample6_postcode" placeholder="우편번호" >
				      				<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" >
				      			</div>
				      			<input type="text" name="roadAddress" id="sample6_address" placeholder="주소" class="main-address">
				      			<div class="extra-address">
				      				<input type="text" name="detailAddress" id="sample6_detailAddress" placeholder="상세주소">
				      				<input type="text" name="extraAddress" id="sample6_extraAddress" placeholder="참고항목">
				      			</div>
				      		</div>
				      	</td>
			      </tr>
			      <tr>
			      	<th>생일</th>
				      	<td>
				      		<input type="date" name="birthday" value=<%=LocalDate.now() %> class="birthday-input"/>
				      	</td>
			      </tr>
			      <tr>
						  <th>회원 프로필 사진</th>
							  <td>
							    <input type="file" name="fName" id="file" onchange="imgCheck(this)"  />  
							    <div class="preview-box">
							      <img id="photoDemo" width="100px"/>
							    </div>
							  </td>
						</tr>
			      <tr>
			      	<th>회원 소개</th>
			      		<td>
			      			<textarea class="intro-textarea" name="content" placeholder="자기소개를 입력해주세요."></textarea>
			      		</td>
			      </tr>
					</table>
				</div>
			<div class="join-form">
	      <input type="button" class="joinBtn" value="회원가입" onclick="fCheck()" />
	    </div>
	    <input type="hidden" name="tel">
			<input type="hidden" name="email">
			<input type="hidden" name="address">	
		</form>
	</div>

<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${ctp}/js/memberJoin.js"></script>
</body>
</html>
