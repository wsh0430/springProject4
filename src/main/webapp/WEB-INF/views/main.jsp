<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>HITBox</title>
  <link rel="icon" type="image/x-icon" href="${ctp}/images/HITBox.ico">
  <link rel="stylesheet" type="text/css" href="${ctp}/css/main.css">
</head>
<body>
  <!-- 네비게이션 바 포함 -->
  <jsp:include page="/WEB-INF/views/include/nav.jsp" />

	<section>
		<div class="main-container">
			<div class="ranking">
			    <h2>야구 팀 순위 (2025년 5월 6일 기준)</h2>
			    <table>
			        <thead>
			            <tr>
			                <th>순위</th>
			                <th>팀명</th>
			                <th>경기</th>
			                <th>승</th>
			                <th>패</th>
			                <th>무</th>
			                <th>승률</th>
			                <th>게임차</th>
			                <th>연속</th>
			            </tr>
			        </thead>
			        <tbody>
			            <tr>
			                <td>1</td>
			                <td>LG 트윈스</td>
			                <td>36</td>
			                <td>23</td>
			                <td>13</td>
			                <td>0</td>
			                <td>0.639</td>
			                <td>-</td>
			                <td>1승</td>
			            </tr>
			            <tr>
			                <td>1</td>
			                <td>한화 이글스</td>
			                <td>36</td>
			                <td>23</td>
			                <td>13</td>
			                <td>0</td>
			                <td>0.639</td>
			                <td>-</td>
			                <td>8승</td>
			            </tr>
			            <tr>
			                <td>3</td>
			                <td>롯데 자이언츠</td>
			                <td>38</td>
			                <td>21</td>
			                <td>16</td>
			                <td>1</td>
			                <td>0.568</td>
			                <td>2.5</td>
			                <td>1승</td>
			            </tr>
			            <tr>
			                <td>4</td>
			                <td>삼성 라이온즈</td>
			                <td>37</td>
			                <td>19</td>
			                <td>17</td>
			                <td>1</td>
			                <td>0.528</td>
			                <td>4</td>
			                <td>4패</td>
			            </tr>
			            <tr>
			                <td>5</td>
			                <td>KT 위즈</td>
			                <td>37</td>
			                <td>18</td>
			                <td>17</td>
			                <td>2</td>
			                <td>0.514</td>
			                <td>4.5</td>
			                <td>2패</td>
			            </tr>
			            <tr>
			                <td>6</td>
			                <td>타이거즈</td>
			                <td>34</td>
			                <td>16</td>
			                <td>18</td>
			                <td>0</td>
			                <td>0.471</td>
			                <td>6</td>
			                <td>2승</td>
			            </tr>
			            <tr>
			                <td>6</td>
			                <td>SSG 랜더스</td>
			                <td>35</td>
			                <td>16</td>
			                <td>18</td>
			                <td>1</td>
			                <td>0.471</td>
			                <td>6</td>
			                <td>1패</td>
			            </tr>
			            <tr>
			                <td>8</td>
			                <td>NC 다이노스</td>
			                <td>32</td>
			                <td>14</td>
			                <td>18</td>
			                <td>0</td>
			                <td>0.438</td>
			                <td>7</td>
			                <td>4승</td>
			            </tr>
			            <tr>
			                <td>9</td>
			                <td>두산 베어스</td>
			                <td>36</td>
			                <td>15</td>
			                <td>20</td>
			                <td>1</td>
			                <td>0.429</td>
			                <td>7.5</td>
			                <td>1패</td>
			            </tr>
			            <tr>
			                <td>10</td>
			                <td>키움 히어로즈</td>
			                <td>39</td>
			                <td>12</td>
			                <td>27</td>
			                <td>0</td>
			                <td>0.308</td>
			                <td>12.5</td>
			                <td>4패</td>
			            </tr>
			        </tbody>
			    </table>
			</div>
			<div>여기가 kbo경기 일정</div>
			<div>여기가 하이라이트</div>
			<div class="clubs">
				<a href="https://tigers.co.kr/"><img alt="KIA" src="${ctp}/images/KIA.jpg"></a>
				<a href="https://www.samsunglions.com/"><img alt="삼성" src="${ctp}/images/삼성.png"></a>
				<a href="https://www.lgtwins.com/service/html.ncd?view=/pc_twins/twins_main/twins_main"><img alt="LG" src="${ctp}/images/LG.png"></a>
				<a href="https://www.doosanbears.com/"><img alt="두산" src="${ctp}/images/두산.png"></a>
				<a href="https://www.ncdinos.com/"><img alt="NC" src="${ctp}/images/NC.png"></a>
				<a href="https://www.ktwiz.co.kr/sports/site/baseball/main.do"><img alt="KT" src="${ctp}/images/KT.png"></a>
				<a href="https://www.giantsclub.com/html/"><img alt="롯데" src="${ctp}/images/롯데.png"></a>
				<a href="https://www.hanwhaeagles.co.kr/index.do"><img alt="한화" src="${ctp}/images/한화.png"></a>
				<a href="https://www.ssglanders.com/main"><img alt="SSG" src="${ctp}/images/SSG.png"></a>
				<a href="https://heroesbaseball.co.kr/index.do"><img alt="키움" src="${ctp}/images/키움.png"></a>
			</div>
			<div>
			<div>kbo뉴스</div>
			<div>HITBox 최신글</div>
			</div>
		</div>
	</section>




  <!-- 푸터 포함 -->
  <jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>