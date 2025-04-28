// javascript 드롭다운 
	// '기록실' 메뉴를 클릭했을 때 하위 메뉴의 보이기/숨기기를 토글
	// 드롭다운 열기/닫기 (기존 코드 유지)
  	document.addEventListener('DOMContentLoaded', function () {
		  document.querySelector('.nav-record').addEventListener('click', function(event) {
		    const dropdown = this.querySelector('.dropdown');
		    dropdown.style.display = (dropdown.style.display === 'block') ? 'none' : 'block';
		    event.stopPropagation();
		  });
		
		  document.addEventListener('click', function(event) {
		    const dropdown = document.querySelector('.dropdown');
		    if (!event.target.closest('.nav-record')) {
		      dropdown.style.display = 'none';
		    }
		  });
		
		  document.querySelector('.dropdown li:nth-child(1) a').addEventListener('click', function(e) {
		    e.preventDefault();
		    showSidebar('player');
		  });
		
		  document.querySelector('.dropdown li:nth-child(2) a').addEventListener('click', function(e) {
		    e.preventDefault();
		    showSidebar('team');
		  });
		 });
		 
		/* 사이드바 스크립트 */
		  function showSidebar(type) {
			  const currentPath = window.location.pathname;
			
			  // 🚫 로그인 또는 회원가입 페이지라면 실행 안 함
			  if (
					currentPath.includes("/member/memberLogin") || 
					currentPath.includes("/member/memberJoin")
					) {
			    return;
			  }
			
			  const playerSidebar = document.getElementById("sidebar-player");
			  const teamSidebar = document.getElementById("sidebar-team");
			  
			  if (!playerSidebar || !teamSidebar) return;
			
			  playerSidebar.style.display = 'none';
			  teamSidebar.style.display = 'none';
			
			  if (type === 'player') {
			    playerSidebar.style.display = 'block';
			  } else if (type === 'team') {
			    teamSidebar.style.display = 'block';
			  }
			}