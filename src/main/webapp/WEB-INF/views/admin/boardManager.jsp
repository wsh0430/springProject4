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
	          $('#b_hide-button').toggle(hasChecked);
	          $('#b_delete-button').toggle(hasChecked);
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
    </script>
    <style>
    	#view_type-bar{
    		width: 100%;
    		height: 60px;
    	}
    	#board-list{
    		width: 100%;
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
				<input type="button" id="b_hide-button" value="숨김" style="display: none;">
				<input type="button" id="b_delete-button" value="삭제" style="display: none;">
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
					<td><input type="checkbox" class="bl_checkbox"></td>
					<td>${bVos.categoryName}</td>
    				<td>
    					<a href="cmtyContent?boardIdx=${bVos.idx}&category=${category}&pag=${pageVo.pag}&pageSize=${pageVo.pageSize}&search=${pageVo.search}&searchString=${pageVo.searchString}">
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
    				<td>신고됨</td>
    				<td>삭제</td>
				</tr>			
			</c:forEach>
		</table>
		<!-- 블록페이지 시작 -->
		<div class="text-center block-page">
		  <ul class="pagination justify-content-center">
		    <c:if test="${pageVo.pag > 1}"><li class="page-item"><a class="page-link text-secondary" href="cmtyMain?category=${category}&pag=1&pageSize=${pageVo.pageSize}">첫페이지</a></li></c:if>
		  	<c:if test="${pageVo.curBlock > 0}"><li class="page-item"><a class="page-link text-secondary" href="cmtyMain?category=${category}&pag=${(curBlock-1)*blockSize+1}&pageSize=${pageVo.pageSize}">이전블록</a></li></c:if>
		  	<c:forEach var="i" begin="${(pageVo.curBlock*pageVo.blockSize)+1}" end="${(pageVo.curBlock*pageVo.blockSize)+pageVo.blockSize}" varStatus="st">
			    <c:if test="${i <= pageVo.totPage && i == pageVo.pag}"><li class="page-item active"><a class="page-link bg-secondary border-secondary" href="cmtyMain?category=${category}&pag=${i}&pageSize=${pageVo.pageSize}">${i}</a></li></c:if>
			    <c:if test="${i <= pageVo.totPage && i != pageVo.pag}"><li class="page-item"><a class="page-link text-secondary" href="cmtyMain?category=${category}&pag=${i}&pageSize=${pageVo.pageSize}">${i}</a></li></c:if>
		  	</c:forEach>
		  	<c:if test="${pageVo.curBlock < pageVo.lastBlock}"><li class="page-item"><a class="page-link text-secondary" href="cmtyMain?category=${category}&pag=${(pageVo.curBlock+1)*pageVo.blockSize+1}&pageSize=${pageVo.pageSize}">다음블록</a></li></c:if>
		  	<c:if test="${pageVo.pag < pageVo.totPage}"><li class="page-item"><a class="page-link text-secondary" href="cmtyMain?category=${category}&pag=${pageVo.totPage}&pageSize=${pageVo.pageSize}">마지막페이지</a></li></c:if>
		  </ul>
		</div>
		<!-- 블록페이지 끝 -->
	</div>
</body>
</html>