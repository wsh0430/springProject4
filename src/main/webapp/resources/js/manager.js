
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
	    	
			if(!confirm("선택된 게시글을 정말 삭제하시겠습니까?"))
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
	    
	    function updateToggleMItem(part, toggle, idx) {	   
	    	let target = '';
	    	let url = 'updateToggleMItem';
	    	
	    	if(part == 'board') target = '게시글';
	    	else if(part == 'comment') target = '댓글';
	    	
	    	let div = $("#mi_toggle-button"+idx);
	    	let stats = $("#mi_stats"+idx);
	    	
	    	
	    	$.ajax({
	    		url: '${ctp}/admin/'+url,  
    	        type: 'post',
    	        data: { 
    	        	idx: idx,
    	        	part: part,
    	        	toggle: toggle
    	        },
    	        success:function(res){
    	        	if(res == 1){
    	        		// 숨겨짐 처리 == 버튼은 보이기로 바뀜
    	        		div.html('<input type="button" id="mi_show-button'+idx+'" value="보이기" onclick="updateToggleMItem(\''+part+'\',\'\', '+idx+')">');	           		
    	        		if(!stats.text().includes("숨겨짐"))
    	        			stats.text("숨겨짐 "+ stats.text());
    	        		else
    	        			stats.text(stats.text());
    	        	}
    	        	else if(res == 0){
    	        		// 숨겨짐 처리 == 버튼은 숨겨짐으로 바뀜
    	        		div.html('<input type="button" id="mi_show-button'+idx+'" value="숨김" onclick="updateToggleMItem(\''+part+'\',\'\', '+idx+')">');	      		
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
					alert(target + " 토글 중 오류가 발생하였습니다.");
				}
	    	});
		}
	    
	    function updateToggleAllMItem(part, toggle) {	    	
	    	let target = '';
	    	let url = 'updateToggleMItem';
	    	
	    	if(part == 'board') target = '게시글';
	    	else if(part == 'comment') target = '댓글';
	    	
	    	let div = $("#mi_toggle-button");
	    	
	    	$('input[type="checkbox"]:checked').not('#select-all').each(function(){
	    		let idx = $(this).attr('id');
	    		
		    	$.ajax({
		    		url: '${ctp}/admin/'+url,  
	    	        type: 'post',
	    	        data: { 
	    	        	idx: idx,
	    	        	part: part,
	    	        	toggle: toggle
	    	        },
	    	        success:function(res){
	    	        	if(res == 1){
	    	        		let stats = $("#mi_stats"+idx);
	    	        		
		    	        	if(toggle == 'hide'){
		    	        		// 숨겨짐 처리 == 버튼은 보이기로 바뀜
		    	        		div.html('<input type="button" id="mi_show-button'+idx+'" value="보이기" onclick="updateToggleMItem(\''+part+'\',\''+toggle+'\', '+idx+')">');	        		
		    	        		if(!stats.text().includes("숨겨짐"))
		    	        			stats.text("숨겨짐 "+ stats.text());
		    	        	}
		    	        	else if(toggle == 'show'){
		    	        		// 숨겨짐 처리 == 버튼은 숨겨짐으로 바뀜
		    	        		div.html('<input type="button" id="mi_hide-button'+idx+'" value="숨김" onclick="updateToggleMItem(\''+part+'\',\''+toggle+'\', '+idx+')">');	        		
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
						alert(target+" 토글 중 오류가 발생하였습니다.");
					}
		    	});
	    	});
		}