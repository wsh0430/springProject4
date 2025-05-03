<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>footer</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
	<link rel="stylesheet" href="${ctp}/css/footer.css">
</head>
<body>
	  <!-- Footer -->
    <footer>
        <!-- 소셜 미디어 아이콘 -->
        <div class="social-icons">
            <i class="fab fa-facebook-square"></i>
            <i class="fab fa-twitter"></i>
            <i class="fab fa-instagram"></i>
            <i class="fab fa-youtube"></i>
        </div>

        <!-- 푸터 텍스트 -->
        <div class="footer-text">
            <p>HITBox Community | Your Go-to Spot for Baseball News and Updates!</p>
            <p>Powered by <a href="https://www.baseball.com" target="_blank">HITBox</a></p>
        </div>

        <!-- 추가 정보 및 연락처 -->
        <div class="footer-info">
            <p>Contact us: 043 225 2111 | Email: info@hitbox.com</p>
            <p>&copy; 2025 HITBox Community. All rights reserved.</p>
        </div>
    </footer>
	
</body>
</html>