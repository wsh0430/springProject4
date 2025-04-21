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
    	
    	function likesCheck(part, idx) {
    		let icon = $(".like_icon i");
    		let count = $(".like_count");
    		
			$.ajax({
				url: "${ctp}/community/" + part + "LikesCheck",
				type: "post",
				data: {
					idx : idx,
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
    	.low-bar{
    		display: flex;
    		justify-content: space-between;
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
			<!-- right 공유/ -->
			<div class="low-bar">
				<div class="left">
					<button onclick="likesCheck('board', ${boardVo.idx})">
						<span class="like_icon">
							<c:if test="${empty boardLikesVo}">
								<i class="fa-regular fa-lg fa-heart"></i>
							</c:if>
							<c:if test="${!empty boardLikesVo }">
								<i class="fa-solid fa-lg fa-heart" style="color: red;"></i>
							</c:if>
							<br/>좋아요	
						</span>
						<span class="like_count">${boardVo.likeCount}</span>
					</button>
				</div>
				<div class="right">
					<span id="share">
						
					</span>
				</div>
			</div>
			<hr>
			<div id="comment">
				<div id="cmt_list">
					<c:if test="${!empty commentVos}">
						<c:forEach var="cmtVo" items="${commentVos}" varStatus="st">
							<div class="list">
								<span id="cmt_member">${cmtVo.memberNickname}</span>
								<span id="cmt_content">fn:replace(cmtVo.content, newLine, "<br/>")</span>
								<div class="low-bar">
									<div class="left">
										<span>답글 <b>${boardVo.commentCount}</b></span>
									</div>
									<div class="right">
										<button onclick="likesCheck('comment', ${cmtVo.idx})">
											<span class="like_icon">
												<c:if test="${empty commentLikesVo}">
													<i class="fa-regular fa-lg fa-heart"></i>
												</c:if>
												<c:if test="${!empty commentLikesVo}">
													<i class="fa-solid fa-lg fa-heart" style="color: red;"></i>
												</c:if>
												<br/>좋아요	
											</span>
											<span class="like_count">${boardVo.likeCount}</span>
										</button>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:if>
				</div>
				<div id="comment_input">
				
				</div>
			</div>
		</div>
	</div>
</body>
</html>