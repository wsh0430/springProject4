
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
  
  const pwdInput = document.getElementById("nowPwd");
  const PwdMessage = document.getElementById("nowPwdMessage");
	
	
	// 현재 비밀번호 필수 입력 검사
	pwdInput.addEventListener("input", function () {
	  const value = pwdInput.value.trim();
	
	  if (value === "") {
	    PwdMessage.textContent = "현재 비밀번호를 입력해주세요.";
	    PwdMessage.style.display = "block";
	  } else {
	    PwdMessage.style.display = "none";
	  }
	});
	// 현재 비밀번호 blur 시 확인
	pwdInput.addEventListener("blur", function () {
	  const value = pwdInput.value.trim();
	  if (value === "") {
	    PwdMessage.textContent = "현재 비밀번호를 입력해주세요.";
	    PwdMessage.style.display = "block";
	  } else {
	    PwdMessage.style.display = "none";
	  }
	});