<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HitBox</title>
    <script src="${ctp}/ckeditor/ckeditor.js"></script>
    <jsp:include page="/WEB-INF/views/include/bs5.jsp" />
    <style>
   		textarea {
	        width: 100%;
	        box-sizing: border-box;
	        resize: none;
     	 } 
     	 
     	 #main{
    		min-width: 80%; 	
    		margin-top: 30px;	
    	}	
    </style>
</head>
<body>
    <div id="main">
    	<form name="myform" method="post">    	
		<div id="category">
				<select name="categoryName">
					<c:forEach var="mCtgyVo" items="${mainCtgyVos}">
						<option>${mCtgyVo.name}</option>
					</c:forEach>
				</select>
		</div>
		<textarea name="title" id="title" placeholder="제목을 입력해주세요." required></textarea>
		<div>
			<textarea name="content" id="CKEDITOR" placeholder="내용을을 입력해주세요."></textarea>
			 <script>
	            CKEDITOR.replace("content",{
	            	height:460,
	            	filebrowserUploadUrl:"${ctp}/imageUpload",
	            	uploadUrl : "${ctp}/imageUpload",
	            	resize_enabled: false
	            });
	         </script>
		</div>
		<input type="submit" value="발행">
    	</form>
	</div>
</body>
</html>