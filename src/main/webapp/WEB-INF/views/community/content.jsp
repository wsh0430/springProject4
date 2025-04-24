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
				url: "${ctp}/community/likesCheck",
				type: "post",
				data: {
					idx : idx,
					part: part,
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
    	    let reply = $("#reply" + idx);
    		reply.toggle(); 
    	    
    	    /* if(reply.css("display") == "none"){
    	    	reply.show();
    	    }else{
    	    	reply.hide();
    	    } */
    	}
    	
    	function cmtInput() {
    		
			let content = $("#cmt_content").val();
			if(content.trim() == "") {
	    		alert("댓글을 입력하세요");
	    		$("#cmt_content").focus();
	    		return false;
	    	}
			
			
			let query ={
					boardId: ${boardVo.idx},
					memberId: '${sMemberId}',
					memberNickname : '${sNickname}',
					content : content
			}
			
			$.ajax({
				url: "${ctp}/community/cmtInput",
				type: "post",
				data : query,
				success:function(res){
					if(res != 0){
						alert("댓글이 입력되었습니다.");
	    				location.reload();
					}
					else alert("잠시 후 다시 시도해주세요.");
				},
				error: function() {
					alert("전송오류");
				}	
			});
			
		}
    	
    	function replyInput(parentId, index) {
    		
			let content = $("#reply_content"+index).val();
			if(content.trim() == "") {
	    		alert("댓글을 입력하세요");
	    		$("#reply_content"+index).focus();
	    		return false;
	    	}
			
			
			let query ={
					boardId: ${boardVo.idx},
					memberId: '${sMemberId}',
					memberNickname : '${sNickname}',
					content : content,
					parentId : parentId
			}
			
			$.ajax({
				url: "${ctp}/community/replyInput",
				type: "post",
				data : query,
				success:function(res){
					if(res != 0){
						alert("답글이 입력되었습니다.");
	    				location.reload();
					}
					else alert("잠시 후 다시 시도해주세요.");
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
    		padding: 10px 20px;
    	}
    	.cmt_info{
    		margin-bottom: 8px;
    	}
    	.cmt_content{
    		margin-bottom: 8px;
    	}
    	
    	.reply{
    	   	background-color: rgb(240, 240, 240);
    	   	display: none;
    	}
    	.reply_item{
    	    max-height: 130px;
    		margin: 0px 30px 0px 30px;
    		padding: 17px 0px;
    	}
    	.reply_item:nth-child(n+2){
    		border-top: 1px solid black; 		
    	}
    	.reply_info{
    		margin-bottom: 8px;
    	}
    	.reply_content{
    		/* margin-bottom: 8px; */
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
										<button onclick="replyClick(${cmtVo.idx})">답글 <b>${cmtVo.replyCount}</b></button>								
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
							</div>
								<!-- 답글  -->
								<div class="reply" id="reply${cmtSt.count}">
												<c:if test="${!empty replyList[cmtSt.index]}">
													<c:forEach var="replyVo" items="${replyList[cmtSt.index]}" varStatus="resplySt">
														<div class="reply_item">
															<div class="cmt_info">
																<span class="cmt_info-icon"><i class="fa-solid fa-lg fa-circle-user"></i></span>
																<span class="cmt_info-nickname">${replyVo.memberNickname}</span>
																<span class="cmt_info-time">
																	<c:if test="${replyVo.createdAt == replyVo.updateAt}">${fn:substring(replyVo.createdAt,0,19)}</c:if>						
																	<c:if test="${replyVo.createdAt != replyVo.updateAt}"> ${fn:substring(replyVo.updateAt,0,16)}(수정됨)</c:if>
																</span>
															</div>
															<div class="reply_content">${fn:replace(replyVo.content, newLine, "<br/>")}</div>
															<div class="low-bar">
																<div class="left"></div>
																<div class="right">
																	<!-- 좋아요 -->
																	<div class="like">
																		<button onclick="likesCheck('reply', ${replyVo.idx}, '${replySt.index}', ${cmtSt.index})">
																			<span class="reply-like_icon${resplySt.index}">
																				<c:if test="${empty replyLikesVos[replySt.index]}">
																					<i class="fa-regular fa-lg fa-heart"></i>
																				</c:if>
																				<c:if test="${!empty replyLikesVos[replySt.index]}">
																					<i class="fa-solid fa-lg fa-heart" style="color: red;"></i>
																				</c:if>
																			</span>
																			<span class="reply-like_count${resplySt.index}" >${replyVo.likeCount}</span>
																		</button>
																	</div>
																	<!-- 좋아요 끝 -->
																</div>
															</div>
														</div>
													</c:forEach>
												</c:if>
												<div class="reply_input">
													<form name="replyInputForm">
														<textarea name="reply_content${cmtSt.index}" id="reply_content${cmtSt.index}" placeholder="답글을 입력하세요."></textarea>
														<span>${sNickname}</span>
														<input type="button" placeholder="등록" onclick="replyInput(${cmtSt.count},${cmtSt.index})">
													</form>
												</div>
										</div>
								<!-- 답글 끝 -->
						</c:forEach>
						<div class="cmt_input">
							<form name="cmtInputForm">
								<textarea name="cmt_content" id="cmt_content" placeholder="답글을 입력하세요."></textarea>
								<span>${sNickname}</span>
								<input type="button" placeholder="등록" onclick="cmtInput()">
							</form>
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</body>
</html>