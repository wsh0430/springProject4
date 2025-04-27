<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>HitBox 관리자페이지</title>
	<jsp:include page="/WEB-INF/views/include/bs5.jsp" />
	<script>
	 	'use strict';
	
	 	$(document).ready(function() { 
	 		  $('.ri_c-delta').each(function() { 
	 		    let $delta = $(this); 

	 		    let value = parseInt($delta.text());

	 		    if (value > 0) {
	 		      $delta.html(value + "<i class='fa-solid fa-sm fa-arrow-up'></i>");
	 		      $delta.css('color', 'blue');
	 		    } else if (value < 0) {
	 		      $delta.html(Math.abs(value) + "<i class='fa-solid fa-sm fa-arrow-down'></i>");
	 		      $delta.css('color', 'red');
	 		    }
	 		  });
	 		});
	</script>
	<style>
		#range-daily{
			width: 40%;
			height: 200px;
			border-radius: 7px;
			padding: 10px;
			
		}
		
		#rd_title{
			margin: 10px 0px 10px 8px;
		}
	
		.range-item{
			display: flex;
			flex-direction: column;
			width: 120px;
			height: 100px;
			border: 1px solid black;
			border-radius: 7px;
			text-align: center;
			margin-left: 10px;
		}
		
		.ri_content{
			display: flex;
			flex-direction: column;
		}
		.ri_c-rate{
			height: 50px;
			display: flex;
			align-items: center;
			justify-content: center;
			font-size: 2em;
		}

	</style>
</head>
<body>
	<div id="range-daily">
		<div id="rd_title">
			<h2>Today Stats</h2>
		</div>
		<table>
			<tr>
				<td>	<!-- foreach로 해도 될지도 ? -->
					<div class="range-item">
						<span class="ri_title">방문수</span>
						<div class="ri_content">
							<span class="ri_c-rate">${statDataVo.dailyVisitCnt}</span>
							<span class="ri_c-delta">${statDataVo.dailyVisitDelta}</span>
						</div>
					</div>
				</td>
				<td>
					<div class="range-item">
						<span class="ri_title">게시글수</span>
						<div class="ri_content">
							<span class="ri_c-rate">0</span>
							<span class="ri_c-delta">0</span>
						</div>
					</div>
				</td>
				<td>
					<div class="range-item">
						<span class="ri_title">회원가입수</span>
						<div class="ri_content">
							<span class="ri_c-rate">1</span>
							<span class="ri_c-delta">1</span>
						</div>
					</div>
				</td>
				<td>
					<div class="range-item">
						<span class="ri_title">???</span>
						<div class="ri_content">
							<span class="ri_c-rate">0</span>
							<span class="ri_c-delta">0</span>
						</div>
					</div>
				</td>
			</tr>		
		</table>
	</div>
</body>
</html>