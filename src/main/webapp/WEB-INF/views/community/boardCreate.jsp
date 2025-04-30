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
    <script>
	    $(document).ready(function() {
	   	 $('#mc').change(function() {
	   	    let selectedValue = $(this).val();
	
	   	    // 선택된 값이 있을 때만 AJAX 요청
	   	    if (selectedValue) {
	   	      $.ajax({
	   	        url: '${ctp}/admin/getSubCategory',  // 데이터를 받아올 URL
	   	        type: 'get',
	   	        data: { categoryName: selectedValue },
	   	        dataType: 'json',
	   	        success: function(res) {
		        		let string = "";
		        		
		        		if(selectedValue != '전체')
		        			$('#sub-category').show();
		        		else
		        			$('#sub-category').hide();
		        			
		        		res.forEach(function(item) {
		        			string += '<option value="'+item.name+'">'+item.name+'</option>';
		        		});
	
		        		
		        		$('#sc').html(string);
	   	        	
	   	        },
	   	        error: function(xhr, status, error) {
	   	          $('#sub-category').html('<p>오류가 발생했습니다.</p>');
	   	        }
	   	      });
	   	    } else {
	   	      $('#sub-category').empty(); // 선택이 비워지면 div도 초기화
	   	      $('#sub-category').hide();
	   	    }
	   	  });
	   	});
    </script>
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
    	
    	#category{
    		display: flex;
    	}
    	#sub-category{
    		margin-left: 10px;
    	}
    </style>
</head>
<body>
    <div id="main">
    	<form name="myform" method="post">    		
			<div id="category">
				<!-- main카테고리 -->
				<div id="main-category">
					<select name="mainCategory" id="mc">
						<c:forEach var="mcVo" items="${mainCtgyVos}">
				  	  		<option value="${mcVo.name}">${mcVo.name}</option>
				  		</c:forEach>
				  	</select>
			  	</div>
			  	
			  	<!-- sub카테고리  -->
			  	<div id="sub-category" style="display: none;">
					<select name="subCategory" id="sc">
				  	</select>
				</div>
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