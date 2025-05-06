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
    	
    	$(document).ready(function () {
    	 	$('#copyLink').on('click', function (e) {
    		     e.preventDefault();
    		     const url = window.location.href;

    		     navigator.clipboard.writeText(url).then(function () {
    		        $('#copyMsg').fadeIn().delay(2000).fadeOut();
    		     }).catch(function (err) {
    		        alert('복사 실패: ' + err);
    		     });
    		});
    	});
    	
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
    		
    		let content = $("#reply_item"+idx);
    		
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
    	    const content = $(this).val();
    	    const $countSpan = $(this).siblings('.input').find('.count span');

    	    $countSpan.text(content.length);

    	    if (content.length > 200) {
    	        alert("최대 200자까지 입력 가능합니다.");
    	        const trimmed = content.substring(0, 200);
    	        $(this).val(trimmed);
    	        $countSpan.text(200);
    	    }
    	});
    	
    	
    	// 모달에 기타내용 입력창 보여주기
        function etcShow() {
        	$("#report-txt").show();
        }
        
        // 모달창에서 신고항목 선택후 '확인'버튼 클릭시 수행처리
        function reportCheck() {
        	if(!$("input[type=radio][name=claim]:checked").is(':checked')) {
        		alert("신고항목을 선택하세요");
        		return false;
        	}
        	if($("input[type=radio]:checked").val() == '기타' && $("#report-txt").val() == '') {
        		alert("기타 사유를 입력해 주세요");
        		return false;
        	}
        	
        	let reason = modalForm.claim.value;
        	if(reason == '기타') reason += '/' + $("#report-txt").val();
        	
        	let query = {
        			part   : 'board',
        			partIdx: ${boardVo.idx},
        			memberId  : '${sMemberId}',
        			reason: reason
        	}
        	
        	$.ajax({
        		url  : "${ctp}/community/boardReportInput",
        		type : "post",
        		data : query,
        		success:function(res) {
        			if(res != 0) {
        				alert("신고 되었습니다.");
        				location.reload();
        			}
        			else alert("이미 신고한 게시글입니다.");
        		},
        		error : function() { alert("신고 중 오류가 발생했습니다."); }
        	});
        }
    </script>
    <link rel="stylesheet" href="${ctp}/css/cmtyContent.css">
</head>
<body>
    <div id="main">
    	<span id="category">${boardVo.categoryName }</span>
		<div id="board">
			<h3>${boardVo.title }</h3>
			<div id="info">
				<div class="left">
					<span><i class="fa-solid fa-lg fa-circle-user"></i></span>
					|
					<span>${boardVo.memberNickname}</span>
					<span>
						<c:if test="${boardVo.createdAt == boardVo.updateAt}">${fn:substring(boardVo.createdAt,0,19)}</c:if>						
						<c:if test="${boardVo.createdAt != boardVo.updateAt}"> ${fn:substring(boardVo.updateAt,0,16)}(수정됨)</c:if>
					</span>
				</div>
				<div class="right">
					<span>조회 ${boardVo.viewCount}</span>
					<span>추천 ${boardVo.likeCount}</span>
					<span>댓글 ${boardVo.commentCount}</span>
				</div>
			</div>
			<div id="social-actions">
				<!-- 공유 -->
				<a href="#" id="copyLink" title="링크 복사">
  					<i class="fa-solid fa-lg fa-share-nodes"></i>
				</a>
				<div id="copyMsg">📋 링크가 복사되었습니다!</div>
				<!-- 신고 -->
				<a href="#" data-bs-toggle="modal" data-bs-target="#myModal"><i class="fa-solid fa-lg fa-triangle-exclamation"></i></a>	
			</div>
			<div id="cmty_content">
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
						<input type="button" value="목록" onclick="location.href='${ctp}/community/cmtyMain?category=${category}&pag=${pag}&pageSize=${pageSize}&search=${search}&searchString=${searchString}'">
					<c:if test="${sMemberId == boardVo.memberId}">
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
											<div class="reply_item" id="reply_item${replyVo.idx}">
												<c:if test="${replyVo.deleteCheck != 1}">
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
												</c:if>
												<c:if test="${replyVo.deleteCheck == 1}">
													<span style="line-height: 60px;">작성자에 의해 삭제된 댓글입니다.</span>
												</c:if>
											</div>
										</c:forEach>
									</c:if>
									<div class="reply_input">
										<c:if test="${sLevel < 3}">
												<span class="cmt_info-icon"><i class="fa-solid fa-lg fa-circle-user"></i></span>
												<span class="nickname">${sNickname}</span>
											<div class="text_box">
												<textarea name="reply_content${cmtSt.index}" id="reply_content${cmtSt.index}" placeholder="답글을 입력하세요." maxlength="200"></textarea>
												<div class="input">
													<div class="count"><span>0</span>/200</div>														
													<input type="button" value="등록" onclick="replyInput(${cmtVo.idx},${cmtSt.index})">
												</div>
											</div>
										</c:if>
										<c:if test="${sLevel >= 3}">
											<span>로그인 후 이용해주세요</span>
										</c:if>
									</div>
								</div>
							</c:if>
							<!-- 답글 끝 -->
							</c:forEach>
							<div class="cmt_input">
								<c:if test="${sLevel < 3}">
									<span class="cmt_info-icon"><i class="fa-solid fa-lg fa-circle-user"></i></span>
									<span class="nickname">${sNickname}</span>
									<div class="text_box">
										<textarea name="cmt_content" id="cmt_content" placeholder="답글을 입력하세요." maxlength="200"></textarea>
										<div class="input">
										  	<div class="count"><span>0</span>/200</div>
											<input type="button" value="등록" onclick="cmtInput()" oninput="autoRisize(this)">
										</div>
									</div>
								</c:if>
								<c:if test="${sLevel >= 3}">
									<span>로그인 후 이용해주세요</span>
								</c:if>
							</div>
						</div>
					</div>
				</div>
					
			
					<!-- The Modal -->
					<div class="modal fade" id="myModal">
					<div class="modal-dialog modal-dialog-centered">
			  		<div class="modal-content">
			    	<div class="modal-header">
			    		<h4>신고사유 선택</h4>
				        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			     	</div>
			      	<div class="modal-body">				   
				        <form name="modalForm">
				          <div><input type="radio" name="claim" id="claim1" value="광고,홍보,영리목적"/> 광고,홍보,영리목적</div>
				          <div><input type="radio" name="claim" id="claim2" value="욕설,비방,차별,혐오"/> 설,비방,차별,혐오</div>
				          <div><input type="radio" name="claim" id="claim3" value="불법정보"/> 불법정보</div>
				          <div><input type="radio" name="claim" id="claim4" value="음란,청소년유해"/> 음란,청소년유해</div>
				          <div><input type="radio" name="claim" id="claim5" value="개인정보노출,유포,거래"/> 개인정보노출,유포,거래</div>
				          <div><input type="radio" name="claim" id="claim6" value="도배,스팸"/> 도배,스팸</div>
				          <div><input type="radio" name="claim" id="claim7" value="기타" onclick="etcShow()"/> 기타</div>
				          <div id="etc"><textarea rows="2" id="report-txt" class="form-control" style="display:none"></textarea></div>
				          <hr class="border">
				          <input type="button" value="확인" onclick="reportCheck()" class="btn btn-success form-control" />
				        </form>
			      	</div>
			      	<div class="modal-footer">
			        	<button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
			    	</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>