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
    
   		 function pageSizeCheck() {
    		let pageSize = document.getElementById("pageSize").value;
    		location.href = "cmtyMain?pageSize="+pageSize;
   		 }
  </script>
    <style>
    	#main{
    		min-width: 80%; 		
    	}	
    	
    	#category{
    		margin-bottom: 10px;
    		margin-top: 10px;
    	}
    	
    	.dropbtn {
		  background-color: gray;
		  color: white;
		  padding: 6px 12px;
		  font-size: 16px;
		  border: none;
		}
		.dropbtn a{
			text-decoration: none;
		}
		
		.dropdown {
		  position: relative;
		  display: inline-block;
		}
		
		.dropdown-content {
		  display: none;
		  position: absolute;
		  background-color: #f1f1f1;
		  min-width: 160px;
		  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
		  z-index: 1;
		}
		
		.dropdown-content a {
		  color: black;
		  padding: 12px 16px;
		  text-decoration: none;
		  display: block;
		}
		
		.dropdown-content a:hover {background-color: #ddd;}
		
		.dropdown:hover .dropdown-content {display: block;}
		
		.dropdown:hover .dropbtn {background-color: #3e8e41;}
    	
    	#board{
    		min-height: 20px;
    	}
    	.board_list{
    		margin-bottom: 20px;
    		width: 100%;
    	}
    	.board_list tr{
    		border-bottom: 1px solid black;
    	}
    	
    	.board_list tr:nth-child(1){
    		background-color: gray;
    	}
    	
    	.board_list tr, .board_list td{
    		height: 40px;
    		text-align: center;
    	}
    	.board_list td:nth-child(2){
    		text-align: left;
    		padding-left: 8px;
    	}
    	.board_list td:nth-child(2) a{
    		text-decoration: none;
    	}
    	.board_list td:nth-child(2) a:hover{
    		color: red;
    	}
    	
    	.block-page{
    		margin-bottom: 10px;
    	}
    </style>
</head>
<body>
    <div id="main">
    	<div id="category">
    		<table>
    			<tr>
    				<c:forEach var="mcVos" items="${mainCtgyVos}" varStatus="st">
    					<td>
    						<div class="dropdown">
	    						<c:if test="${empty subCtgy[st.index]}">
	    							<span class="dropbtn"><a href="cmtyMain?category=${mcVos.name}">${mcVos.name}</a></span>
	    						</c:if>
	    						<c:if test="${!empty subCtgy[st.index]}">
	    							<span class="dropbtn">${mcVos.name}  <i class="fa fa-caret-down"></i></span>     
	    						</c:if>
	    						<div class="dropdown-content">
	    							<c:forEach var="scVos" items="${subCtgy[st.index]}">
										<a href="cmtyMain?category=${scVos.name}">${scVos.name}</a>			
			    					</c:forEach>
	    						</div>
    						</div>
    					</td>
    				</c:forEach>
    			</tr>
    		</table>
    	</div>
    	<div id="board">
			<span>${category}</span>
			<table class="table table-borderless m-0 p-0">
				<tr>
					<td><a href="${ctp}/community/cmtyBoardCreate" class="btn btn-success btn-sm">글쓰기</a></td>
					<c:if test="${empty pageVo.searchStr}">
						<td class="text-end"><select name="pageSize" id="pageSize"
							onchange="pageSizeCheck()">
								<option ${pageVo.pageSize==5  ? 'selected' : ''}>5</option>
								<option ${pageVo.pageSize==10 ? 'selected' : ''}>10</option>
								<option ${pageVo.pageSize==15 ? 'selected' : ''}>15</option>
								<option ${pageVo.pageSize==20 ? 'selected' : ''}>20</option>
								<option ${pageVo.pageSize==30 ? 'selected' : ''}>30</option>
								<option ${pageVo.pageSize==50 ? 'selected' : ''}>50</option>
						</select></td>
					</c:if>
					<c:if test="${!empty pageVo.searchStr}">
						<td class="text-end"><font color='blue'>${pageVo.searchStr}</font>(으)로
							<font color='orange'><b>${pageVo.searchString}</b></font>을(를) 검색한
							결과 <font color='red'>${fn:length(vos)}</font>건이 출력되었습니다.</td>
					</c:if>
				</tr>
			</table>
			<table class="board_list">
					<tr>
	    				<th style="width: 5%">번호</th>
	    				<th style="width: 50%">제목</th>
	    				<th style="width: 12.5%">작성자</th>
	    				<th style="width: 17.5%">업로드</th>
	    				<th style="width: 7.5%">조회수</th>
	    				<th style="width: 7.5%">추천수</th>
	    			</tr>
    			<c:forEach var="bVos" items="${boardVos}">
    				<c:if test="${bVos.deleteCheck == 0}">
		    			<tr>
		    				<td>${bVos.idx}</td>
		    				<td>
		    					<a href="cmtyContent?boardIdx=${bVos.idx}&category=${category}&pag=${pageVo.pag}&pageSize=${pageVo.pageSize}&search=${pageVo.search}&searchString=${pageVo.searchString}">
		    						<font style="color: blue; font-weight: bold; font-size: 12px">${bVos.categoryName}</font> ${bVos.title}(${bVos.commentCount})
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
		    			</tr>
	    			</c:if>
    			</c:forEach>
    		</table>
    	</div>
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
		
		<!-- 검색기 시작 -->
		<div class="text-center search">
		  <!-- <form name="searchForm" method="post" action="boardSearhList"> -->
		  <form name="searchForm" method="get">
		  	<b>검색 : </b>
		  	<select name="search" id="search">
		  	  <option value="title">글제목</option>
		  	  <option value="member_nickname">글쓴이</option>
		  	  <option value="content">글내용</option>
		  	</select>
		  	<input type="text" name="searchString" id="searchString" required />
		  	<input type="submit" value="검색" class="btn btn-secondary btn-sm" />
		  	<input type="hidden" name="pag" value="${pageVo.pag}" />
		  	<input type="hidden" name="pageSize" value="${pageVo.pageSize}" />
		  </form>
		</div>
		<!-- 검색기 끝 -->
	</div>
</body>
</html>