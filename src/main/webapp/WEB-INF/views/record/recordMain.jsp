<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>recordMain.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs5.jsp" />
	<script>
		'use strict';
		// 페이지가 로드되면 자동으로 크롤링 시작
/* 		window.onload = function() {
			crawling2();
		}; */
	  function crawling2() {
	  	$("#spinnerIcon").show();
	  	
	  	$.ajax({
	  		url  : "selenium2",
	  		type : "post",
	  		success:function(vos) {
	  			if(vos != "") {
	  				let str = '<table class="table table-bordered text-center">';
	  				str += '<tr class="table-secondary"><th>번호</th><th>영화제목</th><th>포스터</th><th>예매율</th></tr>';
	  				for(let i=0; i<vos.length; i++) {
	    				str += '<tr>';
	  					str += '<td>'+(i+1)+'</td>';
	  					str += '<td>'+vos[i].title+'</td>';
	  					str += '<td>'+vos[i].image+'</td>';
	  					str += '<td>'+vos[i].percent+'</td>';
	    				str += '</tr>';
	  				}
	  				str += '<tr><td colspan="4" class="p-0 m-0"></td></tr>';
	  				str += '</table>';
	    			$("#demo").html(str);
	  			}
	  			else $("#demo").html("검색된 자료가 없습니다.");
	  		},
	  		error : function() { alert("전송오류!"); }
	  	});
	  }
		function crawling3() {
			$("#spinnerIcon").show();

			$.ajax({
				url: "selenium3",
				type: "post",
				success:function(vos) {
					if(vos != "") {
						let str = '<table class="table table-bordered text-center">';
						str += '<tr class="table-secondary">';
						str += '<th>순위</th><th>선수명</th><th>년도/포지션</th><th>경기</th><th>타석</th><th>타수</th><th>안타</th><th>홈런</th><th>타점</th><th>타율</th>';
						str += '</tr>';
						
						for(let i = 0; i < vos.length; i++) {
							str += '<tr>';
							str += '<td>'+vos[i]["순위"]+'</td>';
							str += '<td>'+vos[i]["선수명"]+'</td>';
							str += '<td>'+vos[i]["년도/포지션"]+'</td>';
							str += '<td>'+vos[i]["경기"]+'</td>';
							str += '<td>'+vos[i]["타석"]+'</td>';
							str += '<td>'+vos[i]["타수"]+'</td>';
							str += '<td>'+vos[i]["안타"]+'</td>';
							str += '<td>'+vos[i]["홈런"]+'</td>';
							str += '<td>'+vos[i]["타점"]+'</td>';
							str += '<td>'+vos[i]["타율"]+'</td>';
							str += '</tr>';
						}
						
						str += '</table>';
						$("#demo").html(str);
					} else {
						$("#demo").html("검색된 자료가 없습니다.");
					}
					$("#spinnerIcon").hide();
				},
				error: function() {
					alert("전송오류!");
					$("#spinnerIcon").hide();
				}
			});
		}
	</script>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>기록실 메인화면</h2>
  <div class="container">
  <h2>SELENIUM 연습</h2>
  <hr class="border-secondary">
  <div><a href="javascript:location.reload()" class="btn btn-warning form-control">다시검색</a></div>
  <hr class="border-secondary">
  <div id="demo"></div>
  <hr class="border-secondary">
  
  <h4>CGV 상영관 무비차트(참고용)</h4>
  <div class="input-group mb-3">
    <div class="input-group-text">CGV 상영관 무비챠트</div>
    <input type="button" value="크롤링2" onclick="crawling2()" class="btn btn-success"/>
    <div class="input-group-append">
      <span id="spinnerIcon" style="display:none">
	      <span class="spinner-border"></span>
	      &nbsp;&nbsp; 검색중입니다. &nbsp;&nbsp;
	      <span class="spinner-border"></span>
      </span>
    </div>
  </div>
  <hr class="border-secondary">
  <h4>테스트</h4>
  <div class="input-group mb-3">
    <div class="input-group-text">기록테스트</div>
    <input type="button" value="크롤링3" onclick="crawling3()" class="btn btn-success"/>
    <div class="input-group-append">
      <span id="spinnerIcon" style="display:none">
	      <span class="spinner-border"></span>
	      &nbsp;&nbsp; 검색중입니다. &nbsp;&nbsp;
	      <span class="spinner-border"></span>
      </span>
    </div>
  </div>
  <hr class="border">
</div>
</div>
<p><br/></p>
</body>
</html>