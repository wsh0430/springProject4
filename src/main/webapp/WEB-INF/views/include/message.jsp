<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>message</title>
	<style>
		.modal-overlay {
			position: fixed;
			top: 0; left: 0;
			width: 100%; height: 100%;
			background: rgba(0, 0, 0, 0.5);
			display: flex;
			justify-content: center;
			align-items: center;
			z-index: 1000;
		}
		.modal-box {
			background: white;
			padding: 30px;
			border-radius: 10px;
			box-shadow: 0 4px 8px rgba(0,0,0,0.3);
			text-align: center;
			width: 300px;
			font-family: Arial, sans-serif;
		}
		.modal-box h2 {
			margin-top: 0;
			color: #FF2400;
		}
		.modal-box button {
			margin-top: 20px;
			padding: 10px 20px;
			background-color: #FF5E57;
			border: none;
			color: #F1F1F1;
			border-radius: 5px;
			cursor: pointer;
		}
		.modal-box button:hover {
			background-color: #E74C3C;
		}
	</style>
</head>
<body>

<c:if test="${not empty message}">
	<div class="modal-overlay" id="modal">
		<div class="modal-box">
			<h2>알림</h2>
			<p>${message}</p>
			<button onclick="redirect()">확인</button>
		</div>
	</div>
</c:if>

<script>
	function redirect() {
		const url = "${ctp}/${url}";
		window.location.href = url;
	}
</script>

</body>
</html>