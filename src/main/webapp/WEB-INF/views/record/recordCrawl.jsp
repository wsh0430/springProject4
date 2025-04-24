<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>recordCrawl.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs5.jsp" />
	<script>
		'use strict';
		// 페이지가 로드되면 자동으로 크롤링 시작
/* 		window.onload = function() {
			crawling2();
		}; */

		//시즌(타자)
		function hitterstat() {
		    $("#spinnerIcon").show();
		    let sortOptions = $("#sortOptions").val(); // 다중 선택 값 배열
		    let orderBy = $("#orderBy").val(); // DESC or ASC
		    let startYear = $("#startYear").val();
		    let endYear = $("#endYear").val();
		    let team = $("#team").val();
		    let positionOrder = $("#positionOrder").val();
		    
		    $.ajax({
		        url: "HitterRecord",
		        type: "post",
		        data: {
		        		sortOptions: sortOptions,
		        		orderBy: orderBy,
		            startYear: startYear,
		            endYear: endYear,
		            team: team,
		            positionOrder: positionOrder
		        },
		        success:function(vos) {
		            if(vos.length > 0) {
		                let str = '<table class="table table-bordered text-center align-middle">';
		                str += '<tr class="table-secondary">';
		                str += '<th>선수명</th><th>팀로고</th><th>년도</th><th>포지션</th>';
		                str += '<th>WAR</th><th>경기</th><th>타석</th><th>타수</th><th>득점</th><th>안타</th>';
		                str += '<th>2루타</th><th>3루타</th><th>루타</th><th>타점</th><th>홈런</th><th>도루</th>';
		                str += '<th>도루실패</th><th>사사구</th><th>삼진</th><th>병살</th>';
		                str += '<th>희생타</th><th>희생플라이</th><th>타율</th><th>출루율</th><th>장타율</th><th>OPS</th>';
		                str += '</tr>';

		                for(let i = 0; i < vos.length; i++) {
		                    str += '<tr>';
		                    str += '<td>'+vos[i].player+'</td>';
		                    str += '<td><img src="'+vos[i].teamLogo+'" width="40px"/></td>';
		                    str += '<td>'+vos[i].year+'</td>';
		                    str += '<td>'+vos[i].position+'</td>';
		                    str += '<td>'+vos[i].war+'</td>';
		                    str += '<td>'+vos[i].games+'</td>';
		                    str += '<td>'+vos[i].tasuk+'</td>';
		                    str += '<td>'+vos[i].atBats+'</td>';
		                    str += '<td>'+vos[i].runs+'</td>';
		                    str += '<td>'+vos[i].hits+'</td>';
		                    str += '<td>'+vos[i].doubles+'</td>';
		                    str += '<td>'+vos[i].triples+'</td>';
		                    str += '<td>'+vos[i].totalBases+'</td>';
		                    str += '<td>'+vos[i].rbi+'</td>'; 
		                    str += '<td>'+vos[i].homeRuns+'</td>';
		                    str += '<td>'+vos[i].stolenBases+'</td>';
		                    str += '<td>'+vos[i].stolenBasesFail+'</td>';
		                    str += '<td>'+vos[i].bb+'</td>';
		                    str += '<td>'+vos[i].strikeouts+'</td>';
		                    str += '<td>'+vos[i].doublePlays+'</td>';
		                    str += '<td>'+vos[i].sacHits+'</td>';
		                    str += '<td>'+vos[i].sacFlies+'</td>';
		                    str += '<td>'+vos[i].avg.toFixed(3)+'</td>';
		                    str += '<td>'+vos[i].obp.toFixed(3)+'</td>';
		                    str += '<td>'+vos[i].slg.toFixed(3)+'</td>';
		                    str += '<td>'+vos[i].ops.toFixed(3)+'</td>';
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
		            alert("전송 오류!");
		            $("#spinnerIcon").hide();
		        }
		    });
		}
		
		//시즌(투수)
		function pitcherstat() {
		    $("#spinnerIcon").show();
		    let sortOptionsPic = $("#sortOptionsPic").val(); // 다중 선택 값 배열
		    let orderByPic = $("#orderByPic").val(); // DESC or ASC
		    let startYearPic = $("#startYearPic").val();
		    let endYearPic = $("#endYearPic").val();
		    let teamPic = $("#teamPic").val();
		    
		    $.ajax({
		        url: "PitcherRecord",  // 투수용 URL
		        type: "post",
		        data: {
		            sortOptionsPic: sortOptionsPic,
		            orderByPic: orderByPic,
		            startYearPic: startYearPic,
		            endYearPic: endYearPic,
		            teamPic: teamPic
		        },
		        success:function(vos) {
		            if(vos.length > 0) {
		                let str = '<table class="table table-bordered text-center align-middle">';
		                str += '<tr class="table-secondary">';
		                str += '<th>선수명</th><th>팀로고</th><th>년도</th>';
		                str += '<th>WAR</th><th>경기</th><th>선발경기</th><th>완투</th><th>완봉</th>';
		                str += '<th>승리</th><th>패배</th><th>세이브</th><th>홀드</th><th>이닝</th>';
		                str += '<th>자책점</th><th>실점</th><th>피안타</th><th>피홈런</th>';
		                str += '<th>볼넷</th><th>삼진</th><th>폭투</th><th>볼넷+사구</th><th>ERA</th><th>FIP</th><th>WHIP</th>';
		                str += '</tr>';

		                for(let i = 0; i < vos.length; i++) {
		                    str += '<tr>';
		                    str += '<td>'+vos[i].player+'</td>';
		                    str += '<td><img src="'+vos[i].teamLogo+'" width="40px"/></td>';
		                    str += '<td>'+vos[i].year+'</td>';
		                    str += '<td>'+vos[i].war+'</td>';
		                    str += '<td>'+vos[i].gamesP+'</td>';
		                    str += '<td>'+vos[i].gamesStart+'</td>';
		                    str += '<td>'+vos[i].completeGames+'</td>';
		                    str += '<td>'+vos[i].shutouts+'</td>';
		                    str += '<td>'+vos[i].wins+'</td>';
		                    str += '<td>'+vos[i].losses+'</td>';
		                    str += '<td>'+vos[i].saves+'</td>';
		                    str += '<td>'+vos[i].holds+'</td>';
		                    str += '<td>'+vos[i].innings.toFixed(1)+'</td>';
		                    str += '<td>'+vos[i].earnedRuns+'</td>';
		                    str += '<td>'+vos[i].runsAllowed+'</td>';
		                    str += '<td>'+vos[i].hitsAllowed+'</td>';
		                    str += '<td>'+vos[i].homeRunsAllowed+'</td>';
		                    str += '<td>'+vos[i].bbAllowed+'</td>';
		                    str += '<td>'+vos[i].strikeouts+'</td>';
		                    str += '<td>'+vos[i].wildPitches+'</td>';
		                    str += '<td>'+vos[i].bbAllowed+'</td>';
		                    str += '<td>'+vos[i].era.toFixed(3)+'</td>';
		                    str += '<td>'+vos[i].fip.toFixed(3)+'</td>';
		                    str += '<td>'+vos[i].whip.toFixed(3)+'</td>';
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
		            alert("전송 오류!");
		            $("#spinnerIcon").hide();
		        }
		    });
		}
		
		//통산(타자)
		function hittertotalstat() {
		    $("#spinnerIcon").show();

		    let sortOptions = $("#sortOptionsTotal").val();
		    let orderBy = $("#orderByTotal").val();
		    let startYear = $("#startYearTotal").val();
		    let endYear = $("#endYearTotal").val();
		    let team = $("#teamTotal").val();
		    let positionOrder = $("#positionOrderTotal").val();

		    $.ajax({
		        url: "HitterTotalRecord",
		        type: "post",
		        data: {
		            sortOptionsTotal: sortOptions,
		            orderByTotal: orderBy,
		            startYearTotal: startYear,
		            endYearTotal: endYear,
		            teamTotal: team,
		            positionOrderTotal: positionOrder
		        },
		        success: function(vos) {
		            if (vos.length > 0) {
		                let str = '<table class="table table-bordered text-center align-middle">';
		                str += '<tr class="table-secondary">';
		                str += '<th>선수명</th><th>팀</th><th>은퇴년도</th><th>포지션</th>';
		                str += '<th>WAR</th><th>경기</th><th>타석</th><th>타수</th><th>득점</th><th>안타</th>';
		                str += '<th>2루타</th><th>3루타</th><th>루타</th><th>타점</th><th>홈런</th><th>도루</th>';
		                str += '<th>도루실패</th><th>사사구</th><th>삼진</th><th>병살</th>';
		                str += '<th>희생타</th><th>희생플라이</th><th>타율</th><th>출루율</th><th>장타율</th><th>OPS</th>';
		                str += '</tr>';

		                for (let i = 0; i < vos.length; i++) {
		                    str += '<tr>';
		                    str += '<td>' + vos[i].player + '</td>';
		                    str += '<td>' + vos[i].teamLogo + '</td>';
		                    str += '<td>' + vos[i].year + '</td>';
		                    str += '<td>' + vos[i].position + '</td>';
		                    str += '<td>' + vos[i].war + '</td>';
		                    str += '<td>' + vos[i].games + '</td>';
		                    str += '<td>' + vos[i].tasuk + '</td>';
		                    str += '<td>' + vos[i].atBats + '</td>';
		                    str += '<td>' + vos[i].runs + '</td>';
		                    str += '<td>' + vos[i].hits + '</td>';
		                    str += '<td>' + vos[i].doubles + '</td>';
		                    str += '<td>' + vos[i].triples + '</td>';
		                    str += '<td>' + vos[i].totalBases + '</td>';
		                    str += '<td>' + vos[i].rbi + '</td>';
		                    str += '<td>' + vos[i].homeRuns + '</td>';
		                    str += '<td>' + vos[i].stolenBases + '</td>';
		                    str += '<td>' + vos[i].stolenBasesFail + '</td>';
		                    str += '<td>' + vos[i].bb + '</td>';
		                    str += '<td>' + vos[i].strikeouts + '</td>';
		                    str += '<td>' + vos[i].doublePlays + '</td>';
		                    str += '<td>' + vos[i].sacHits + '</td>';
		                    str += '<td>' + vos[i].sacFlies + '</td>';
		                    str += '<td>' + vos[i].avg.toFixed(3) + '</td>';
		                    str += '<td>' + vos[i].obp.toFixed(3) + '</td>';
		                    str += '<td>' + vos[i].slg.toFixed(3) + '</td>';
		                    str += '<td>' + vos[i].ops.toFixed(3) + '</td>';
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
		            alert("전송 오류!");
		            $("#spinnerIcon").hide();
		        }
		    });
		}
		
		//통산(투수)
		function pitchertotalstat() {
		    $("#spinnerIcon").show();

		    let sortOptions = $("#sortOptionsTotalPic").val();
		    let orderBy = $("#orderByTotalPic").val();
		    let startYear = $("#startYearTotalPic").val();
		    let endYear = $("#endYearTotalPic").val();
		    let team = $("#teamTotalPic").val();

		    $.ajax({
		        url: "PitcherTotalRecord",
		        type: "post",
		        data: {
		            sortOptionsTotalPic: sortOptions,
		            orderByTotalPic: orderBy,
		            startYearTotalPic: startYear,
		            endYearTotalPic: endYear,
		            teamTotalPic: team
		        },
		        success: function(vos) {
		            if (vos.length > 0) {
		                let str = '<table class="table table-bordered text-center align-middle">';
		                str += '<tr class="table-secondary">';
		                str += '<th>선수명</th><th>팀</th><th>연도</th>';
		                str += '<th>WAR</th><th>등판</th><th>선발</th><th>완투</th><th>완봉</th>';
		                str += '<th>승</th><th>패</th><th>세</th><th>홀드</th><th>이닝</th><th>자책</th><th>실점</th>';
		                str += '<th>피안타</th><th>피홈런</th><th>볼넷</th><th>삼진</th>';
		                str += '<th>보크</th><th>폭투</th><th>ERA</th><th>FIP</th><th>WHIP</th>';
		                str += '</tr>';

		                for (let i = 0; i < vos.length; i++) {
		                    str += '<tr>';
		                    str += '<td>' + vos[i].player + '</td>';
		                    str += '<td>' + vos[i].teamLogo + '</td>';
		                    str += '<td>' + vos[i].year + '</td>';
		                    str += '<td>' + vos[i].war + '</td>';
		                    str += '<td>' + vos[i].gamesP + '</td>';
		                    str += '<td>' + vos[i].gamesStart + '</td>';
		                    str += '<td>' + vos[i].completeGames + '</td>';
		                    str += '<td>' + vos[i].shutouts + '</td>';
		                    str += '<td>' + vos[i].wins + '</td>';
		                    str += '<td>' + vos[i].losses + '</td>';
		                    str += '<td>' + vos[i].saves + '</td>';
		                    str += '<td>' + vos[i].holds + '</td>';
		                    str += '<td>' + vos[i].innings + '</td>';
		                    str += '<td>' + vos[i].earnedRuns + '</td>';
		                    str += '<td>' + vos[i].runsAllowed + '</td>';
		                    str += '<td>' + vos[i].hitsAllowed + '</td>';
		                    str += '<td>' + vos[i].homeRunsAllowed + '</td>';
		                    str += '<td>' + vos[i].bbAllowed + '</td>';
		                    str += '<td>' + vos[i].strikeouts + '</td>';
		                    str += '<td>' + vos[i].balks + '</td>';
		                    str += '<td>' + vos[i].wildPitches + '</td>';
		                    str += '<td>' + vos[i].era.toFixed(2) + '</td>';
		                    str += '<td>' + vos[i].fip.toFixed(2) + '</td>';
		                    str += '<td>' + vos[i].whip.toFixed(2) + '</td>';
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
		            alert("전송 오류!");
		            $("#spinnerIcon").hide();
		        }
		    });
		}
		
		//팀(타자)
    function teamHitterRecord() {
        $("#spinnerIcon").show();

        let teamssortOptionshit = $("#teamssortOptionshit").val();
        let teamsorderByhit = $("#teamsorderByhit").val();
        let teamsstartYearhit = $("#teamsstartYearhit").val();
        let teamsendYearhit = $("#teamsendYearhit").val();
        let teamsteamhit = $("#teamsteamhit").val();
        let teamspositionOrderhit = $("#teamspositionOrderhit").val();

        $.ajax({
            url: "TeamHitterRecord",
            type: "post",
            data: {
            	teamssortOptionshit: teamssortOptionshit,
            	teamsorderByhit: teamsorderByhit,
            	teamsstartYearhit: teamsstartYearhit,
            	teamsendYearhit: teamsendYearhit,
            	teamsteamhit: teamsteamhit,
            	teamspositionOrderhit: teamspositionOrderhit
            },
            success: function(vos) {
                if (vos.length > 0) {
                    let str = '<table class="table table-bordered text-center align-middle">';
                    str += '<tr class="table-warning">';
                    str += '<th>팀명</th><th>로고</th><th>연도</th><th>WAR</th>';
                    str += '<th>경기</th><th>타석</th><th>타수</th><th>득점</th><th>안타</th>';
                    str += '<th>2루타</th><th>3루타</th><th>루타</th><th>홈런</th><th>타점</th><th>도루</th>';
                    str += '<th>도루실패</th><th>사사구</th><th>삼진</th><th>병살</th>';
                    str += '<th>희생타</th><th>희생플라이</th><th>타율</th><th>출루율</th><th>장타율</th><th>OPS</th>';
                    str += '</tr>';

                    for (let i = 0; i < vos.length; i++) {
                        str += '<tr>';
                        str += '<td>' + vos[i].teamName + '</td>';
                        str += '<td><img src="' + vos[i].teamLogo + '" alt="로고" width="30"></td>';
                        str += '<td>' + vos[i].year + '</td>';
                        str += '<td>' + vos[i].war + '</td>';
                        str += '<td>' + vos[i].games + '</td>';
                        str += '<td>' + vos[i].tasuk + '</td>';
                        str += '<td>' + vos[i].atBats + '</td>';
                        str += '<td>' + vos[i].runs + '</td>';
                        str += '<td>' + vos[i].hits + '</td>';
                        str += '<td>' + vos[i].doubles + '</td>';
                        str += '<td>' + vos[i].triples + '</td>';
                        str += '<td>' + vos[i].totalBases + '</td>';
                        str += '<td>' + vos[i].homeRuns + '</td>';
                        str += '<td>' + vos[i].rbi + '</td>';
                        str += '<td>' + vos[i].stolenBases + '</td>';
                        str += '<td>' + vos[i].stolenBasesFail + '</td>';
                        str += '<td>' + vos[i].bb + '</td>';
                        str += '<td>' + vos[i].strikeouts + '</td>';
                        str += '<td>' + vos[i].doublePlays + '</td>';
                        str += '<td>' + vos[i].sacHits + '</td>';
                        str += '<td>' + vos[i].sacFlies + '</td>';
                        str += '<td>' + vos[i].avg.toFixed(3) + '</td>';
                        str += '<td>' + vos[i].obp.toFixed(3) + '</td>';
                        str += '<td>' + vos[i].slg.toFixed(3) + '</td>';
                        str += '<td>' + vos[i].ops.toFixed(3) + '</td>';
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
                alert("전송 오류!");
                $("#spinnerIcon").hide();
            }
        });
    }
		
		
 // 팀(투수)
    function teamPitcherRecord() {
        $("#spinnerIcon").show();

        let teamssortOptionsPic = $("#teamssortOptionsPic").val();
        let teamsorderByPic = $("#teamsorderByPic").val();
        let teamsstartYearPic = $("#teamsstartYearPic").val();
        let teamsendYearPic = $("#teamsendYearPic").val();
        let teamsteamPic = $("#teamsteamPic").val();
        let teamspositionOrderPic = $("#teamspositionOrderPic").val();

        $.ajax({
            url: "TeamPitcherRecord",
            type: "post",
            data: {
                teamssortOptionsPic: teamssortOptionsPic,
                teamsorderByPic: teamsorderByPic,
                teamsstartYearPic: teamsstartYearPic,
                teamsendYearPic: teamsendYearPic,
                teamsteamPic: teamsteamPic,
                teamspositionOrderPic: teamspositionOrderPic
            },
            success: function(vos) {
                if (vos.length > 0) {
                    let str = '<table class="table table-bordered text-center align-middle">';
                    str += '<tr class="table-warning">';
                    str += '<th>팀명</th><th>로고</th><th>연도</th><th>WAR</th><th>경기</th><th>선발</th><th>완투</th>';
                    str += '<th>완봉</th><th>승</th><th>패</th><th>세이브</th><th>홀드</th>';
                    str += '<th>이닝</th><th>자책</th><th>실점</th><th>피안타</th><th>피홈런</th>';
                    str += '<th>볼넷</th><th>삼진</th><th>보크</th><th>폭투</th>';
                    str += '<th>ERA</th><th>FIP</th><th>WHIP</th>';
                    str += '</tr>';

                    for (let i = 0; i < vos.length; i++) {
                        str += '<tr>';
                        str += '<td>' + vos[i].teamName + '</td>';
                        str += '<td><img src="' + vos[i].teamLogo + '" alt="로고" width="30"></td>';
                        str += '<td>' + vos[i].year + '</td>';
                        str += '<td>' + vos[i].war + '</td>';
                        str += '<td>' + vos[i].gamesP + '</td>';
                        str += '<td>' + vos[i].gamesStart + '</td>';
                        str += '<td>' + vos[i].completeGames + '</td>';
                        str += '<td>' + vos[i].shutouts + '</td>';
                        str += '<td>' + vos[i].wins + '</td>';
                        str += '<td>' + vos[i].losses + '</td>';
                        str += '<td>' + vos[i].saves + '</td>';
                        str += '<td>' + vos[i].holds + '</td>';
                        str += '<td>' + vos[i].innings + '</td>';
                        str += '<td>' + vos[i].earnedRuns + '</td>';
                        str += '<td>' + vos[i].runsAllowed + '</td>';
                        str += '<td>' + vos[i].hitsAllowed + '</td>';
                        str += '<td>' + vos[i].homeRunsAllowed + '</td>';
                        str += '<td>' + vos[i].bbAllowed + '</td>';
                        str += '<td>' + vos[i].strikeouts + '</td>';
                        str += '<td>' + vos[i].balks + '</td>';
                        str += '<td>' + vos[i].wildPitches + '</td>';
                        str += '<td>' + vos[i].era.toFixed(2) + '</td>';
                        str += '<td>' + vos[i].fip.toFixed(2) + '</td>';
                        str += '<td>' + vos[i].whip.toFixed(2) + '</td>';
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
                alert("전송 오류!");
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
  <h2>SELENIUM 연습</h2>
  <hr class="border-secondary">
  <div><a href="javascript:location.reload()" class="btn btn-warning form-control">다시검색</a></div>
  <hr class="border-secondary">
  <div id="demo"></div>
  <hr class="border-secondary">
  
  <h4>시즌기록실</h4>
  <div class="input-group mb-3">
    <div class="input-group-text">타자 기록 조회</div>
    <div class="input-group mb-3">
    
  	  <label for="sortOptions">정렬 기준 선택:</label><br>
			<select id="sortOptions" name="sortOptions">
			  <option value="WAR">WAR</option>
			  <option value="R">득점 (R)</option>
			  <option value="H">안타 (H)</option>
			  <option value="2B">2루타</option>
			  <option value="3B">3루타</option>
			  <option value="HR">홈런</option>
			  <option value="TB">누타수 (TB)</option>
			  <option value="RBI">타점</option>
			  <option value="SB">도루</option>
			  <option value="CS">도루실패</option>
			  <option value="BB">볼넷</option>
			  <option value="SO">삼진</option>
			  <option value="GDP">병살</option>
			  <option value="SH">희생번트</option>
			  <option value="SF">희생플라이</option>
			  <option value="AVG">타율</option>
			  <option value="OBP">출루율</option>
			  <option value="SLG">장타율</option>
			  <option value="OPS">OPS</option>
			  <option value="PA">타석</option>
			  <option value="AB">타수</option>
			  <option value="year">연도</option>
			</select>
			
		  <label for="orderBy">정렬 방향:</label><br>
			<select id="orderBy" name="orderBy">
			  <option value="DESC" selected>내림차순 (높은 순)</option>
			  <option value="ASC">오름차순 (낮은 순)</option>
			</select><br><br>
			
			<label for="team">팀</label><br>
			<select id="team" class="form-select">
			  <option value="">전체</option>
			  <option value="9002">SSG</option>
			  <option value="5002">LG</option>
			  <option value="12001">KT</option>
			  <option value="11001">NC</option>
			  <option value="2002">KIA</option>
			  <option value="1001">삼성</option>
			  <option value="6002">두산</option>
			  <option value="3001">롯데</option>
			  <option value="7002">한화</option>
			  <option value="10001">키움</option>
			  <!-- 올드팀 -->
			  <option value="9001">SK</option>
			  <option value="10003">넥센</option>
			  <option value="10002">히어로즈</option>
			  <option value="6001">OB</option>
			  <option value="2001">해태</option>
			  <option value="5001">MBC</option>
			  <option value="4004">현대</option>
			  <option value="8001">쌍방울</option>
			  <option value="4001">삼미</option>
			  <option value="7001">빙그레</option>
			</select>
			
			<label for="positionOrder">포지션</label><br>
			<select id="positionOrder" class="form-select">
			  <option value="">전체</option>
			  <option value="1">투수</option>
			  <option value="2">포수</option>
			  <option value="3">1루수</option>
			  <option value="4">2루수</option>
			  <option value="5">3루수</option>
			  <option value="6">유격수</option>
			  <option value="7">좌익수</option>
			  <option value="8">중견수</option>
			  <option value="9">우익수</option>
			  <option value="10">지명타자</option>
			  <option value="13">내야수</option>
			  <option value="14">외야수</option>
			</select>
			
	    <label for="startYear" class="input-group-text">시작 년도</label>
	    <select id="startYear" class="form-select">
        <c:forEach var="i" begin="1982" end="2025">
          <option value="${i}">${i}</option>
        </c:forEach>
	    </select>
	
	    <label for="endYear" class="input-group-text">끝 년도</label>
	    <select id="endYear" class="form-select">
        <c:forEach var="i" begin="1982" end="2025">
          <option value="${i}" <c:if test="${i == 2025}">selected</c:if>>${i}</option>
        </c:forEach>
	    </select>
		</div>
    <input type="button" value="크롤링3" onclick="hitterstat()" class="btn btn-success"/>
    <div class="input-group-append">
      <span id="spinnerIcon" style="display:none">
	      <span class="spinner-border"></span>
	      &nbsp;&nbsp; 데이터를 입력하는 중입니다. &nbsp;&nbsp;
	      <span class="spinner-border"></span>
      </span>
    </div>
  </div>
  <hr class="border">
	<div class="input-group mb-3">
	    <div class="input-group-text">투수 기록 조회</div>
	    <div class="input-group mb-3">
		
		    <label for="sortOptionsPic">정렬 기준 선택:</label><br>
		    <select id="sortOptionsPic" name="sortOptionsPic">
	        <option value="WAR">WAR</option>
	        <option value="R">실점 (R)</option>
	        <option value="H">피안타 (H)</option>
	        <option value="HR">피홈런</option>
	        <option value="BB">볼넷</option>
	        <option value="SO">삼진</option>
	        <option value="ERA">자책점</option>
	        <option value="FIP">FIP</option>
	        <option value="WHIP">WHIP</option>
	        <option value="year">연도</option>
		    </select>
		    
		    <label for="orderByPic">정렬 방향:</label><br>
		    <select id="orderByPic" name="orderByPic">
	        <option value="DESC" selected>내림차순 (높은 순)</option>
	        <option value="ASC">오름차순 (낮은 순)</option>
		    </select><br><br>
		    
		    <label for="teamPic">팀</label><br>
		    <select id="teamPic" class="form-select">
	        <option value="">전체</option>
	        <option value="9002">SSG</option>
	        <option value="5002">LG</option>
	        <option value="12001">KT</option>
	        <option value="11001">NC</option>
	        <option value="2002">KIA</option>
	        <option value="1001">삼성</option>
	        <option value="6002">두산</option>
	        <option value="3001">롯데</option>
	        <option value="7002">한화</option>
	        <option value="10001">키움</option>
		    </select>
		    
		    <label for="startYearPic" class="input-group-text">시작 년도</label>
		    <select id="startYearPic" class="form-select">
	        <c:forEach var="j" begin="1982" end="2025">
	            <option value="${j}">${j}</option>
	        </c:forEach>
		    </select>
		
		    <label for="endYearPic" class="input-group-text">끝 년도</label>
		    <select id="endYearPic" class="form-select">
		      <c:forEach var="j" begin="1982" end="2025">
		          <option value="${j}" <c:if test="${j == 2025}">selected</c:if>>${j}</option>
		      </c:forEach>
		    </select>
	    </div>
	    <input type="button" value="크롤링" onclick="pitcherstat()" class="btn btn-success"/>
	    <div class="input-group-append">
	        <span id="spinnerIcon" style="display:none">
	            <span class="spinner-border"></span>
	            &nbsp;&nbsp; 데이터를 입력하는 중입니다. &nbsp;&nbsp;
	            <span class="spinner-border"></span>
	        </span>
	    </div>
	</div>
	
	
	<div class="input-group mb-3">
    <div class="input-group-text">통산 타자 기록 조회</div>

    <label for="sortOptionsTotal">정렬 기준 선택:</label>
    <select id="sortOptionsTotal" name="sortOptionsTotal" class="form-select">
        <option value="WAR">WAR</option>
        <option value="R">득점</option>
        <option value="H">안타</option>
        <option value="2B">2루타</option>
        <option value="3B">3루타</option>
        <option value="HR">홈런</option>
        <option value="TB">누타수</option>
        <option value="RBI">타점</option>
        <option value="SB">도루</option>
        <option value="CS">도루실패</option>
        <option value="BB">볼넷</option>
        <option value="SO">삼진</option>
        <option value="GDP">병살</option>
        <option value="SH">희생번트</option>
        <option value="SF">희생플라이</option>
        <option value="AVG">타율</option>
        <option value="OBP">출루율</option>
        <option value="SLG">장타율</option>
        <option value="OPS">OPS</option>
        <option value="PA">타석</option>
        <option value="AB">타수</option>
        <option value="year">연도</option>
    </select>

    <label for="orderByTotal">정렬 방향:</label>
    <select id="orderByTotal" name="orderByTotal" class="form-select">
        <option value="DESC" selected>내림차순</option>
        <option value="ASC">오름차순</option>
    </select>

    <label for="teamTotal">팀 선택:</label>
    <select id="teamTotal" class="form-select">
        <option value="">전체</option>
        <option value="9002">SSG</option>
        <option value="5002">LG</option>
        <option value="12001">KT</option>
        <option value="11001">NC</option>
        <option value="2002">KIA</option>
        <option value="1001">삼성</option>
        <option value="6002">두산</option>
        <option value="3001">롯데</option>
        <option value="7002">한화</option>
        <option value="10001">키움</option>
        <!-- 올드팀 생략 가능 -->
    </select>

    <label for="positionOrderTotal">포지션:</label>
    <select id="positionOrderTotal" class="form-select">
        <option value="">전체</option>
        <option value="1">투수</option>
        <option value="2">포수</option>
        <option value="3">1루수</option>
        <option value="4">2루수</option>
        <option value="5">3루수</option>
        <option value="6">유격수</option>
        <option value="7">좌익수</option>
        <option value="8">중견수</option>
        <option value="9">우익수</option>
        <option value="10">지명타자</option>
        <option value="13">내야수</option>
        <option value="14">외야수</option>
    </select>

    <label for="startYearTotal">시작 년도:</label>
    <select id="startYearTotal" class="form-select">
        <c:forEach var="t" begin="1982" end="2025">
            <option value="${t}">${t}</option>
        </c:forEach>
    </select>

    <label for="endYearTotal">종료 년도:</label>
    <select id="endYearTotal" class="form-select">
        <c:forEach var="t" begin="1982" end="2025">
		          <option value="${t}" <c:if test="${t == 2025}">selected</c:if>>${t}</option>
        </c:forEach>
    </select>

    <input type="button" value="크롤링" onclick="hittertotalstat()" class="btn btn-success"/>
	    <div class="input-group-append">
	        <span id="spinnerIcon" style="display:none">
	            <span class="spinner-border"></span>
	            &nbsp;&nbsp; 데이터를 입력하는 중입니다. &nbsp;&nbsp;
	            <span class="spinner-border"></span>
	        </span>
	    </div>
	</div>
	
	<div class="input-group mb-3">
    <div class="input-group-text">통산 투수 기록 조회</div>

    <label for="sortOptionsTotalPic">정렬 기준 선택:</label>
    <select id="sortOptionsTotalPic" name="sortOptionsTotalPic" class="form-select">
        <option value="WAR">WAR</option>
        <option value="ERA">평균자책점</option>
        <option value="G">등판</option>
        <option value="GS">선발</option>
        <option value="CG">완투</option>
        <option value="SHO">완봉</option>
        <option value="W">승</option>
        <option value="L">패</option>
        <option value="SV">세이브</option>
        <option value="HLD">홀드</option>
        <option value="IP">이닝</option>
        <option value="ER">자책</option>
        <option value="R">실점</option>
        <option value="H">피안타</option>
        <option value="HR">피홈런</option>
        <option value="BB">볼넷</option>
        <option value="SO">삼진</option>
        <option value="BK">보크</option>
        <option value="WP">폭투</option>
        <option value="FIP">FIP</option>
        <option value="WHIP">WHIP</option>
        <option value="year">연도</option>
    </select>

    <label for="orderByTotalPic">정렬 방향:</label>
    <select id="orderByTotalPic" name="orderByTotalPic" class="form-select">
        <option value="DESC" selected>내림차순</option>
        <option value="ASC">오름차순</option>
    </select>

    <label for="teamTotalPic">팀 선택:</label>
    <select id="teamTotalPic" class="form-select">
        <option value="">전체</option>
        <option value="9002">SSG</option>
        <option value="5002">LG</option>
        <option value="12001">KT</option>
        <option value="11001">NC</option>
        <option value="2002">KIA</option>
        <option value="1001">삼성</option>
        <option value="6002">두산</option>
        <option value="3001">롯데</option>
        <option value="7002">한화</option>
        <option value="10001">키움</option>
    </select>

    <label for="startYearTotalPic">시작 년도:</label>
    <select id="startYearTotalPic" class="form-select">
        <c:forEach var="t" begin="1982" end="2025">
            <option value="${t}">${t}</option>
        </c:forEach>
    </select>

    <label for="endYearTotalPic">종료 년도:</label>
    <select id="endYearTotalPic" class="form-select">
        <c:forEach var="t" begin="1982" end="2025">
            <option value="${t}" <c:if test="${t == 2025}">selected</c:if>>${t}</option>
        </c:forEach>
    </select>

    <input type="button" value="크롤링" onclick="pitchertotalstat()" class="btn btn-primary"/>
    <div class="input-group-append">
        <span id="spinnerIcon" style="display:none">
            <span class="spinner-border"></span>
            &nbsp;&nbsp; 데이터를 입력하는 중입니다. &nbsp;&nbsp;
            <span class="spinner-border"></span>
        </span>
    </div>
</div>
  
  
  	<div class="input-group mb-3">
    <div class="input-group-text">팀 타자 기록 조회</div>

    <label for="teamssortOptionshit">정렬 기준 선택:</label>
    <select id="teamssortOptionshit" name="teamssortOptionshit" class="form-select">
        <option value="WAR">WAR</option>
        <option value="R">득점</option>
        <option value="H">안타</option>
        <option value="2B">2루타</option>
        <option value="3B">3루타</option>
        <option value="HR">홈런</option>
        <option value="TB">누타수</option>
        <option value="RBI">타점</option>
        <option value="SB">도루</option>
        <option value="CS">도루실패</option>
        <option value="BB">볼넷</option>
        <option value="SO">삼진</option>
        <option value="GDP">병살</option>
        <option value="SH">희생번트</option>
        <option value="SF">희생플라이</option>
        <option value="AVG">타율</option>
        <option value="OBP">출루율</option>
        <option value="SLG">장타율</option>
        <option value="OPS">OPS</option>
        <option value="PA">타석</option>
        <option value="AB">타수</option>
        <option value="year">연도</option>
    </select>

    <label for="teamsorderByhit">정렬 방향:</label>
    <select id="teamsorderByhit" name="teamsorderByhit" class="form-select">
        <option value="DESC" selected>내림차순</option>
        <option value="ASC">오름차순</option>
    </select>

    <label for="teamsteamhit">팀 선택:</label>
    <select id="teamsteamhit" class="form-select">
        <option value="">전체</option>
        <option value="9002">SSG</option>
        <option value="5002">LG</option>
        <option value="12001">KT</option>
        <option value="11001">NC</option>
        <option value="2002">KIA</option>
        <option value="1001">삼성</option>
        <option value="6002">두산</option>
        <option value="3001">롯데</option>
        <option value="7002">한화</option>
        <option value="10001">키움</option>
        <!-- 올드팀 생략 가능 -->
    </select>

    <label for="teamspositionOrderhit">포지션:</label>
    <select id="teamspositionOrderhit" class="form-select">
        <option value="">전체</option>
        <option value="1">투수</option>
        <option value="2">포수</option>
        <option value="3">1루수</option>
        <option value="4">2루수</option>
        <option value="5">3루수</option>
        <option value="6">유격수</option>
        <option value="7">좌익수</option>
        <option value="8">중견수</option>
        <option value="9">우익수</option>
        <option value="10">지명타자</option>
        <option value="13">내야수</option>
        <option value="14">외야수</option>
    </select>

    <label for="teamsstartYearhit">시작 년도:</label>
    <select id=teamsstartYearhit class="form-select">
        <c:forEach var="t" begin="1982" end="2025">
            <option value="${t}">${t}</option>
        </c:forEach>
    </select>

    <label for="teamsendYearhit">종료 년도:</label>
    <select id="teamsendYearhit" class="form-select">
        <c:forEach var="t" begin="1982" end="2025">
		          <option value="${t}" <c:if test="${t == 2025}">selected</c:if>>${t}</option>
        </c:forEach>
    </select>

    <input type="button" value="크롤링" onclick="teamHitterRecord()" class="btn btn-success"/>
	    <div class="input-group-append">
	        <span id="spinnerIcon" style="display:none">
	            <span class="spinner-border"></span>
	            &nbsp;&nbsp; 데이터를 입력하는 중입니다. &nbsp;&nbsp;
	            <span class="spinner-border"></span>
	        </span>
	    </div>
	</div>
	
	<div class="input-group mb-3">
    <div class="input-group-text">팀 투수 기록 조회</div>

    <label for="teamssortOptionsPic">정렬 기준 선택:</label>
    <select id="teamssortOptionsPic" name="teamssortOptionsPic" class="form-select">
        <option value="WAR">WAR</option>
        <option value="G">경기수</option>
        <option value="GS">선발</option>
        <option value="CG">완투</option>
        <option value="SHO">완봉</option>
        <option value="W">승</option>
        <option value="L">패</option>
        <option value="SV">세이브</option>
        <option value="HLD">홀드</option>
        <option value="IP">이닝</option>
        <option value="ER">자책</option>
        <option value="R">실점</option>
        <option value="H">피안타</option>
        <option value="HR">피홈런</option>
        <option value="BB">볼넷</option>
        <option value="SO">삼진</option>
        <option value="BK">보크</option>
        <option value="WP">폭투</option>
        <option value="ERA">ERA</option>
        <option value="FIP">FIP</option>
        <option value="WHIP">WHIP</option>
        <option value="year">연도</option>
    </select>

    <label for="teamsorderByPic">정렬 방향:</label>
    <select id="teamsorderByPic" name="teamsorderByPic" class="form-select">
        <option value="DESC" selected>내림차순</option>
        <option value="ASC">오름차순</option>
    </select>

    <label for="teamsteamPic">팀 선택:</label>
    <select id="teamsteamPic" class="form-select">
        <option value="">전체</option>
        <option value="9002">SSG</option>
        <option value="5002">LG</option>
        <option value="12001">KT</option>
        <option value="11001">NC</option>
        <option value="2002">KIA</option>
        <option value="1001">삼성</option>
        <option value="6002">두산</option>
        <option value="3001">롯데</option>
        <option value="7002">한화</option>
        <option value="10001">키움</option>
    </select>

    <label for="teamspositionOrderPic">포지션:</label>
    <select id="teamspositionOrderPic" class="form-select">
        <option value="">전체</option>
        <option value="1">투수</option>
        <!-- 필요시 다른 포지션도 추가 -->
    </select>

    <label for="teamsstartYearPic">시작 년도:</label>
    <select id="teamsstartYearPic" class="form-select">
        <c:forEach var="t" begin="1982" end="2025">
            <option value="${t}">${t}</option>
        </c:forEach>
    </select>

    <label for="teamsendYearPic">종료 년도:</label>
    <select id="teamsendYearPic" class="form-select">
        <c:forEach var="t" begin="1982" end="2025">
            <option value="${t}" <c:if test="${t == 2025}">selected</c:if>>${t}</option>
        </c:forEach>
    </select>

    <button type="button" class="btn btn-primary" onclick="teamPitcherRecord()">조회</button>
</div>
  
</div>
<p><br/></p>
</body>
</html>