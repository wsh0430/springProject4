<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hitbox</title>
    <jsp:include page="/WEB-INF/views/include/bs5.jsp" />
    <script src="https://kit.fontawesome.com/376bb82e0c.js" crossorigin="anonymous"></script>
    <script>
    	'use strict';
    	
    	function boardLikesCheck() {
    		let icon = $(".like_icon i");
    		let count = $(".like_count");
    		
			$.ajax({
				url: "${ctp}/community/boardLikesCheck",
				type: "post",
				data: {
					boardIdx : ${boardVo.idx},
				},
				success: function(res){
					//lc.text(Number(lc.text()) + res);
					if (icon.hasClass("fa-regular")) 
						icon.removeClass("fa-regular").addClass("fa-solid").css("color", "red");
					else 
						icon.removeClass("fa-solid").addClass("fa-regular").css("color", "black");
					
					count.text(Number(count.text()) + res);
				},
				error: function() {
					alert("전송오류");
				}
			});
		}
    </script>
    <style>
    	#main{
    		min-width: 80%; 	
    		margin-top: 30px;	
    	}	
    	
    	#info{
    		display: flex;
    		justify-content: space-between;
    	}
    	
    	.right span{
    		margin-right: 5px;
    	}
    	
    	#content{
    		min-height: 250px;
    	}
    	
    	#like button{
    		width: 70px;
    		height: 70px;
    		background-color: white;
    		border: none;
    	}
    	#like button i{
    		color: red;
    	}
    </style>
</head>
<body>
    <div id="main">
    	<span id="category"></span>
		<div id="board">
			<h3>${boardVo.title }</h3>
			<div id="info">
				<div class="left">
					<span>Icon</span>
					|
					<span>${boardVo.memberNickname}</span>
					<span>
						<c:if test="${boardVo.createdAt == boardVo.updateAt}">${fn:substring(boardVo.createdAt,0,19)}</c:if>						
						<c:if test="${boardVo.createdAt != boardVo.updateAt}"> ${fn:substring(boardVo.updateAt,0,16)}(수정됨)</c:if>
					</span>
				</div>
				<div class="right">
					<span>조회${boardVo.viewCount}</span>
					<span>추천${boardVo.likeCount}</span>
					<span>댓글${boardVo.commentCount}</span>
				</div>
			</div>
			<hr />
			<div id="content">
				${fn:replace(boardVo.content, newLine, "<br/>")}
			</div>
			<div id="like">
				<button onclick="boardLikesCheck()">
					<span class="like_icon">
						<c:if test="${empty likesVo}">
							<i class="fa-regular fa-lg fa-heart"></i>
						</c:if>
						<c:if test="${!empty likesVo }">
							<i class="fa-solid fa-lg fa-heart" style="color: red;"></i>
						</c:if>
						<br/>좋아요	
					</span>
					<span class="like_count">${boardVo.likeCount}</span>
				</button>
			</div>
		</div>
	</div>
</body>
</html>