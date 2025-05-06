<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ad_lr.jsp</title>
    <style>
    	textarea{
    		resize: none;
    	}
    
	   	.ad img{
	   		width: 100%;
	   		height: 100%;
	   	}
	   	
	   	.ad_side{
	   		min-width: 150px;
	   		height: 300px;
	   		margin: 200px 0px 0px 15px;
	   	}
	   	.ad_content{
	   		width: 100%;
	   		height: 100%;
	   	}
	   	.ad .ad_content{
	   		position: relative;
	   	}
	   	
	   	.close-btn {
		    font-size: 10px;
		    cursor: pointer;
		    position: absolute;
  			right: 0px;
	  	}
	
		.ad_survey_modal {
		  	display: none;
		  	z-index: 9999;
		}
		
		.ad_close-window{
			display: none;
			height: 100%;
			background-color: lightgray;
			align-items: center;   
  			justify-content: center; 
  			padding: 5px;
		}	
		
		.submitSurvey-box{
			text-align: right;
		}	
    </style>
     <link rel="stylesheet" href="${ctp}/css/ad_lr.css">
</head>
<body>
	<div id="ad_sl" class="ad_side ad">
		<div class="hide-bar">
			<c:forEach var="adVo" items="${adVos}">
				<c:if test="${adVo.position == 'side-left'}">
					<input type="hidden" class="ad_image" value="${adVo.imageUrl}">
					<input type="hidden" class="ad_link" value="${adVo.linkUrl}">
					<input type="hidden" class="ad_title" value="${adVo.title}">
					<input type="hidden" class="ad_idx" value="${adVo.idx}">
				</c:if>
			</c:forEach>
		</div>
	
	
		<div class="ad_content">
			<span>
			</span>			
			<button class="close-btn" style="display: none;"><i class="fa-solid fa-sm fa-xmark"></i></button>
		</div>

		
		<div class="ad_survey_modal">
			 <p style="margin-bottom: 8px;">이 광고가 마음에 들지 않는 이유는?</p>
			 <label><input type="radio" name="reason" value="irrelevant"> 관련 없음</label>
			 <label><input type="radio" name="reason" value="seen-often"> 자주 봄</label>
			 <label><input type="radio" name="reason" value="offensive"> 불쾌함</label>
			 <div><input type="radio" name="reason" value="etc" onclick="etcShow()"/> 기타</div>
			 <div class="etc"><textarea rows="2" class="etc-txt form-control" style="display:none"></textarea></div>
			 <div class="submitSurvey-box"><button class="submitSurvey">제출</button></div>
		</div>
		
		<div class="ad_close-window">		
			<span>더이상 광고가 표시되지 않습니다</span>
		</div>
	</div>
</body>
</html>