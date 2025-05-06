<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HitBox 광고 관리</title>
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
	    
	    function createBtnClose(){
	    	$("#m_create-box").hide();
 	        $("#m_create-close").hide();    	
	    }
	    
	    function createBtnClick(part) {
	    	 if ($("#m_create-box").is(":visible")) {
	    			createMItem(part);
	    	    } else {
	    	        $("#m_create-box").show();
	    	        $("#m_create-close").show();
	    	    }
	    	
		}
	    
	    function createMItem(part) {
	    	let target = '';
	    	let url = 'createMItem';
	    	
	    	if(part == 'board') target = '게시글';
	    	else if(part == 'comment') target = '댓글';
	    	else if(part == 'member') target = '멤버';
	    	else if(part == 'ad') target = '광고';
	    	
	    	let title = $("#m-cb_title").find("input").val();
	    	let imageUrl = $("#m-cb_image-url").find("input").val();
	    	let linkUrl = $("#m-cb_link-url").find("input").val();
	    	let position = $("#m-cb_position").find("input").val();
	    	let startAt = $("#m-cb_start-at").val();
	    	let endAt = $("#m-cb_end-at").val();
	    	
	    	let vo = {
    			title: title,
    			imageUrl: imageUrl,
    			linkUrl: linkUrl,
    			position: position,
    			startAt: startAt,
    			endAt: endAt
	    	};
	    	
	    	const fieldNames = {
	    		    title: "광고명",
	    		    imageUrl: "이미지 URL",
	    		    linkUrl: "링크 URL",
	    		    position: "위치",
	    		    startAt: "시작일",
	    		    endAt: "종료일"
	    		};
	    	
	    	for (let key in vo) {
	    	    if (!vo[key] || vo[key].toString().trim() === "") {
	    	        alert(fieldNames[key] + " 값을 입력해주세요.");
	    	        return;
	    	    }
	    	}
	    	
			
			$.ajax({
				url: '${ctp}/admin/'+url,  
    	        type: 'post',
    	        data: vo,
    	        success:function(res){
    	        	if(res == 1){
    	        		alert(target+"("+title+")(이)가 생성되었습니다.");
    	        		location.reload();
    	        	}
    	        	else{ alert("잠시 후 다시 시도해주세요."); }
    	        },
    	        error: function() {
					alert(target+" 생성 중 오류가 발생하였습니다.");
				}
			});
		}
	    
	    function deleteMItem(part , title, idx) {
	    	let target = '';
	    	let url = 'deleteMItem';
	    	
	    	if(title > 25) title = title.substring(0,25);
	    	
	    	if(part == 'board') target = '게시글';
	    	else if(part == 'comment') target = '댓글';
	    	else if(part == 'member') target = '멤버';
	    	else if(part == 'ad') target = '광고';
	    	
			if(!confirm(target+"("+title+")을(를) 정말 삭제하시겠습니까?"))
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
	    	else if(part == 'member') target = '멤버';
	    	else if(part == 'ad') target = '광고';
	    	
			if(!confirm("선택된 "+target+"을(를) 정말 삭제하시겠습니까?"))
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
	<div id="title"><h2>광고 관리</h2></div>
	<div id="view-control">
		<input type="button" value="전체목록" onclick="location.href='${ctp}/admin/adManager'">
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
				  	  <option value="title">광고명</option>
				  	  <option value="position">포지션</option>
				  	  <option value="image_url">이미지URL</option>
				  	  <option value="link_url">링크URL</option>
				  	</select>
				  	<input type="text" name="searchString" id="searchString" />
				  	<input type="submit" value="검색" class="btn btn-secondary btn-sm" />
				  	<input type="hidden" name="pag" value="${pageVo.pag}" />
				  	<input type="hidden" name="pageSize" value="${pageVo.pageSize}" />
				</div>
			</div>
		</form>
		<div id="m_control-panel">
			<input type="button" id="m_delete-all-button" value="삭제" onclick="deleteCheckedAllMItem('ad')" style="display: none;">
			<input type="button" id="m_create-button" value="생성" onclick="createBtnClick('ad')">
			<input type="button" id="m_create-close" value="취소" onclick="createBtnClose()" style="display: none;">
		</div>
	</div>
	<div id="m_create-box" style="display: none;">
		<div id="m-cb_high-bar">
			<div id="m-cb_title"><span>광고명:</span><input type="text" required></div>
			<div id="m-cb_image-url">이미지URL:<input type="text" required></div>
			<div id="m-cb_link-url"><span>링크URL:</span><input type="text" required></div>
		</div>
		<div id="m-cb_low-bar">
			<div id="m-cb_position">포지션: <input type="text" required></div>
			<div>
				<label for="start-at">시작일:</label>
				<input type="date" id="m-cb_start-at" name="start-at">				
			</div>
			<div>
				<label for="end-at">종료일:</label>
				<input type="date" id="m-cb_end-at" name="end-at">				
			</div>
		</div>
	</div>
	<div id="manager-box">
		<table id="m-list">
			<tr>
				<th style="width: 5%"><input type="checkbox" id="select-all"></th>
				<th style="width: 5%">id</th>
				<th style="width: 10%">광고명</th>
				<th style="width: 15%">이미지</th>
				<th style="width: 15%">링크</th>
				<th style="width: 10%">위치</th>
				<th style="width: 10%">시작일</th>
				<th style="width: 10%">종료일</th>
				<th style="width: 6%">클릭수</th>
				<th style="width: 6%">경고수</th>
				<th style="width: 8%">관리</th>
			</tr>
			<c:forEach var="adVo" items="${adVos}">
				<tr style="background-color: #e2e2e2;">
					<td><input type="checkbox" class="ml_checkbox" id="${adVo.idx}"></td>
					<td style="text">${adVo.idx}</td>
					<td style="text; text-align: center; padding: 0px;">${adVo.title}</td>
					<td style="text"><a href="${adVo.imageUrl}">${fn:substring(adVo.imageUrl, 0, 20)}...</a></td>
					<td style="text"><a href="${adVo.linkUrl}">${fn:substring(adVo.linkUrl, 0, 20)}...</a></td>
					<td style="text">${adVo.position}</td>
					<td style="text">${fn:substring(adVo.startAt, 0, 19)}</td>
					<td style="text">${fn:substring(adVo.endAt,0,19)}</td>
					<td style="text">${adVo.clickCount}</td>					
					<td style="text">${adVo.reportCount}</td>					
    				<td>
    					<div class="mi_btn">
	    					<input type="button" id="mi_delete-button" value="삭제" onclick="deleteMItem('ad','${adVo.title}', ${adVo.idx})">
    					</div>									
    				</td>
				</tr>			
			</c:forEach>
		</table>
		<!-- 블록페이지 시작 -->
		<div class="text-center block-page">
		  <ul class="pagination justify-content-center">
		    <c:if test="${pageVo.pag > 1}"><li class="page-item"><a class="page-link text-secondary" href="adManager?pag=1&pageSize=${pageVo.pageSize}&search=${pageVo.search}&searchString=${pageVo.searchString}&startDate=${startDate}&lastDate=${lastDate}">첫페이지</a></li></c:if>
		  	<c:if test="${pageVo.curBlock > 0}"><li class="page-item"><a class="page-link text-secondary" href="adManager?pag=${(curBlock-1)*blockSize+1}&pageSize=${pageVo.pageSize}&search=${pageVo.search}&searchString=${pageVo.searchString}&startDate=${startDate}&lastDate=${lastDate}">이전블록</a></li></c:if>
		  	<c:forEach var="i" begin="${(pageVo.curBlock*pageVo.blockSize)+1}" end="${(pageVo.curBlock*pageVo.blockSize)+pageVo.blockSize}" varStatus="st">
			    <c:if test="${i <= pageVo.totPage && i == pageVo.pag}"><li class="page-item active"><a class="page-link bg-secondary border-secondary" href="adManager?pag=${i}&pageSize=${pageVo.pageSize}&search=${pageVo.search}&searchString=${pageVo.searchString}&startDate=${startDate}&lastDate=${lastDate}">${i}</a></li></c:if>
			    <c:if test="${i <= pageVo.totPage && i != pageVo.pag}"><li class="page-item"><a class="page-link text-secondary" href="adManager?pag=${i}&pageSize=${pageVo.pageSize}&startDate=${startDate}&lastDate=${lastDate}">${i}</a></li></c:if>
		  	</c:forEach>
		  	<c:if test="${pageVo.curBlock < pageVo.lastBlock}"><li class="page-item"><a class="page-link text-secondary" href="adManager?pag=${(pageVo.curBlock+1)*pageVo.blockSize+1}&pageSize=${pageVo.pageSize}&search=${pageVo.search}&searchString=${pageVo.searchString}&startDate=${startDate}&lastDate=${lastDate}">다음블록</a></li></c:if>
		  	<c:if test="${pageVo.pag < pageVo.totPage}"><li class="page-item"><a class="page-link text-secondary" href="adManager?pag=${pageVo.totPage}&pageSize=${pageVo.pageSize}&search=${pageVo.search}&searchString=${pageVo.searchString}&startDate=${startDate}&lastDate=${lastDate}">마지막페이지</a></li></c:if>
		  </ul>
		</div>
		<!-- 블록페이지 끝 -->
	</div>
</body>
</html>