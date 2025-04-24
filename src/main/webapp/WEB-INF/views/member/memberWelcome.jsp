<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Welcome</title>
	<style>
        .main-content {
				    display: flex;
				    justify-content: center;
				    align-items: center;
				    min-height: 80vh;
				    padding: 40px 0;
				}

        .welcome-container {
            background: white;
            padding: 80px 80px;
            border-radius: 12px;
            text-align: center;
            max-width: 700px;
 					  min-height: 500px;  
   	        width: 100%;
        }

        .welcome-container img {
            width: 400px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.15); 
    				border-radius: 50%;
            margin-bottom: 20px;
        }

        .welcome-container h1 {
            color: #FF2400;
            margin-bottom: 15px;
        }

        .welcome-container p {
            color: black;
            font-size: 16px;
            line-height: 1.6;
            margin-bottom: 25px;
        }

        .login-btn {
            margin-top: 50px;
            padding: 12px 24px;
            background-color: #FF5E57;
            color: #F1F1F1;
            border: none;
            border-radius: 6px;
            font-size: 14px;
            cursor: pointer;
            text-decoration: none;
        }

        .login-btn:hover {
            background-color: #E74C3C;
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
 <div class="main-content">
	 <div class="welcome-container">
        <img src="${ctp}/images/welcome.webp" alt="환영합니다." />
        <h1> 회원가입을 축하드립니다! 🎉</h1>
        <p>스탯티즈에 오신 것을 진심으로 환영합니다.</p>
        <p>로그인 후 다양한 서비스를 자유롭게 이용해보세요!</p>
        <a class="login-btn" href="${ctp}/member/memberLogin">로그인 하러 가기</a>
    </div>
 </div>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>