/* 소셜로그인 버튼에 마우스를 올려놨을때 애니메이션이 한번이후로는 적용이 안되서 마우스를 올려놓을때마다 계속 애니메이션이 작동하게하는 스크립트 */
/* 핵심은 "애니메이션이 동일하게 반복되면 브라우저가 무시한다" */
function triggerPulse(btn) {
     const icon = btn.querySelector('img') || btn.querySelector('i');
	  if (!icon) return;
	
	  icon.style.animation = 'none';
	  icon.offsetHeight;
	  icon.style.animation = 'pulseIcon 0.5s ease-in-out';
  }
function togglePassword(inputId, icon) {
  const input = document.getElementById(inputId);
  if (input.type === 'password') {
    input.type = 'text';
    icon.classList.remove('fa-eye-slash');
    icon.classList.add('fa-eye');
  } else {
    input.type = 'password';
    icon.classList.remove('fa-eye');
    icon.classList.add('fa-eye-slash');
  }
 }