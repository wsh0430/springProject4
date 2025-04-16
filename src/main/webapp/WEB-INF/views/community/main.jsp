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
    		location.href = "main?pageSize="+pageSize;
   		 }
  </script>
    <style>
    	#main{
    		min-width: 80%; 		
    	}	
    </style>
</head>
<body>
    <div id="main">
    	<div id="category">
    		<table>
    			<tr>
    				<c:forEach var="mcVos" items="${mainCtgyVos}" varStatus="st">
    					<td class="w3-dropdown-hover w3-hide-small">
    						<a href="main?category=${mcVos.name}">
    							<button class="w3-padding-large w3-button" title="More">${mcVos.name}<i class="fa fa-caret-down"></i></button>     
    						</a>
    						<div class="w3-dropdown-content w3-bar-block w3-card-4">
    							<c:forEach var="scVos" items="${subCtgy[st.index]}">
									<a href="main?category=${scVos.name}">${scVos.name}</a>			
		    					</c:forEach>
    						</div>
    					</td>
    				</c:forEach>
    			</tr>
    		</table>
    	</div>
    	<div id="board">
			<span>선택 카테고리</span>
			<table class="table table-borderless m-0 p-0">
				<tr>
					<td><a href="#" class="btn btn-success btn-sm">글쓰기</a></td>
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
			<table>
    			<c:forEach var="bVos" items="${boardVos}">
	    			<tr>
	    				<td>${bVos.idx}</td>
	    				<td>${bVos.title}(${bVos.commentCount})</td>
	    				<td>${bVos.memberNickname}</td>
	    				<td>
	    					<c:if test="${bVos.createdAt == updateAt}">
	    						${bVos.createdAt}
	    					</c:if>
	    					<c:if test="${bVos.createdAt != updateAt}">
	    						${bVos.updateAt}(수정됨)
	    					</c:if>
	    				</td>
	    				<td>${bVos.viewCount}</td>
	    				<td>${bVos.likeCount}</td>
	    			</tr>
    			</c:forEach>
    		</table>
    	</div>
    	<!-- 블록페이지 시작 -->
		<div class="text-center">
		  <ul class="pagination justify-content-center">
		    <c:if test="${pageVo.pag > 1}"><li class="page-item"><a class="page-link text-secondary" href="main?pag=1&pageSize=${pageSize}">첫페이지</a></li></c:if>
		  	<c:if test="${pageVo.curBlock > 0}"><li class="page-item"><a class="page-link text-secondary" href="main?pag=${(curBlock-1)*blockSize+1}&pageSize=${pageVo.pageSize}">이전블록</a></li></c:if>
		  	<c:forEach var="i" begin="${(pageVo.curBlock*pageVo.blockSize)+1}" end="${(pageVo.curBlock*pageVo.blockSize)+pageVo.blockSize}" varStatus="st">
			    <c:if test="${i <= pageVo.totPage && i == pageVo.pag}"><li class="page-item active"><a class="page-link bg-secondary border-secondary" href="main?pag=${i}&pageSize=${pageVo.pageSize}">${i}</a></li></c:if>
			    <c:if test="${i <= pageVo.totPage && i != pageVo.pag}"><li class="page-item"><a class="page-link text-secondary" href="main?pag=${i}&pageSize=${pageVo.pageSize}">${i}</a></li></c:if>
		  	</c:forEach>
		  	<c:if test="${pageVo.curBlock < pageVo.lastBlock}"><li class="page-item"><a class="page-link text-secondary" href="main?pag=${(pageVo.curBlock+1)*pageVo.blockSize+1}&pageSize=${pageVo.pageSize}">다음블록</a></li></c:if>
		  	<c:if test="${pageVo.pag < pageVo.totPage}"><li class="page-item"><a class="page-link text-secondary" href="main?pag=${pageVo.totPage}&pageSize=${pageVo.pageSize}">마지막페이지</a></li></c:if>
		  </ul>
		</div>
		<!-- 블록페이지 끝 -->
		<br/>
		<!-- 검색기 시작 -->
		<div class="text-center">
		  <!-- <form name="searchForm" method="post" action="boardSearhList"> -->
		  <form name="searchForm" method="get">
		  	<b>검색 : </b>
		  	<select name="search" id="search">
		  	  <option value="title">글제목</option>
		  	  <option value="nickName">글쓴이</option>
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