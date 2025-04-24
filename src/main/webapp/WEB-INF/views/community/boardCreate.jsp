<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>.jsp</title>
    <jsp:include page="/WEB-INF/views/include/bs5.jsp" />
</head>
<body>
    <div id="main">
    	<form name="myform" method="post">    	
		<div id="category">
				<select name="categoryName">
					<c:forEach var="option" items="${category}">
						<option>${option}</option>
					</c:forEach>
				</select>
		</div>
		<textarea name="title" id="title" placeholder="제목을 입력해주세요."></textarea>
		<div>
			<textarea name="content" id="CKEDITOR" placeholder="내용을을 입력해주세요."></textarea>
			 <script>
	            CKEDITOR.replace("content",{
	            	height:460,
	            	filebrowserUploadUrl:"${ctp}/imageUpload",
	            	uploadUrl : "${ctp}/imageUpload"
	            });
	         </script>
		</div>
    	</form>
	</div>
</body>
</html>