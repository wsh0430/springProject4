<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이페이지</title>
    <!-- CSS 파일 경로 확인 -->
    <link rel="stylesheet" type="text/css" href="${ctp}/css/memberMypage.css">
    <link rel="icon" type="image/x-icon" href="${ctp}/images/HITBox.ico">
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  	<script src="${ctp}/js/woo.js"></script>
    <script>
	  	const ctp = "${ctp}"; // JSTL 값 JS 변수로 저장 외부에서 js를 불러오는데 ajax에서 ${ctp}를 인식하지못해서!
		</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
    <div class="mypage-container">
     <form name="myform" method="post" enctype="multipart/form-data">
        <div class="profile-header">
            <div class="profile-picture">
                <img src="${ctp}/member/${vo.icon}" >
            </div>
            <div class="profile-info">
                <h2 class="nickname">${sNickName}</h2>
                <p class="level">회원레벨: <span>${strLevel}</span></p>
                <p class="point">내 포인트: <span>${vo.point}</span></p>
            </div>          
       </div>
       
       	<div class="member-update-section">
	 			  <h3>내 정보 수정</h3>
				    <table>
					    <tr>
				        <th>좋아하는 팀</th>
				        <td>
				          <select name="likeTeam" class="teamSelect">
									  <option value="" <c:if test="${vo.likeTeam == null || vo.likeTeam == ''}"></c:if>>선택안함</option>
									  <option value="LG" <c:if test="${vo.likeTeam == 'LG'}">selected</c:if>>LG</option>
									  <option value="SSG" <c:if test="${vo.likeTeam == 'SSG'}">selected</c:if>>SSG</option>
									  <option value="KT" <c:if test="${vo.likeTeam == 'KT'}">selected</c:if>>KT</option>
									  <option value="삼성" <c:if test="${vo.likeTeam == '삼성'}">selected</c:if>>삼성</option>
									  <option value="KIA" <c:if test="${vo.likeTeam == 'KIA'}">selected</c:if>>KIA</option>
									  <option value="롯데" <c:if test="${vo.likeTeam == '롯데'}">selected</c:if>>롯데</option>
									  <option value="NC" <c:if test="${vo.likeTeam == 'NC'}">selected</c:if>>NC</option>
									  <option value="두산" <c:if test="${vo.likeTeam == '두산'}">selected</c:if>>두산</option>
									  <option value="한화" <c:if test="${vo.likeTeam == '한화'}">selected</c:if>>한화</option>
									  <option value="키움" <c:if test="${vo.likeTeam == '키움'}">selected</c:if>>키움</option>
									</select>
				        </td>
				      </tr>
				      <tr>
								<th>이름</th>
								<td>
										<div>
											<input type="text" name="name" id="name" value="${vo.name}"  />
										</div>
										<div id="nameMessage" class="error-msg"></div>
								</td>
							</tr>
				      <tr>
							  <th>성별</th>
							   <td class="gender-group">
							    <input type="radio" name="gender" id="gender1" value="남자" ${vo.gender=='남자' ? 'checked' : ''} />
							    <label for="gender1">남자</label>
							    <input type="radio" name="gender" id="gender2" value="여자" ${vo.gender=='여자' ? 'checked' : ''} />
							    <label for="gender2">여자</label>
							  </td>
							</tr>			
				      <tr>
								<th>전화번호</th>
								 <td>
				          <div>
					          <c:set var="tel" value="${fn:split(vo.tel, '-')}"/>
						          <select name="tel1" class="telSelect" required >
	                     	<option value="010" ${tel[0]=='010' ? 'selected' : ''}>010</option>
				                <option value="011" ${tel[0]=='011' ? 'selected' : ''}>011</option>
				                <option value="016" ${tel[0]=='016' ? 'selected' : ''}>016</option>
				                <option value="017" ${tel[0]=='017' ? 'selected' : ''}>017</option>
				                <option value="018" ${tel[0]=='018' ? 'selected' : ''}>018</option>
				                <option value="019" ${tel[0]=='019' ? 'selected' : ''}>019</option>
				                <option value="043" ${tel[0]=='043' ? 'selected' : ''}>043</option>
						          </select>-
						          <input type="text" name="tel2" id="tel2" value="${fn:trim(tel[1])}" required />-
						          <input type="text" name="tel3" id="tel3" value="${fn:trim(tel[2])}" required />
				          </div>
			        	</td>
							</tr>
				      <tr>
								<th>이메일</th>
								<td>
										<div>
										  <c:set var="email" value="${fn:split(vo.email, '@')}"/>
											<input type="text" name="email1" id="email1" value="${email[0]}"  />@
											<input type="text" name="email2" id="email2" value="${email[1]}"  />
											<select name="emailDomain" class="emailSelect" onchange="setEmailDomain(this.value)">
					            <option value="self"  ${empty email[1] ? 'selected' : ''}>직접입력</option>
					            <option value="naver.com" ${email[1] == 'naver.com'   ? 'selected' : ''}>naver.com</option>
					            <option value="gmail.com" ${email[1] == 'gmail.com'   ? 'selected' : ''}>gmail.com</option>
					            <option value="yahoo.com" ${email[1] == 'yahoo.com'   ? 'selected' : ''}>yahoo.com</option>
					            <option value="nate.com" ${email[1] == 'nate.com'   ? 'selected' : ''}>nate.com</option>
					            <option value="daum.net" ${email[1] == 'daum.net'   ? 'selected' : ''}>daum.net</option>
					            <option value="hanmail.net" ${email[1] == 'hanmail.net'   ? 'selected' : ''}>hanmail.net</option>
					          </select>
										</div>
								</td>
							</tr>
				      <tr>
				        <th>정보공개</th>
				        <td>
				        	<div class="userInfo-group">
					        	<input type="radio" name="memberInfo" id="memberInfo1" value="공개"  ${vo.memberInfo=='공개'   ? 'checked' : ''} />
					        	<label for="memberInfo1">공개</label>
					        	<input type="radio" name="memberInfo" id="memberInfo2" value="비공개" ${vo.memberInfo=='비공개' ? 'checked' : ''} />
					        	<label for="memberInfo2">비공개</label>
				        	</div>
				        </td>
				      </tr>
				      </table>
				     </div>
				      <div id="addContentCheckDiv">
					     	<input type="button" onclick="optionCheck()" id="addContentCheck" name="addContentCheck" value="선택항목 ▼"/>
					    </div>
					    <div  id="choiceSection" style="display: none;">
				      	<table class="member-info-table">
								  <tr>
								    <th class="table-header">주소</th>
								    <td class="table-data">
								      <div class="address-group">
								        <div class="find-address">
								          <c:set var="address" value="${fn:split(vo.address, '/')}"/>
								          <input type="text" name="postcode" id="sample6_postcode" value="${fn:trim(address[0])}" class="input-field postcode-input">
								          <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn address-btn">
								        </div>
								        <input type="text" name="roadAddress" id="sample6_address" value="${fn:trim(address[1])}" class="input-field main-address">
								        <div class="extra-address">
								          <input type="text" name="detailAddress" id="sample6_detailAddress" value="${fn:trim(address[2])}" class="input-field detail-address">
								          <input type="text" name="extraAddress" id="sample6_extraAddress" value="${fn:trim(address[3])}" class="input-field extra-address">
								        </div>
								      </div>
								    </td>
								  </tr>
								  <tr>
								    <th class="table-header">생일</th>
								    <td class="table-data">
								      <input type="date" name="birthday" value="${fn:substring(vo.birthday, 0, 10)}" class="input-field birthday-input">
								    </td>
								  </tr>
								  <tr>
								    <th class="table-header">회원 프로필 사진</th>
								    <td class="table-data profile-section">
								      <span class="profile-label">회원사진:</span>
								      <img src="${ctp}/member/${vo.icon}" width="100px" class="profile-image"/>
								      <input type="file" name="fName" id="file" class="input-file">
								    </td>
								  </tr>
								  <tr>
								    <th class="table-header">회원 소개</th>
								    <td class="table-data">
								      <textarea class="input-field intro-textarea" name="content" placeholder="자기소개를 입력해주세요.">${vo.content}</textarea>
								    </td>
								  </tr>
								</table>
						   </div>
						   <div class="form-btns">
						      <input type="submit" onclick="fCheck()" value="정보 수정 완료" />
						      <input type="button" value="돌아가기" onclick="location.href='${ctp}/';" />
							 </div>
							 <input type="hidden" name="email" />
					     <input type="hidden" name="tel" />
					     <input type="hidden" name="address" />
					     <input type="hidden" name="icon" id="icon" value="${vo.icon}" />
		  		</form>
				
        <div class="activity-section">
            <h3>최근 활동</h3>
            <p>방문수 : ${vo.visitCount}</p>
            <div class="activity-board">
                <h4>최근 게시글</h4>
                <div>게시글 내용...</div>
            </div>
            <div class="activity-comment">
                <h4>최근 댓글</h4>
                <p>댓글 내용...이거는 뭔가 테스트겸 입니다 신경쓰지말아주세요</p>
            </div>
        </div>

        <div class="account-settings">
            <h3>계정 설정</h3>
            <a href="${ctp}/member/memberPassChange" class="account-setting-link">비밀번호 변경</a>
            <a href="${ctp}/member/memberNickChange" class="account-setting-link">닉네임 변경</a>
            <a href="javascript:deleteCheck()" class="account-setting-link">회원 탈퇴</a>            
        </div>
    </div>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<script type="text/javascript" src="${ctp}/js/memberMypage.js"></script>
</body>
</html>
