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
    <script>
    	'use strict';
    	
    	function boardDeleteCheck() {
			if(confirm("정말 게시글을 삭제하시겠습니까?"))
				location.href = "${ctp}/community/cmtyBoardDeleteCheck?boardIdx=${boardVo.idx}&category=${category}&pag=${pag}&pageSize=${pageSize}&search=${search}&searchString=${searchString}";
		}
    	
    	// 좋아요 체크
    	function likesCheck(part, target, idx, index, parent, parentIdx) {
    		let icon = $(target).find("."+part+"-like_icon"+index+" i");
    		let count = $(target).find("."+part+"-like_count" + index);
    		//let icon = $("."+part+"-like_icon"+index+" i");
    		//let count = $("."+part+"-like_count" + index);
    		
    		console.log(index);
    		
			$.ajax({
				url: "${ctp}/community/likesCheck",
				type: "post",
				data: {
					idx : idx,
					part: part,
					parent: parent,
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
    	
    	// 답글 열기
    	function replyClick(idx) {
    	    let reply = $("#reply" + idx);
    		reply.toggle(); 
    	    
    	    /* if(reply.css("display") == "none"){
    	    	reply.show();
    	    }else{
    	    	reply.hide();
    	    } */
    	}
    	
    	function cmtUpdateCancel(part, idx) {
			let content = $("#"+part+"_content"+idx);
			let span = content.find(".span");
			let input = content.find(".text_box");
			let textarea = input.find("textarea");
			let cancel = $("#"+part+"_item"+idx).find(".cancel");
			
			textarea.val(span.text());
			
			span.show();
			input.hide();
			cancel.hide();
		}
    	
    	//댓글 수정버튼 클릭(수정창 열기)
    	function cmtUpdateBtnClick(part, idx) {
			let content = $("#"+part+"_content"+idx);
			let span = content.find(".span");
			let input = content.find(".text_box");
			let textarea = input.find("textarea");
			let cancel = $("#"+part+"_item"+idx).find(".cancel");
			
			if(span.css("display") != "none"){
				span.hide();
				input.show();
				cancel.show();
				
				const contentVal = textarea.val();
				  const countSpan = textarea.siblings('.count').find('span');
				countSpan.text(contentVal.length);
    	    }else{	
    	    	cmtUpdate(part, idx);
    	    } 
		}
    	
    	//댓글 수정
    	function cmtUpdate(part, idx) {
			let span = $("#"+part+"_content"+idx).find(".span");
			let input = $("#"+part+"_content"+idx).find(".text_box");
			let textarea = input.find("textarea");
			let cancel = $("#"+part+"_item"+idx).find(".cancel");
			
    		if(textarea.val().trim() == "") {
	    		alert("댓글을 입력하세요");
	    		return false;
	    	}
    		
			$. ajax({
				url: "${ctp}/community/"+part+"Update",
				type: "post",
				data: {
					idx: idx,
					content: textarea.val()
				},
				success:function(res){
					if(res != 0){
						if(confirm("댓글을 수정하시겠습니까?")){			
							span.show();
							input.hide();
							cancel.hide();
							
							span.text(textarea.val());
						}
					}
					else alert("잠시 후 다시 시도해주세요.");			
				},
				error: function() {
					alert("전송오류");
				}	
			});
		}
    	
    	//댓글 삭제
    	function cmtDeleteCheck(idx) {
    		if(!confirm("정말 댓글을 삭제하시겠습니까?")) {
	    		return false;
	    	}
    		
    		let content = $("#cmt_item"+idx);
    		
    		$.ajax({
				url: "${ctp}/community/cmtDeleteCheck",
				type: "post",
				data: {
					idx: idx
				},
				success:function(res){
					if(res != 0){
						alert("댓글이 삭제되었습니다.");
						
						let string = '<span style="line-height: 60px;">작성자에 의해 삭제된 댓글입니다.</span>';
						content.html(string);
						
						$("#reply"+idx).html("");
					}
					else alert("잠시 후 다시 시도해주세요.");
				},
				error: function() {
					alert("전송오류");
				}	
			});
		}
    	
    	//답글 삭제
    	function replyDeleteCheck(idx, parentId) {
    		if(!confirm("정말 댓글을 삭제하시겠습니까?")) {
	    		return false;
	    	}
    		
    		let content = $("#reply_item"+parentId);
    		
    		$.ajax({
				url: "${ctp}/community/replyDeleteCheck",
				type: "post",
				data: {
					idx: idx
				},
				success:function(res){
					if(res != 0){
						alert("댓글이 삭제되었습니다.");
						
						let string = '<span style="line-height: 60px;">작성자에 의해 삭제된 댓글입니다.</span>';
						content.html(string);
					}
					else alert("잠시 후 다시 시도해주세요.");
				},
				error: function() {
					alert("전송오류");
				}	
			});
		}
    	
    	// 댓글 입력
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
    	
    	// 답글 입력
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
    	
    
    	
    	$(document).on('keyup', '.text_box textarea', function () {
	    	$('.text_box textarea').keyup(function(){
	    		const content = $(this).val();
	    		const $countSpan = $(this).siblings('.count').find('span');

	    		  $countSpan.text(content.length);
	    		  
	    		  if (content.length > 200){
	    		    alert("최대 200자까지 입력 가능합니다.");
	    		    $(this).val(content.substring(0, 200));
	    		    $('.text_box .count span').html(200);
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

    	.low-bar, .high-bar{
    		display: flex;
    		justify-content: space-between;
    	}
    	.low-bar span{
    		text-align: center;
    	}
    	
    	#comment{
    	    border-top: 1px solid black;   
    	    margin-top: 10px;
    	}
    	.cmt_item{
    	    width: 100%;
    		border-bottom: 1px solid black; 		
    		padding: 10px 20px;
    		min-height: 60px;
    	}
    	.cmt_info{
    		margin-bottom: 12px;
    	}
    	.cmt_input{
    		margin-top: 12px;
    	}
    	.cmt_content{
    		margin-bottom: 12px;
    	}
    	.cmt_content textarea{
    		border: 1px solid black;
    		border-radius: 15px;
    		width: 100%;
    		height: 95px;
    		padding: 5px 8px;    		
    	}
    	
    	.reply{
    	   	background-color: rgb(240, 240, 240);
    	   	display: none;
    	}
    	.reply_item{
    		margin: 0px 30px;
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
    	.reply_content textarea{
    		border: 1px solid black;
    		border-radius: 15px;
    		width: 100%;
    		height: 75px;
    		padding: 5px 8px;    		
    	}
    	.reply_input{
    		    padding: 20px 10px;
    			border-top: 1px solid black;
    			margin-top: 20px;
    	}
    	.reply_input .text_box{
    		margin-top: 5px;
    	}  	
    	.text_box .input{
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
				
					<!-- 좋아요 -->
					<div class="like">
						<button onclick="likesCheck('board', this, ${boardVo.idx}, '', '', 0)">
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
					<c:if test="${sMemberId == boardVo.memberId}">
						<input type="button" value="목록" onclick="location.href='${ctp}/community/cmtyMain?category=${category}&pag=${pag}&pageSize=${pageSize}&search=${search}&searchString=${searchString}'">
						<input type="button" value="수정" onclick="location.href='${ctp}/community/cmtyBoardUpdate?boardIdx=${boardVo.idx}&category=${category}&pag=${pag}&pageSize=${pageSize}&search=${search}&searchString=${searchString}'">
						<input type="button" value="삭제" onclick="boardDeleteCheck()">
					</c:if>
				</div>
			</div>
			<div id="comment">
				<div id="cmt_list">
						<c:forEach var="cmtVo" items="${commentVos}" varStatus="cmtSt">
						<c:if test="${!empty commentVos}">
							<div class="cmt_item" id="cmt_item${cmtVo.idx}">
							<c:if test="${cmtVo.deleteCheck != 1}">
								<div class="high-bar">
									<div class="left">
										<div class="cmt_info">
											<span class="cmt_info-icon"><i class="fa-solid fa-lg fa-circle-user"></i></span>
											<span class="cmt_info-nickname">${cmtVo.memberNickname}</span>
											<span class="cmt_info-time">
												<c:if test="${cmtVo.createdAt == cmtVo.updateAt}">${fn:substring(cmtVo.createdAt,0,19)}</c:if>						
												<c:if test="${cmtVo.createdAt != cmtVo.updateAt}"> ${fn:substring(cmtVo.updateAt,0,16)}(수정됨)</c:if>
											</span>
										</div>
									</div>
									<div class="right">
										<c:if test="${sMemberId == cmtVo.memberId}">
											<button onclick="cmtUpdateBtnClick('cmt',${cmtVo.idx})">수정</button>								
											<button class="cancel" onclick="cmtUpdateCancel('cmt',${cmtVo.idx})" style="display:none;">취소</button>								
											<button onclick="cmtDeleteCheck(${cmtVo.idx})">삭제</button>	
										</c:if>
									</div>
								</div>
								<div class="cmt_content" id="cmt_content${cmtVo.idx}">
									<span class="span">${fn:replace(cmtVo.content, newLine, "<br/>")}</span>
									<div class="text_box" style="display:none;">
										<textarea  maxlength="200">${cmtVo.content}</textarea>
										<div class="count"><span>0</span>/200</div>
									</div>
								</div>
								<div class="low-bar">
									<div class="left">						
										<button onclick="replyClick(${cmtVo.idx})">답글 <b>${cmtVo.replyCount}</b></button>								
									</div>
									<div class="right">
									
										<!-- 좋아요 -->
										<div class="like">
											<button onclick="likesCheck('comment', this, ${cmtVo.idx}, '${cmtSt.index}', 'board', ${boardVo.idx})">
												<span class="comment-like_icon${cmtSt.index}">
														<c:if test="${empty cmtLikesVos[cmtVo.idx]}">
															<i class="fa-regular fa-lg fa-heart"></i>
														</c:if>
														<c:if test="${!empty cmtLikesVos[cmtVo.idx]}">
															<i class="fa-solid fa-lg fa-heart" style="color: red;"></i>
														</c:if>
												</span>
												<span class="comment-like_count${cmtSt.index}" >${cmtVo.likeCount}</span>
											</button>
										</div>
										<!-- 좋아요 끝 -->
										
									</div>
								</div>				
							</c:if>
							<c:if test="${cmtVo.deleteCheck == 1}">
								<span style="line-height: 60px;">작성자에 의해 삭제된 댓글입니다.</span>
							</c:if>
							</div>
								<!-- 답글  -->
								<div class="reply" id="reply${cmtVo.idx}">
												<c:if test="${!empty replyList[cmtSt.index]}">
													<c:forEach var="replyVo" items="${replyList[cmtSt.index]}" varStatus="replySt">
														<div class="reply_item" id="reply_item${cmtVo.idx}">
															<div class="cmt_info">
																<div class="high-bar">
																	<div class="left">
																		<span class="cmt_info-icon"><i class="fa-solid fa-lg fa-circle-user"></i></span>
																		<span class="cmt_info-nickname">${replyVo.memberNickname}</span>
																		<span class="cmt_info-time">
																			<c:if test="${replyVo.createdAt == replyVo.updateAt}">${fn:substring(replyVo.createdAt,0,19)}</c:if>						
																			<c:if test="${replyVo.createdAt != replyVo.updateAt}"> ${fn:substring(replyVo.updateAt,0,16)}(수정됨)</c:if>
																		</span>
																	</div>
																	<div class="right">
																		<c:if test="${sMemberId == replyVo.memberId}">
																			<button onclick="cmtUpdateBtnClick('reply',${replyVo.idx})">수정</button>								
																			<button class="cancel" onclick="cmtUpdateCancel('reply',${replyVo.idx})" style="display:none;">취소</button>								
																			<button onclick="replyDeleteCheck(${replyVo.idx}, ${replyVo.parentId})">삭제</button>	
																		</c:if>
																	</div>																
																</div>
															</div>
															<div class="reply_content" id="reply_content${replyVo.idx}">
																<span class="span">${fn:replace(replyVo.content, newLine, "<br/>")}</span>
																<div class="text_box" style="display:none;">
																	<textarea maxlength="150">${replyVo.content}</textarea>
																  	<div class="count"><span>0</span>/200</div>
																</div>	
															</div>
															<div class="low-bar">
																<div class="left"></div>
																<div class="right">
																	<!-- 좋아요 -->
																	<div class="like">
																		<button onclick="likesCheck('reply', this, ${replyVo.idx}, '${replySt.index}', 'comment', ${cmtVo.idx})">
																			<span class="reply-like_icon${replySt.index}">
																				<c:if test="${empty (replyLikesList[cmtSt.index])[replyVo.idx]}">
																					<i class="fa-regular fa-lg fa-heart"></i>
																				</c:if>
																				<c:if test="${!empty (replyLikesList[cmtSt.index])[replyVo.idx]}">
																					<i class="fa-solid fa-lg fa-heart" style="color: red;"></i>
																				</c:if>
																			</span>
																			<span class="reply-like_count${replySt.index}" >${replyVo.likeCount}</span>
																		</button>
																	</div>
																	<!-- 좋아요 끝 -->
																</div>
															</div>
														</div>
													</c:forEach>
												</c:if>
												<div class="reply_input">
													<span class="nickname">${sNickname}</span>
													<div class="text_box">
														<textarea name="reply_content${cmtSt.index}" id="reply_content${cmtSt.index}" placeholder="답글을 입력하세요." maxlength="150"></textarea>
														<div class="input">
															<div class="count"><span>0</span>/200</div>														
															<input type="button" value="등록" onclick="replyInput(${cmtVo.idx},${cmtSt.index})">
														</div>
													</div>
												</div>
										</div>
								</c:if>
								<!-- 답글 끝 -->
						</c:forEach>
						<div class="cmt_input">
							<span class="nickname">${sNickname}</span>
							<div class="text_box">
								<textarea name="cmt_content" id="cmt_content" placeholder="답글을 입력하세요." maxlength="200"></textarea>
								<div class="input">
								  	<div class="count"><span>0</span>/200</div>
									<input type="button" value="등록" onclick="cmtInput()" oninput="autoRisize(this)">
								</div>
							</div>
						</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>