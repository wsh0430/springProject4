		//로그인 로고를 클릭했을시 실행되는 드롭다운 script
		function toggleUserDropdown() {
		  const dropdown = document.getElementById("userDropdown");
		  console.log(document.getElementById("userDropdown"));
		  dropdown.style.display = (dropdown.style.display === "block") ? "none" : "block";
		}
		
		// 바깥 클릭 시 닫기
		document.addEventListener("click", function(e) {
		  const dropdown = document.getElementById("userDropdown");
		  const button = document.querySelector(".user-icon");
		  if (!button.contains(e.target) && !dropdown.contains(e.target)) {
		    dropdown.style.display = "none";
		  }
		});
	
		// '기록실' 메뉴를 클릭했을 때 하위 메뉴의 보이기/숨기기를 토글
		// 드롭다운 열기/닫기 (기존 코드 유지)
  	document.addEventListener('DOMContentLoaded', function () {
		  document.querySelector('.nav-record').addEventListener('click', function(event) {
		    const dropdown = this.querySelector('.dropdown');
		    dropdown.style.display = (dropdown.style.display === 'block') ? 'none' : 'block';

		  });
		
		  document.addEventListener('click', function(event) {
		    const dropdown = document.querySelector('.dropdown');
		    if (!event.target.closest('.nav-record')) {
		      dropdown.style.display = 'none';
		    }
		  });
		
		  document.querySelector('.dropdown li:nth-child(1) a').addEventListener('click', function(e) {

		    showSidebar('player');
		  });
		
		  document.querySelector('.dropdown li:nth-child(2) a').addEventListener('click', function(e) {

		    showSidebar('career');
		  });
		  
		  document.querySelector('.dropdown li:nth-child(3) a').addEventListener('click', function(e) {

		    showSidebar('team');
		  });
		 });
		 
		/* 사이드바 스크립트 */
	  function showSidebar(type) {
		  const currentPath = window.location.pathname;
		
	    // 기록실/분석 페이지가 아닐 경우 사이드바 실행 안 함
		  const isRecordPage = currentPath.includes("/record");
		  const isAnalysisPage = currentPath.includes("/analysis");
		  
		  if (!isRecordPage && !isAnalysisPage) return;
				
		  const playerSidebar = document.getElementById("sidebar-player");
		  const careerSidebar = document.getElementById("sidebar-career");
		  const teamSidebar = document.getElementById("sidebar-team");
		  
		  if (!playerSidebar || !careerSidebar || !teamSidebar) return;
		
		  playerSidebar.style.display = 'none';
		  careerSidebar.style.display = 'none';
		  teamSidebar.style.display = 'none';
		
		  if (type === 'player') {
		    playerSidebar.style.display = 'block';
		  } else if (type === 'team') {
		    teamSidebar.style.display = 'block';
		  } else if(type == 'career') {
				careerSidebar.style.display = 'block';
			}
		}
		// 페이지 로드시 URL 파라미터로 사이드바 열기
		window.addEventListener("load", function () {
		  const urlParams = new URLSearchParams(window.location.search);
		  const sidebarType = urlParams.get("sidebar");
		  if (sidebarType) {
		    showSidebar(sidebarType); // 이때는 DOM이 100% 다 로드된 후
		  }
		});