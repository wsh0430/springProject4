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
    	
    	function likesCheck(part, idx, index, parentIdx) {
    		let icon = $("."+part+"-like_icon"+index+" i");
    		let count = $("."+part+"-like_count" + index);
    		
    		console.log(index);
    		
			$.ajax({
				url: "${ctp}/community/" + part + "LikesCheck",
				type: "post",
				data: {
					idx : idx,
					parentIdx: parentIdx
				},
				success: function(res){
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
    	
    	function replyClick(idx) {
			$.ajax({
				url: "${ctp}/commynity/replyClick",
				type: "post",
				data: {idx: idx},
				success: function(res) {
					
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
    	
    	.like button{
    		background-color: transparent;
    		border: none;
    	}

    	.low-bar{
    		display: flex;
    		justify-content: space-between;
    	}
    	.low-bar span{
    		text-align: center;
    	}
    	
    	#comment{
    	    border-top: 1px solid black;   
    	    margin-top: 10px;
    	   	padding-top: 10px;
    	}
    	.cmt_item{
    	    width: 100%;
    	    max-height: 130px;
    		border-bottom: 1px solid black; 		
    		padding: 10px;
    	}
    	.cmt_info{
    		margin-bottom: 8px;
    	}
    	.cmt_content{
    		margin-bottom: 8px;
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
				
					<!-- 좋아요 -->
					<div class="like">
						<button onclick="likesCheck('board', ${boardVo.idx}, '', 0)">
							<span class="board-like_icon">
								<c:if test="${empty boardLikesVo}">
									<i class="fa-regular fa-lg fa-heart"></i>
								</c:if>
								<c:if test="${!empty boardLikesVo }">
									<i class="fa-solid fa-lg fa-heart" style="color: red;"></i>
								</c:if>
							</span>
							<span class="board-like_count">${boardVo.likeCount}</span>
						</button>
					</div>
					<!-- 좋아요 끝 -->
					
				</div>
				<div class="right">
					<span id="share">
						
					</span>
				</div>
			</div>
			<div id="comment">
				<div id="cmt_list">
					<c:if test="${!empty commentVos}">
						<c:forEach var="cmtVo" items="${commentVos}" varStatus="cmtSt">
							<div class="cmt_item">
								<div class="cmt_info">
									<span class="cmt_info-icon"><i class="fa-solid fa-lg fa-circle-user"></i></span>
									<span class="cmt_info-nickname">${cmtVo.memberNickname}</span>
									<span class="cmt_info-time">
										<c:if test="${cmtVo.createdAt == cmtVo.updateAt}">${fn:substring(cmtVo.createdAt,0,19)}</c:if>						
										<c:if test="${cmtVo.createdAt != cmtVo.updateAt}"> ${fn:substring(cmtVo.updateAt,0,16)}(수정됨)</c:if>
									</span>
								</div>
								<div class="cmt_content">${fn:replace(cmtVo.content, newLine, "<br/>")}</div>
								<div class="low-bar">
									<div class="left">						
										<button onclick="replyClick(${cmtVo.idx})">답글 <b>${boardVo.commentCount}</b></button>								
									</div>
									<div class="right">
									
										<!-- 좋아요 -->
										<div class="like">
											<button onclick="likesCheck('comment', ${cmtVo.idx}, '${cmtSt.index}', ${boardVo.idx})">
												<span class="comment-like_icon${cmtSt.index}">
														<c:if test="${empty cmtLikesVos[cmtSt.index]}">
															<i class="fa-regular fa-lg fa-heart"></i>
														</c:if>
														<c:if test="${!empty cmtLikesVos[cmtSt.index]}">
															<i class="fa-solid fa-lg fa-heart" style="color: red;"></i>
														</c:if>
												</span>
												<span class="comment-like_count${cmtSt.index}" >${cmtVo.likeCount}</span>
											</button>
										</div>
										<!-- 좋아요 끝 -->
										
									</div>
								</div>
								
								<!-- 답글  -->
								<div class="reply">
											<c:forEach var="replyVos" items="${replyList}" varStatus="resplySt">
												<c:if test="${!empty replyVos}">
													<c:forEach var="replyVo" items="${replyVos[st.index]}">
														<div class="reply_item">
															<div class="cmt_info">
																<span class="cmt_info-icon"><i class="fa-solid fa-lg fa-circle-user"></i></span>
																<span class="cmt_info-nickname">${replyVo.memberNickname}</span>
																<span class="cmt_info-time">
																	<c:if test="${replyVo.createdAt == replyVo.updateAt}">${fn:substring(replyVo.createdAt,0,19)}</c:if>						
																	<c:if test="${replyVo.createdAt != replyVo.updateAt}"> ${fn:substring(replyVo.updateAt,0,16)}(수정됨)</c:if>
																</span>
															</div>
															<div class="cmt_content">${fn:replace(replyVo.content, newLine, "<br/>")}</div>
															<div class="low-bar">
																<div class="reply-like">
																	<!-- 좋아요 -->
																	<div class="like">
																		<button onclick="likesCheck('comment', ${cmtVo.idx}, '${resplySt.index}', ${cmtSt.index})">
																			<span class="comment-like_icon${resplySt.index}">
																				<c:if test="${empty cmtLikesVos[cmtSt.index]}">
																					<i class="fa-regular fa-lg fa-heart"></i>
																				</c:if>
																				<c:if test="${!empty cmtLikesVos[cmtSt.index]}">
																					<i class="fa-solid fa-lg fa-heart" style="color: red;"></i>
																				</c:if>
																			</span>
																			<span class="comment-like_count${resplySt.index}" >${boardVo.likeCount}</span>
																		</button>
																	</div>
																	<!-- 좋아요 끝 -->
																</div>
															</div>
														</div>
													</c:forEach>
												</c:if>
											</c:forEach>
										</div>
										<!-- 답글 끝 -->
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