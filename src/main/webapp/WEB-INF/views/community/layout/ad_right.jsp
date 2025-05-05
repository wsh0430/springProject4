<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ad_right.jsp</title>
    <jsp:include page="/WEB-INF/views/include/bs5.jsp" />
    <script>
   		$(document).ready(function () {
   			// 광고 순회
     		rotateAd();
   			
	    	// 광고 닫기 버튼 클릭 시
	        $('.close-btn').on('click', function () {
	          $(this).closest('.ad_content').hide();
	          $(this).closest('.ad').find('.ad_survey_modal').fadeIn();
	        });
	
	        // 설문 제출
	        $('.submitSurvey').on('click', function () {
	        	const $modal = $(this).closest('.ad_survey_modal');
	        	
	         	if($modal.find("input[type=radio]:checked").val() == '기타' && $modal.find(".etc-txt").val() == '') {
	        		alert("기타 사유를 입력해 주세요");
	        		return false;
	        }
	          
	          let selectedReasons = $modal.find('input[name="reason"]:checked').val();
	          if(selectedReasons == 'etc') selectedReasons += '/' + $modal.find(".etc-txt").val();
	          const idx = $modal.closest('.ad').find(".ad_content input[name='ad_idx']").val();
	
	          $.ajax({
	       	    url: "${ctp}/ad/adClose",
				type: "post",
				data: {
					idx: idx,
					reason: selectedReasons
				},
				success: function(res){
					if(res == 1){
						$modal.hide();
						$modal.closest('.ad').find('.ad_close-window').show().css('display', 'flex');
					}
					else{
						alert("잠시 후 다시 시도해주세요.");
					}
				},
				error: function() {
					alert("설문 제출 중 전송 오류 발생");
				}
	          });
	          
	        });
	 	});
   		
   		function etcShow() {
   			$(event.target).parent().next('.etc').find('.etc-txt').show();
        }
   		
   		
   		function rotateAd() {
   		  const $curDiv = $('.hide-bar');

   		    $curDiv.each(function () {
   	   		  	let index = 1;
   		    	
	   	   		const updateAd = () => {
		   	   	    const imageValue = $(this).find('.ad_image').eq(index).val();
		   	   	    const linkValue = $(this).find('.ad_link').eq(index).val();
		   	   	    const titleValue = $(this).find('.ad_title').eq(index).val();
		   	   	    const idxValue = $(this).find('.ad_idx').eq(index).val();
		   	   	    console.log($(this));
		   	   	    console.log('titleValue : ' + titleValue);
		
		   	   	    let string = '<a href="' + imageValue + '"><img alt="' + titleValue + '" src="' + imageValue + '"></a>';
		   	   	    string += '<input type="hidden" name="ad_idx" value="' + idxValue + '">';
		
		   	   	    $(this).closest('.ad').find('.ad_content span').html(string);
		   	   	    $(this).closest('.ad').find('.close-btn').show();
		
		   	   	    // 광고 갯수 기준 순환: 첫 div 기준
		   	   	    const totalAds = $curDiv.find('.ad_image').length - 1;
		   	   	    index = (index + 1) % totalAds;
   	   			};

	   	   	// 맨 처음에도 실행
	   	   	updateAd();

	   	   	// 3초마다 실행
	   	   	setInterval(updateAd, 30000); // 3초마다 변경
   		    });

   		}
    </script>
    <style>
    	textarea{
    		resize: none;
    	}
    
	   	.ad img{
	   		width: 100%;
	   		height: 100%;
	   	}
	   	
	   	.ad_side{
	   		min-width: 150px;
	   		height: 400px;
	   		margin: 200px 15px 0px 15px;
	   	}
	   	.ad_content{
	   		width: 100%;
	   		height: 100%;
	   	}
	   	.ad .ad_content{
	   		position: relative;
	   	}
	   	
	   	.close-btn {
		    font-size: 10px;
		    cursor: pointer;
		    position: absolute;
  			right: 0px;
	  	}
	
		.ad_survey_modal {
		  	display: none;
		  	z-index: 9999;
		}
		
		.ad_close-window{
			display: none;
			height: 100%;
			background-color: lightgray;
			align-items: center;   
  			justify-content: center; 
  			padding: 5px;
		}	
		
		.submitSurvey-box{
			text-align: right;
		}	
    </style>
</head>
<body>
	<div id="ad_sr" class="ad_side ad">
		<div class="hide-bar" id="side-right">
			<c:forEach var="adVo" items="${adVos}">
				<c:if test="${adVo.position == 'side-right'}">
					<input type="hidden" class="ad_image" value="${adVo.imageUrl}">
					<input type="hidden" class="ad_link" value="${adVo.linkUrl}">
					<input type="hidden" class="ad_title" value="${adVo.title}">
					<input type="hidden" class="ad_idx" value="${adVo.idx}">
				</c:if>
			</c:forEach>
		</div>
	
	
		<div class="ad_content">
			<span>
			</span>			
			<button class="close-btn" style="display: none;"><i class="fa-solid fa-sm fa-xmark"></i></button>
		</div>	
		
		
		<div class="ad_survey_modal">
			 <p style="margin-bottom: 8px;">이 광고가 마음에 들지 않는 이유는?</p>
			 <label><input type="radio" name="reason" value="irrelevant"> 관련 없음</label>
			 <label><input type="radio" name="reason" value="seen-often"> 자주 봄</label>
			 <label><input type="radio" name="reason" value="offensive"> 불쾌함</label>
			 <div><input type="radio" name="reason" value="etc" onclick="etcShow()"/> 기타</div>
			 <div class="etc"><textarea rows="2" class="etc-txt form-control" style="display:none"></textarea></div>
			 <div class="submitSurvey-box"><button class="submitSurvey">제출</button></div>
		</div>
		
		<div class="ad_close-window">		
			<span>더이상 광고가 표시되지 않습니다</span>
		</div>
	</div>
</body>
</html>