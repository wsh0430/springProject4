<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<html>
<head>
  <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Main</title>
	<link rel="stylesheet" type="text/css" href="${ctp}/css/memberJoin.css">
	<script type="text/javascript" src="${ctp}/js/memberJoin.js"></script>
</head>
<body>
<!-- Navbar -->
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
	<div class="container">
		<h3>회 원 가 입</h3>
		<form name="myform" method="post" enctype="multipart/form-data" action=""> 
			<table>
				<tr>
					<th>아이디</th>
					<td>
						<div class="form-inline">
							<input type="text" name="memberId" id="memberId" placeholder="아이디를 입력하세요" autofocus required />
							<input type="button" value="아이디 중복체크" class="check-btn" id="memberBtn" onclick="idCheck()" />											
						</div>
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
						<td>
								<div>
									<input type="password" name="memberPwd" id="memberPwd" placeholder="비밀번호를 입력하세요." required />
								</div>
						</td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
						<td>
								<div>
									<input type="password" name="memberPwdCheck" id="memberPwdCheck" placeholder="비밀번호를 입력하세요." required />
								</div>
						</td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td>
							<div class="form-inline">
								<input type="text" name="memberNickName" id="memberNickName" placeholder="닉네임을 입력하세요" required  />
	         	 		<input type="button" value="닉네임중복체크" class="check-btn" id="nickNameBtn" onclick="memberNickCheck()" />
							</div>
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>
							<div>
								<input type="text" name="memberName" id="memberName" placeholder="이름을 입력하세요" required />
							</div>
					</td>
				</tr>
				<tr>
        <th>성별</th>
	        <td>
	        	<input type="radio" name="gender" id="gender" value="공개"  />남자 &nbsp;
	        	<input type="radio" name="gender" id="gender" value="비공개" />여자
	        </td>
	      </tr>
				<tr>
					<th>전화번호</th>
					 <td>
	          <div>
		          <select name="tel1" class="telSelect">
		            <option value="010" selected>010</option>
		            <option value="011">011</option>
		            <option value="016">016</option>
		            <option value="017">017</option>
		            <option value="018">018</option>
		            <option value="019">019</option>
		          </select>-
		          <input type="text" name="tel2" id="tel2" />-
		          <input type="text" name="tel3" id="tel3" />
	          </div>
        	</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
							<div>
								<input type="text" name="memberEmail1" id="memberEmail1" placeholder="이메일 주소" required />@
								<input type="text" name="memberEmail2" id="memberEmail2"  required />
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
	          <select name="likeTeam" class="teamSelect">
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
        	<input type="radio" name="userInfor" id="userinfor1" value="공개"  />공개 &nbsp;
        	<input type="radio" name="userInfor" id="userinfor2" value="비공개" />비공개
        </td>
      </tr>
			<tr>
        <th>광고/이벤트 수신 여부</th>
        <td>
        	<input type="radio" name="ad" id="ad" value="동의"  />동의 &nbsp;
        	<input type="radio" name="ad" id="ad" value="비동의" />비동의
        </td>
      </tr>
			</table>
			<div class="join-form">
	      <input type="button" class="joinBtn" value="회원가입" onclick="fCheck()" />
	    </div>
			
		</form>
	</div>

<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>
