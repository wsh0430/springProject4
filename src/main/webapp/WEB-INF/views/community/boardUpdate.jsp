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
    	
    	.low-bar{
    		margin-top: 10px;
    		display: flex;
    		justify-content: space-between;
    	}
    </style>
</head>
<body>
    <div id="main">
    	<form name="myform" method="post">    	
		<div id="category">
				<select name="categoryName">
					<option>${boardVo.categoryName}</option>
					<c:forEach var="mCtgyVo" items="${mainCtgyVos}">
						<c:if test="${boardVo.categoryName != mCtgyVo.name }"> <!-- 만약 카테고리가 하위카테고리면 이상해질 수 있음 -->
							<option>${mCtgyVo.name}</option>
						</c:if>
					</c:forEach>
				</select>
		</div>
		<textarea name="title" id="title" placeholder="제목을 입력해주세요." required>${boardVo.title }</textarea>
		<div>
			<textarea name="content" id="CKEDITOR" placeholder="내용을을 입력해주세요.">${boardVo.content }</textarea>
			 <script>
	            CKEDITOR.replace("content",{
	            	height:460,
	            	filebrowserUploadUrl:"${ctp}/imageUpload",
	            	uploadUrl : "${ctp}/imageUpload",
	            	resize_enabled: false
	            });
	         </script>
		</div>
		<div class="low-bar">
			<div class="left"></div>
			<div class="right">
				<input type="submit" value="발행">			
			</div>
		</div>
	    <%--  <input type="hidden" name="mid" value="${sMid}"/> --%>
	    <input type="hidden" name="idx" value="${boardVo.idx}"/>
	    <input type="hidden" name="pag" value="${pag}"/>
	    <input type="hidden" name="pageSize" value="${pageSize}"/>
	    <input type="hidden" name="search" value="${search}"/>
	    <input type="hidden" name="searchString" value="${searchString}"/>
    	</form>
	</div>
</body>
</html>