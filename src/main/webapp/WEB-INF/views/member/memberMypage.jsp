<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이페이지</title>
    <!-- CSS 파일 경로 확인 -->
    <link rel="stylesheet" type="text/css" href="${ctp}/css/memberMypage.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <script type="text/javascript" src="${ctp}/js/memberMypage.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
    <div class="mypage-container">
        <div class="profile-header">
            <div class="profile-picture">
                <img src="/images/default-profile.png" alt="Profile Picture">
            </div>
            <div class="profile-info">
                <h2 class="nickname">${sNickName}</h2>
                <p class="level">회원레벨: <span>${strLevel}</span></p>
                <a href="#" class="edit-profile-btn">프로필 수정</a>
            </div>
        </div>

        <div class="activity-section">
            <h3>최근 활동</h3>
            <div class="activity-card">
                <h4>최근 게시글</h4>
                <p>게시글 내용...</p>
            </div>
            <div class="activity-card">
                <h4>최근 댓글</h4>
                <p>댓글 내용...이거는 뭔가 테스트겸 입니다 신경쓰지말아주세요</p>
            </div>
        </div>

        <div class="account-settings">
            <h3>계정 설정</h3>
            <a href="/member/memberPasswordChange" class="account-setting-link">비밀번호 변경</a>
            <a href="/member/memberNickChange" class="account-setting-link">닉네임 변경</a>
        </div>
    </div>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>
