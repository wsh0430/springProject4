let regPwd = /^[A-Za-z\d!@#$%]{8,20}$/; // 영문, 숫자, 특수문자(!@#$%)만 가능한 8~20자
	function pCheck() {
	let pwd = myform.nowPwd.value.trim();
	let newPwd = myform.newPwd.value.trim();
	let newPwdCheck = myform.newPwdCheck.value.trim();
	
	let submitFlag = 0;
  // 새 비밀번호가 8~20자 사이인지 확인
  if (!regPwd.test(newPwd)) {
    document.getElementById('newPwdMessage').textContent = "비밀번호는 영문, 숫자, 특수문자(!@#$%)만 가능한 8~20자여야 합니다.";
    document.getElementById('newPwdMessage').style.display = 'block';
    return false;
  }

  // 새 비밀번호가 현재 비밀번호와 같으면 안됨
  if (pwd === newPwd) {
    document.getElementById('newPwdMessage').textContent = "새 비밀번호는 현재 비밀번호와 같을 수 없습니다.";
    document.getElementById('newPwdMessage').style.display = 'block';
    return false;
  }

  // 비밀번호 확인이 일치하는지 확인
  if (newPwd !== newPwdCheck) {
    document.getElementById('newPwdCheckMessage').textContent = "비밀번호가 일치하지 않습니다.";
    document.getElementById('newPwdCheckMessage').style.display = 'block';
    return false;
  }
  // 모든 체크가 통과하면 submitFlag를 1로 설정
  submitFlag = 1;

  if (submitFlag === 1) {
    return true; // 폼 제출
  } else {
    return false;
  }
}
  
  
  function togglePassword(inputId, icon) {
    const input = document.getElementById(inputId);
    if (input.type === 'password') {
      input.type = 'text';
      icon.classList.remove('fa-eye');
      icon.classList.add('fa-eye-slash');
    } else {
      input.type = 'password';
      icon.classList.remove('fa-eye-slash');
      icon.classList.add('fa-eye');
    }
  }
  
	const pwdInput = document.getElementById("nowPwd");
	const newPwdInput = document.getElementById("newPwd");
	const newPwdCheckInput = document.getElementById("newPwdCheck");
	const pwdCheckMessage = document.getElementById("newPwdCheckMessage");
	const pwdMessage = document.getElementById("newPwdMessage");
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
	// 새 비밀번호 실시간 입력 시 유효성 검사
	newPwdInput.addEventListener("input", function () {
	  const value = newPwdInput.value.trim();
	  const nowValue = pwdInput.value.trim();
	
	
	  if (value === "") {
	    pwdMessage.textContent = "새 비밀번호는 필수 입력입니다.";
	    pwdMessage.style.display = "block";
	  } else if (value === nowValue) {
	    pwdMessage.textContent = "새 비밀번호는 현재 비밀번호와 같을 수 없습니다.";
	    pwdMessage.style.display = "block";
	  } else if (value.length < 8 || value.length > 20 || !/^[A-Za-z\d!@#$%]{8,20}$/.test(value)) {
	    pwdMessage.textContent = "비밀번호는 영문, 숫자, 특수문자(!@#$%)만 가능한 8~20자여야 합니다.";
	    pwdMessage.style.display = "block";
	  } else {
	    pwdMessage.style.display = "none";
	  }
	});
	
	// 새 비밀번호 blur 시 확인
	newPwdInput.addEventListener("blur", function () {
	  const value = newPwdInput.value.trim();
	  const nowValue = pwdInput.value.trim();
	
	  if (value === "") {
	    pwdMessage.textContent = "새 비밀번호는 필수 입력입니다.";
	    pwdMessage.style.display = "block";
	  } else if (value === nowValue) {
	    pwdMessage.textContent = "새 비밀번호는 현재 비밀번호와 같을 수 없습니다.";
	    pwdMessage.style.display = "block";
	  } else if (value.length < 8 || value.length > 20 || !/^[A-Za-z\d!@#$%]{8,20}$/.test(value)) {
	    pwdMessage.textContent = "비밀번호는 영문, 숫자, 특수문자(!@#$%)만 가능한 8~20자여야 합니다.";
	    pwdMessage.style.display = "block";
	  } else {
	    pwdMessage.style.display = "none";
	  }
	});
	
	// 새 비밀번호 확인 실시간 검사
	newPwdCheckInput.addEventListener("input", function () {
	  const checkValue = newPwdCheckInput.value.trim();
	  const newValue = newPwdInput.value.trim();
	
	
	  if (checkValue === "") {
	    pwdCheckMessage.textContent = "비밀번호 확인을 입력해주세요.";
	    pwdCheckMessage.style.display = "block";
	  } else if (checkValue !== newValue) {
	    pwdCheckMessage.textContent = "비밀번호가 일치하지 않습니다.";
	    pwdCheckMessage.style.display = "block";
	  } else {
	    pwdCheckMessage.style.display = "none";
	  }
	});
	
	// 새 비밀번호 확인 blur 검사
	newPwdCheckInput.addEventListener("blur", function () {
	  const checkValue = newPwdCheckInput.value.trim();
	  const newValue = newPwdInput.value.trim();
	
	  if (checkValue === "") {
	    pwdCheckMessage.textContent = "비밀번호 확인을 입력해주세요.";
	    pwdCheckMessage.style.display = "block";
	  } else if (checkValue !== newValue) {
	    pwdCheckMessage.textContent = "비밀번호가 일치하지 않습니다.";
	    pwdCheckMessage.style.display = "block";
	  } else {
	    pwdCheckMessage.style.display = "none";
	  }
	});