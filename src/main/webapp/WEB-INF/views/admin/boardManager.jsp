<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HitBox 게시글 관리</title>
    <jsp:include page="/WEB-INF/views/include/bs5.jsp" />
    <script>
	    $(function() {
	    	function toggleButton() {
	          const hasChecked = $('.bl_checkbox:checked').length > 0;
	          $('#b_hide-all-button').toggle(hasChecked);
	          $('#b_show-all-button').toggle(hasChecked);
	          $('#b_delete-all-button').toggle(hasChecked);
	        }
	    	$('.bl_checkbox').on('change', toggleButton);
	    	
	    	
	        // 전체 선택 클릭 시, 개별 체크박스 전부 체크/해제
	        $('#select-all').on('change', function() {
	          $('.bl_checkbox').prop('checked', this.checked);
	          toggleButton();
	        });
	
	        // 개별 체크박스 변경 시 전체 선택 상태 동기화
	        $('.bl_checkbox').on('change', function() {
	          const allChecked = $('.bl_checkbox').length === $('.bl_checkbox:checked').length;
	          $('#select-all').prop('checked', allChecked);
	        });	
	        
          	toggleButton();
	     });
	    
	    $(document).ready(function() {
	    	 $('#sb_mc').change(function() {
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
    	        			$('#sb_sub-category').show();
    	        		else
    	        			$('#sb_sub-category').hide();
    	        			
    	        		res.forEach(function(item) {
    	        			string += '<option value="'+item.name+'">'+item.name+'</option>';
    	        		});

    	        		
    	        		$('#sb_sc').html(string);
	    	        	
	    	        },
	    	        error: function(xhr, status, error) {
	    	          $('#sb_sub-category').html('<p>오류가 발생했습니다.</p>');
	    	        }
	    	      });
	    	    } else {
	    	      $('#sb_sub-category').empty(); // 선택이 비워지면 div도 초기화
	    	      $('#sb_sub-category').hide();
	    	    }
	    	  });
	    	});
	    
	    function deleteBoard(title, idx) {
			if(!confirm("게시글("+title+")을 정말 삭제하시겠습니까?"))
				return false;
			
			$.ajax({
				url: '${ctp}/admin/deleteBoard',  
    	        type: 'post',
    	        data: { idx: idx },
    	        success:function(res){
    	        	if(res == 1){
    	        		alert("게시글("+title+")이 삭제되었습니다.");
    	        		location.reload();
    	        	}
    	        	else{ alert("잠시 후 다시 시도해주세요."); }
    	        },
    	        error: function() {
					alert("게시글 삭제 중 오류가 발생하였습니다.");
				}
			});
		}
	    
	    function deleteCheckedAllBoard() {
			if(!confirm("선택된 게시글을 정말 삭제하시겠습니까?"))
				return false;
			

	    	$('input[type="checkbox"]:checked').not('#select-all').each(function(){
	    		let idx = $(this).attr('id');
				$.ajax({
					url: '${ctp}/admin/deleteBoard',  
	    	        type: 'post',
	    	        data: { idx: idx },
	    	        success:function(res){
	    	        	if(res == 1){
	    	        		alert(""+idx+"번 게시글이 삭제되었습니다.");
	    	        		location.reload();
	    	        	}
	    	        	else{ alert("잠시 후 다시 시도해주세요."); }
	    	        },
	    	        error: function() {
						alert("게시글 삭제 중 오류가 발생하였습니다.");
					}
				});
	    	});
		}
	    
	    function updateToggleBoard(title, idx) {	    	
	    	let div = $("#bi_toggle-button"+idx);
	    	let stats = $("#bi_stats"+idx);
	    	
	    	
	    	$.ajax({
	    		url: '${ctp}/admin/updateToggleBoard',  
    	        type: 'post',
    	        data: { idx: idx },
    	        success:function(res){
    	        	if(res == 1){
    	        		// 숨겨짐 처리 == 버튼은 보이기로 바뀜
    	        		div.html('<input type="button" id="bi_show-button'+idx+'" value="보이기" onclick="updateToggleBoard(\''+title+'\', '+idx+')">');	        		
    	        		if(!stats.text().includes("숨겨짐"))
    	        			stats.text("숨겨짐 "+ stats.text());
    	        		else
    	        			stats.text(stats.text());
    	        	}
    	        	else if(res == 0){
    	        		// 숨겨짐 처리 == 버튼은 숨겨짐으로 바뀜
    	        		div.html('<input type="button" id="bi_show-button'+idx+'" value="숨김" onclick="updateToggleBoard(\''+title+'\', '+idx+')">');	        		
    	        		if(stats.text().includes("숨겨짐")){
    	        			if(stats.text().includes("신고됨"))
    	        				stats.text("신고됨");
    	        			else if(!stats.text().includes("신고됨"))
    	        				stats.text("");
    	        		}
    	        	}
    	        	else{ alert("잠시 후 다시 시도해주세요."); }
    	        },
    	        error: function() {
					alert("게시글 토글 중 오류가 발생하였습니다.");
				}
	    	});
		}
	    
	    function updateToggleAllBoard(part) {	    	
	    	let div = $("#bi_toggle-button");
	    	
	    	$('input[type="checkbox"]:checked').not('#select-all').each(function(){
	    		let idx = $(this).attr('id');
		    	$.ajax({
		    		url: '${ctp}/admin/updateToggleBoard',  
	    	        type: 'post',
	    	        data: { 
	    	        	idx: idx,
	    	        	part: part
	    	        },
	    	        success:function(res){
	    	        	if(res == 1){
	    	        		let stats = $("#bi_stats"+idx);
	    	        		
		    	        	if(part == 'hide'){
		    	        		// 숨겨짐 처리 == 버튼은 보이기로 바뀜
		    	        		div.html('<input type="button" id="bi_show-button'+idx+'" value="보이기" onclick="updateToggleBoard(\''+title+'\', '+idx+')">');	        		
		    	        		if(!stats.text().includes("숨겨짐"))
		    	        			stats.text("숨겨짐 "+ stats.text());
		    	        	}
		    	        	else if(part == 'show'){
		    	        		// 숨겨짐 처리 == 버튼은 숨겨짐으로 바뀜
		    	        		div.html('<input type="button" id="bi_hide-button'+idx+'" value="숨김" onclick="updateToggleBoard(\''+title+'\', '+idx+')">');	        		
		    	        		if(stats.text().includes("숨겨짐")){
		    	        			if(stats.text().includes("신고됨"))
		    	        				stats.text("신고됨");
		    	        			else if(!stats.text().includes("신고됨"))
		    	        				stats.text("");
		    	        		}
		    	        	}
	    	        	}
	    	        	else{ alert("잠시 후 다시 시도해주세요."); }
	    	        },
	    	        error: function() {
						alert("게시글 토글 중 오류가 발생하였습니다.");
					}
		    	});
	    	});
		}
    </script>
    <style>
    	#view_type-bar{
    		width: 100%;
    		height: 60px;
    	}
    	#board-list{
    		width: 100%;
    		text-align: center;
    	}
    	#board-list tr:not(:first-of-type) td:nth-of-type(3) {
    		text-align: left;	
    		margin-left: 10px;
    	}
    	
    	#board-bar{
    		display: flex;
    		justify-content: space-between;
    	}
    	#br_control-panel{
    		margin-right: 10px;
    	}
    	#sb_category{
    		display: flex;
    	}
    	#sb_main-category{
    		margin-right: 10px;
    	}
    	.bi_btn{
    		display: flex;
    		justify-content: center;
    	}
    	.bi_btn div{
    		margin-right: 10px;
    	}
    	
    </style>
</head>
<body>
	<div id="title"><h2>게시판 관리</h2></div>
	<div id="view-control">
		<input type="button" value="전체목록" onclick="location.href='${ctp}/admin/boardManager'">
		<span>${curCategory}</span>
	</div>
	<div id="info-box">
	
	</div>
	<div id="board-bar">
		<form name="searchForm" method="get">
			<div id="search-box">
				<div id="date-filter">
					  <label for="df_start-date">시작일:</label>
					  <input type="date" id="df_start-date" name="df_start-date">
					
					  <label for="df_end-date">종료일:</label>
					  <input type="date" id="df_end-date" name="df_end-date">
				</div>
				<div id="search-bar">
					<div id="sb_category">
						<!-- main카테고리 -->
						<div id="sb_main-category">
							<select name="mainCategory" id="sb_mc">
								<c:forEach var="mcVo" items="${mainCtgyVos}">
						  	  		<option value="${mcVo.name}">${mcVo.name}</option>
						  		</c:forEach>
						  	</select>
					  	</div>
					  	
					  	<!-- sub카테고리  -->
					  	<div id="sb_sub-category" style="display: none;">
							<select name="subCategory" id="sb_sc">
						  	</select>
						</div>
					</div>
				
					<select name="search" id="search">
				  	  <option value="title">글제목</option>
				  	  <option value="member_nickname">글쓴이</option>
				  	  <option value="content">글내용</option>
				  	</select>
				  	<input type="text" name="searchString" id="searchString" />
				  	<input type="submit" value="검색" class="btn btn-secondary btn-sm" />
				  	<input type="hidden" name="pag" value="${pageVo.pag}" />
				  	<input type="hidden" name="pageSize" value="${pageVo.pageSize}" />
				</div>
			</div>
		</form>
			<div id="br_control-panel">
				<input type="button" id="b_hide-all-button" value="숨김" onclick="updateToggleAllBoard('hide')" style="display: none;">
				<input type="button" id="b_show-all-button" value="보이기" onclick="updateToggleAllBoard('show')" style="display: none;">
				<input type="button" id="b_delete-all-button" value="삭제" onclick="deleteCheckedAllBoard()" style="display: none;">
			</div>
	</div>
	<div id="board-box">
		<table id="board-list">
			<tr>
			  <th style="width: 4%"><input type="checkbox" id="select-all"></th>
			  <th style="width: 8%">카테고리</th>
			  <th style="width: 40%">제목</th>
			  <th style="width: 8%">작성자</th>
			  <th style="width: 10%">업로드</th>
			  <th style="width: 6%">조회수</th>
			  <th style="width: 6%">추천수</th>
			  <th style="width: 8%">상태</th>
			  <th style="width: 10%">관리</th>
			</tr>
			<c:forEach var="bVos" items="${boardVos}">
				<tr style="background-color: gray;">
					<td><input type="checkbox" class="bl_checkbox" id="${bVos.idx}"></td>
					<td>${bVos.categoryName}</td>
    				<td>
    					<a href="cmtyContent?boardIdx=${bVos.idx}">
    						${bVos.title}(${bVos.commentCount})
    					</a>
    				</td>
    				<td>${bVos.memberNickname}</td>
    				<td style="font-size: 12px;">
						<c:if test="${bVos.hourDiff <= 24}">
        					${bVos.dateDiff == 0 ? fn:substring(bVos.createdAt,11,19) : fn:substring(bVos.createdAt,0,19)}
       					</c:if>
						<c:if test="${bVos.hourDiff > 24}">${fn:substring(bVos.createdAt,0,10)}</c:if>
    				</td>
    				<td>${bVos.viewCount}</td>
    				<td>${bVos.likeCount}</td>
    				<td>
    					<div id="bi_stats${bVos.idx}">
	    					<c:if test="${bVos.hideCheck == 1}">숨겨짐</c:if>
	    					<c:if test="${bVos.reportCount >= 30}">신고됨</c:if>
    					</div>
    				</td>
    				<td>
    					<div class="bi_btn">
	    					<div id="bi_toggle-button${bVos.idx}">					
		    					<c:if test="${bVos.hideCheck == 0}"><input type="button" id="bi_hide-button${bVos.idx}" value="숨김" onclick="updateToggleBoard('${bVos.title}', ${bVos.idx})"></c:if>
		    					<c:if test="${bVos.hideCheck != 0}"><input type="button" id="bi_show-button${bVos.idx}" value="보이기" onclick="updateToggleBoard('${bVos.title}', ${bVos.idx})"></c:if>
	    					</div>
	    					<input type="button" id="bi_delete-button" value="삭제" onclick="deleteBoard('${bVos.title}', ${bVos.idx})">
    					</div>
    										
    				</td>
				</tr>			
			</c:forEach>
		</table>
		<!-- 블록페이지 시작 -->
		<div class="text-center block-page">
		  <ul class="pagination justify-content-center">
		    <c:if test="${pageVo.pag > 1}"><li class="page-item"><a class="page-link text-secondary" href="boardManager?category=${category}&pag=1&pageSize=${pageVo.pageSize}&search=${pageVo.search}&searchString=${pageVo.searchString}&startDate=${startDate}&lastDate=${lastDate}">첫페이지</a></li></c:if>
		  	<c:if test="${pageVo.curBlock > 0}"><li class="page-item"><a class="page-link text-secondary" href="boardManager?category=${category}&pag=${(curBlock-1)*blockSize+1}&pageSize=${pageVo.pageSize}&search=${pageVo.search}&searchString=${pageVo.searchString}&startDate=${startDate}&lastDate=${lastDate}">이전블록</a></li></c:if>
		  	<c:forEach var="i" begin="${(pageVo.curBlock*pageVo.blockSize)+1}" end="${(pageVo.curBlock*pageVo.blockSize)+pageVo.blockSize}" varStatus="st">
			    <c:if test="${i <= pageVo.totPage && i == pageVo.pag}"><li class="page-item active"><a class="page-link bg-secondary border-secondary" href="boardManager?category=${category}&pag=${i}&pageSize=${pageVo.pageSize}&search=${pageVo.search}&searchString=${pageVo.searchString}&startDate=${startDate}&lastDate=${lastDate}">${i}</a></li></c:if>
			    <c:if test="${i <= pageVo.totPage && i != pageVo.pag}"><li class="page-item"><a class="page-link text-secondary" href="boardManager?category=${category}&pag=${i}&pageSize=${pageVo.pageSize}&startDate=${startDate}&lastDate=${lastDate}">${i}</a></li></c:if>
		  	</c:forEach>
		  	<c:if test="${pageVo.curBlock < pageVo.lastBlock}"><li class="page-item"><a class="page-link text-secondary" href="boardManager?category=${category}&pag=${(pageVo.curBlock+1)*pageVo.blockSize+1}&pageSize=${pageVo.pageSize}&search=${pageVo.search}&searchString=${pageVo.searchString}&startDate=${startDate}&lastDate=${lastDate}">다음블록</a></li></c:if>
		  	<c:if test="${pageVo.pag < pageVo.totPage}"><li class="page-item"><a class="page-link text-secondary" href="boardManager?category=${category}&pag=${pageVo.totPage}&pageSize=${pageVo.pageSize}&search=${pageVo.search}&searchString=${pageVo.searchString}&startDate=${startDate}&lastDate=${lastDate}">마지막페이지</a></li></c:if>
		  </ul>
		</div>
		<!-- 블록페이지 끝 -->
	</div>
</body>
</html>