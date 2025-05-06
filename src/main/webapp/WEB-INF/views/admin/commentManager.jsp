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
	          const hasChecked = $('.ml_checkbox:checked').length > 0;
	          $('#m_hide-all-button').toggle(hasChecked);
	          $('#m_show-all-button').toggle(hasChecked);
	          $('#m_delete-all-button').toggle(hasChecked);
	        }
	    	$('.ml_checkbox').on('change', toggleButton);
	    	
	        // 전체 선택 클릭 시, 개별 체크박스 전부 체크/해제
	        $('#select-all').on('change', function() {
	          $('.ml_checkbox').prop('checked', this.checked);
	          toggleButton();
	        });
	
	        // 개별 체크박스 변경 시 전체 선택 상태 동기화
	        $('.ml_checkbox').on('change', function() {
	          const allChecked = $('.ml_checkbox').length === $('.ml_checkbox:checked').length;
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
	    
	    function deleteMItem(part , title, idx) {
	    	let target = '';
	    	let url = 'deleteMItem';
	    	
	    	if(title > 25) title = title.substring(0,25);
	    	
	    	if(part == 'board') target = '게시글';
	    	else if(part == 'comment') target = '댓글';
	    	
			if(!confirm(target+"("+title+")을 정말 삭제하시겠습니까?"))
				return false;
			
			$.ajax({
				url: '${ctp}/admin/'+url,  
    	        type: 'post',
    	        data: { 
    	        	idx: idx,
    	        	part: part
    	        },
    	        success:function(res){
    	        	if(res == 1){
    	        		alert(target+"("+title+")이 삭제되었습니다.");
    	        		location.reload();
    	        	}
    	        	else{ alert("잠시 후 다시 시도해주세요."); }
    	        },
    	        error: function() {
					alert(target+" 삭제 중 오류가 발생하였습니다.");
				}
			});
		}
	    
	    function deleteCheckedAllMItem(part) {
	    	let target = '';
	    	let url = 'deleteMItem';
	    	
	    	if(part == 'board') target = '게시글';
	    	else if(part == 'comment') target = '댓글';
	    	
			if(!confirm("선택된 "+target+"을 정말 삭제하시겠습니까?"))
				return false;
			

	    	$('input[type="checkbox"]:checked').not('#select-all').each(function(){
	    		let idx = $(this).attr('id');
				$.ajax({
					url: '${ctp}/admin/'+url,  
	    	        type: 'post',
	    	        data: { 
	    	        	idx: idx,
	    	        	part: part
	    	        },
	    	        success:function(res){
	    	        	if(res == 1){
	    	        		alert(idx+"번 "+target+"이 삭제되었습니다.");
	    	        		location.reload();
	    	        	}
	    	        	else{ alert("잠시 후 다시 시도해주세요."); }
	    	        },
	    	        error: function() {
						alert(target+ " 삭제 중 오류가 발생하였습니다.");
					}
				});
	    	});
		}
    </script>
    <link rel="stylesheet" href="${ctp}/css/manager.css">
</head>
<body>
	<div id="title"><h2>댓글 관리</h2></div>
	<div id="view-control">
		<input type="button" value="전체목록" onclick="location.href='${ctp}/admin/commentManager'">
		<%-- <span>${curCategory}</span> --%>
	</div>
	<!-- <div id="info-box">
	
	</div> -->
	<div id="manager-bar">
		<form name="searchForm" method="get">
			<div id="search-box">
				<div id="date-filter">
					  <label for="startDate">시작일:</label>
					  <input type="date" id="df_start-date" name="startDate">
					
					  <label for="lastDate">종료일:</label>
					  <input type="date" id="df_end-date" name="lastDate">
				</div>
				<div id="search-bar">				
					<select name="search" id="search">
				  	  <option value="board_id">게시글id</option>
				  	  <option value="member_id">멤버id</option>
				  	  <option value="member_nickname">닉네임</option>
				  	  <option value="content">내용</option>
				  	</select>
				  	<input type="text" name="searchString" id="searchString" />
				  	<input type="submit" value="검색" class="btn btn-secondary btn-sm" />
				  	<input type="hidden" name="pag" value="${pageVo.pag}" />
				  	<input type="hidden" name="pageSize" value="${pageVo.pageSize}" />
				</div>
			</div>
		</form>
			<div id="m_control-panel">
				<input type="button" id="m_delete-all-button" value="삭제" onclick="deleteCheckedAllMItem('comment')" style="display: none;">
			</div>
	</div>
	<div id="manager-box">
		<table id="m-list">
			<tr>
			  <th style="width: 4%"><input type="checkbox" id="select-all"></th>
			  <th style="width: 8%">게시글</th>
			  <th style="width: 40%">제목</th>
			  <th style="width: 8%">작성자</th>
			  <th style="width: 10%">업로드</th>
			  <th style="width: 6%">부모</th>
			  <th style="width: 6%">추천수</th>
			  <th style="width: 8%">상태</th>
			  <th style="width: 10%">관리</th>
			</tr>
			<c:forEach var="cmtVo" items="${commentVos}">
				<tr style="background-color: #e2e2e2;">
					<td><input type="checkbox" class="ml_checkbox" id="${cmtVo.idx}"></td>
					<td style="text">${cmtVo.parentId}</td>
    				<td>
    					<a href="${ctp}/community/cmtyContent?boardIdx=${cmtVo.boardId}">
    						${cmtVo.content}
    					</a>
    				</td>
    				<td>${cmtVo.memberNickname}</td>
    				<td style="font-size: 12px;">
						<c:if test="${cmtVo.createdAt == cmtVo.updateAt}">${fn:substring(cmtVo.createdAt,0,19)}</c:if>						
						<c:if test="${cmtVo.createdAt != cmtVo.updateAt}"> ${fn:substring(cmtVo.updateAt,0,16)}(수정됨)</c:if>
    				</td>
					<td>${cmtVo.boardId}</td>
    				<td>${cmtVo.likeCount}</td>
    				<td>
    					<div id="mi_stats${cmtVo.idx}">
	    					<c:if test="${cmtVo.reportCount >= 30}">신고됨</c:if>
    					</div>
    				</td>
    				<td>
    					<div class="mi_btn">
	    					<input type="button" id="mi_delete-button" value="삭제" onclick="deleteMItem('comment','${cmtVo.content}', ${cmtVo.idx})">
    					</div>
    										
    				</td>
				</tr>			
			</c:forEach>
		</table>
		<!-- 블록페이지 시작 -->
		<div class="text-center block-page">
		  <ul class="pagination justify-content-center">
		    <c:if test="${pageVo.pag > 1}"><li class="page-item"><a class="page-link text-secondary" href="commentManager?pag=1&pageSize=${pageVo.pageSize}&search=${pageVo.search}&searchString=${pageVo.searchString}&startDate=${startDate}&lastDate=${lastDate}">첫페이지</a></li></c:if>
		  	<c:if test="${pageVo.curBlock > 0}"><li class="page-item"><a class="page-link text-secondary" href="commentManager?pag=${(curBlock-1)*blockSize+1}&pageSize=${pageVo.pageSize}&search=${pageVo.search}&searchString=${pageVo.searchString}&startDate=${startDate}&lastDate=${lastDate}">이전블록</a></li></c:if>
		  	<c:forEach var="i" begin="${(pageVo.curBlock*pageVo.blockSize)+1}" end="${(pageVo.curBlock*pageVo.blockSize)+pageVo.blockSize}" varStatus="st">
			    <c:if test="${i <= pageVo.totPage && i == pageVo.pag}"><li class="page-item active"><a class="page-link bg-secondary border-secondary" href="commentManager?pag=${i}&pageSize=${pageVo.pageSize}&search=${pageVo.search}&searchString=${pageVo.searchString}&startDate=${startDate}&lastDate=${lastDate}">${i}</a></li></c:if>
			    <c:if test="${i <= pageVo.totPage && i != pageVo.pag}"><li class="page-item"><a class="page-link text-secondary" href="commentManager?pag=${i}&pageSize=${pageVo.pageSize}&startDate=${startDate}&lastDate=${lastDate}">${i}</a></li></c:if>
		  	</c:forEach>
		  	<c:if test="${pageVo.curBlock < pageVo.lastBlock}"><li class="page-item"><a class="page-link text-secondary" href="commentManager?pag=${(pageVo.curBlock+1)*pageVo.blockSize+1}&pageSize=${pageVo.pageSize}&search=${pageVo.search}&searchString=${pageVo.searchString}&startDate=${startDate}&lastDate=${lastDate}">다음블록</a></li></c:if>
		  	<c:if test="${pageVo.pag < pageVo.totPage}"><li class="page-item"><a class="page-link text-secondary" href="commentManager?pag=${pageVo.totPage}&pageSize=${pageVo.pageSize}&search=${pageVo.search}&searchString=${pageVo.searchString}&startDate=${startDate}&lastDate=${lastDate}">마지막페이지</a></li></c:if>
		  </ul>
		</div>
		<!-- 블록페이지 끝 -->
	</div>
</body>
</html>