 'use strict';
// 이메일 select로 값을 고르면 2번째 input에 자동으로 들어가게 하는 스크립트
function setEmailDomain(value) {
    const domainInput = document.getElementById('email2');
    if (value === 'self') {
        domainInput.value = '';
        domainInput.readOnly = false;
    } else {
        domainInput.value = value;
        domainInput.readOnly = true;
    }
    
    // 이메일 검증 함수 호출
    validateEmail();
}

// 이메일 검사 함수
function validateEmail() {
    const email1 = document.getElementById("email1").value.trim();
    const domainInput = document.getElementById("email2").value.trim();

    // 이메일 입력값이 없으면 경고 메시지 표시
    if (email1 === "" || domainInput === "") {
        document.getElementById("emailMessage").textContent = "이메일을 입력해주세요.";
        document.getElementById("emailMessage").style.display = "block";
    } else {
        document.getElementById("emailMessage").textContent = "";
        document.getElementById("emailMessage").style.display = "none";
    }
}

 //회원가입에 필요한 정보 체크 스크립트
	let idCheckSw = 0;
	let nickCheckSw = 0;
	let isPhoneVerified = false; // 휴대폰 인증 상태 변수
	
	//정규식 정의
	let regMid = /^[a-zA-Z0-9_]{4,20}$/; 				//영문 대소문자 + 숫자 + 밑줄(_) 허용, 길이:4~20자
	let regNickName = /^[가-힣a-zA-Z0-9]{1,20}$/;	//한글 + 영대소문자 + 숫자, 길이:1~20자
	let regName = /^[가-힣a-zA-Z]{1,10}$/; 				//한글 + 영문만 허용, 길이:1~10자
	let regTel = /^(010|011|016|017|018|019|043)-\d{3,4}-\d{4}$/;					//000-000or0000-0000 + 하이픈 구조
	let regEmail = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
	let regPwd = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%])[A-Za-z\d!@#$%]{8,20}$/; //영문자, 숫자, 특수문자 각 하나 이상 포함 필수입니다. 이며 8~20자 사이!

	
	//회원가입에 필요한 정보 체크
 	function fCheck() {
	//필수항목 먼저 체크
	let mid = myform.memberId.value.trim();
	let pwd = myform.password.value.trim();
	let pwdCheck = myform.memberPwdCheck.value.trim();
	let nickName = myform.nickName.value.trim();
	let name = myform.name.value.trim();
	
	let email1 = myform.email1.value.trim();
	let email2 = myform.email2.value.trim();
	let email = email1 + "@" + email2;
	
	let tel1 = myform.tel1.value.trim();
	let tel2 = myform.tel2.value.trim();
	let tel3 = myform.tel3.value.trim();
	let tel = tel1 + "-" + tel2 + "-" + tel3;
	
	let postcode = myform.postcode.value + "	";
	let roadAddress = myform.roadAddress.value + "	";
	let detailAddress = myform.detailAddress.value + "	";
	let extraAddress = myform.extraAddress.value + "	";
	let address = postcode + "/" + roadAddress + "/" + detailAddress + "/" + extraAddress;

	let submitFlag = 0;
	
		// 성별 검사
		const genderMale = document.getElementById("gender1").checked;
		const genderFemale = document.getElementById("gender2").checked;
		
		if (!genderMale && !genderFemale) {
		  document.getElementById("genderMessage").textContent = "성별을 선택해주세요.";
		  document.getElementById("genderMessage").style.display = "block";
		  return false;
		} else {
		  document.getElementById("genderMessage").textContent = "";
		  document.getElementById("genderMessage").style.display = "none";
		}
		
		// 이메일 검사
		if (email1 === "" || email2 === "") {
		  document.getElementById("emailMessage").textContent = "이메일을 입력해주세요.";
		  document.getElementById("emailMessage").style.display = "block";
		  myform.email1.focus();
		  return false;
		} else {
		  document.getElementById("emailMessage").textContent = "";
		  document.getElementById("emailMessage").style.display = "none";
		}
		if (!regMid.test(mid)) {
			document.getElementById('idMessage').textContent = "아이디는 4~20자리의 영문 대/소문자와 숫자, 언더바(_)만 가능합니다.";
			document.getElementById('idMessage').style.display= 'block';
			myform.memberId.focus();
			return false; //유효성 검사 실패 시 폼 제출을 막기 위해 false 리턴
		}
		if(pwd.length < 8 || pwd.length > 20) {
			document.getElementById('pwdMessage').textContent = "비밀번호는  영문자, 숫자, 특수문자 각 하나 이상 포함 필수 8~20자여야 합니다.";
			document.getElementById('pwdMessage').style.display= 'block';
			myform.password.focus();
			return false; 
		}
		else if (pwdCheck === "") {
		  document.getElementById('pwdCheckMessage').textContent = "비밀번호 확인란을 입력해주세요.";
		  document.getElementById('pwdCheckMessage').style.display = 'block';
		  myform.memberPwdCheck.focus();
		  return false;
		}
		else if(!(pwd == pwdCheck)) {
			document.getElementById('pwdCheckMessage').textContent = "비밀번호가 일치하지 않습니다.";
			document.getElementById('pwdCheckMessage').style.display= 'block';
			myform.memberPwdCheck.focus();
			return false; 
		}
		else if(!regNickName.test(nickName)) {
			document.getElementById('nickNameMessage').textContent = "닉네임은 한글 + 영대소문자 + 숫자, 20자 이내여야 합니다.";
			document.getElementById('nickNameMessage').style.display= 'block';
			myform.nickName.focus();
			return false; 
		}
		else if(!regName.test(name)) {
			document.getElementById('nameMessage').textContent = "이름은 한글 또는 영문으로 10자 이내여야 합니다.";
			document.getElementById('nameMessage').style.display= 'block';
			myform.name.focus();
			return false; 
		}
		else {
			submitFlag = 1;
		}
		
		if(tel2 != "" && tel3 != "") {
			if(!regTel.test(tel)) {
				document.getElementById('telMessage').textContent = "전화번호 형식을 확인해주세요.(000-000또는0000-0000)";
				document.getElementById('telMessage').style.display= 'block';
				myform.tel2.focus();
				return false; 
			}
			else{
				submitFlag = 1;
			}
		}
		else {
			tel2 = "";
			tel3 = "";
			tel = tel1 + "-" + tel2 + "-" + tel3;
			submitFlag = 1;
		}
		
		// 사진(jpg/gif/png)에 대한 체크, 용량은 2MByte 이내 - 사진은 공백이 아닐경우 체크해준다.
		let fName = document.getElementById("file").value;
		if(fName.trim() != "") {
			let ext = fName.substring(fName.lastIndexOf(".")+1).toLowerCase();
			let maxSize = 1024 * 1024 * 2; //한번에 업로드할 파일의 최대용량을 2MByte로 한정
			let fileSize = document.getElementById("file").files[0].size;
			
			if(fileSize > maxSize) {
				Swal.fire({
	          icon: 'error',
	          title: '용량 초과!',
	          text: '업로드할 파일의 최대용량은 2MByte입니다.',
	          confirmButtonText: '확인'
				}); return false;
			}
			else if (ext != "jpg" && ext != "gif" && ext != "png"){
				Swal.fire({
	          icon: 'error',
	          title: '파일 형식 에러!',
	          text: '업로드 가능파일은 "jpg/gif/png" 입니다.',
	          confirmButtonText: '확인'
				}); return false;
			}
			submitFlag = 1;
	}
		//앞에서 모든 항목에 대한 유효성 검사를 마치면 중복체크 부분 버튼이 눌렀는지 확인처리
		if(submitFlag == 1) {
			if(idCheckSw == 0){ //아이디 중복버튼 눌렀는지 체크
				Swal.fire({
		      icon: 'warning',
		      title: '아이디 중복 확인 필요!',
		      text: '아이디 중복체크 버튼을 눌러주세요.',
		      confirmButtonText: '확인'
		    });
				document.getElementById("midBtn").focus();
			}
			else if(nickCheckSw == 0) {
				 Swal.fire({
			      icon: 'warning',
			      title: '닉네임 중복 확인 필요!',
			      text: '닉네임 중복체크 버튼을 눌러주세요.',
			      confirmButtonText: '확인'
			    });
				document.getElementById("nickNameBtn").focus();
			}
			else if (!isPhoneVerified) { // 휴대폰 인증 체크
	       Swal.fire({
	          icon: 'warning',
	          title: '휴대폰 인증 필요!',
	          text: '휴대폰 번호 인증을 완료해주세요.',
	          confirmButtonText: '확인'
	       });
			}
			else{ //모든 체크가 완료되었을때 email/tel을 채워준후 서버로 전송처리한다.
				myform.email.value = email;
				myform.tel.value = tel;
				myform.address.value = address;
				
				myform.submit();
			}
		}
		else {
			Swal.fire({
		    icon: 'error',
		    title: '전송 실패!',
		    text: '회원가입 내용을 다시 확인해 주세요.',
		    confirmButtonText: '확인'
		  });
		}
	}
	
	//아이디 중복검사
	function idCheck() {
		let mid = myform.memberId.value;
		
      if(mid.trim() == ""){
			Swal.fire({
          icon: 'error',
          title: '공백',
          text: '아이디를 입력해주세요.',
          confirmButtonText: '확인'
      });
      myform.memberId.focus();
      return;  // 유효하지 않으면 중복 체크를 하지 않음
		}
	  if (!regMid.test(mid)) {
      Swal.fire({
          icon: 'error',
          title: '아이디 조건 불일치!',
          text: '아이디는 4~20자리의 영문 대/소문자와 숫자, 언더바(_)만 가능합니다.',
          confirmButtonText: '확인'
      });
      myform.memberId.focus();
      return;  // 유효하지 않으면 중복 체크를 하지 않음
    }
		if(mid.trim() != ""){
			$.ajax({
				url 	: ctp + "/member/memberIdCheck",
				type	: "get",
				data	: {memberId : mid},
				success:function(res) {
					if(res != '0'){
						Swal.fire({
		          icon: 'error',
		          title: '아이디 중복!',
		          text: '이미 사용 중인 아이디입니다. 다시 입력하세요.',
		          confirmButtonText: '확인'
	        	});        	
						myform.memberId.focus();
					}
					else{
						Swal.fire({
		          icon: 'success',
		          title: '사용 가능!',
		          text: '이 아이디는 사용할 수 있습니다 😊',
		          confirmButtonText: '좋아요!'
	        	});
						idCheckSw = 1;
						myform.memberId.readOnly = true;
						
						const idBtn = document.getElementById("midBtn");
					  idBtn.disabled = true;
					  idBtn.classList.add("disabled-btn");
					}
				},
				error : function() {
					Swal.fire({
		        icon: 'warning',
		        title: '전송 실패',
		        text: '서버와의 통신 중 문제가 발생했습니다.',
		        confirmButtonText: '확인'
	      	});
	      }
			});
		}
	}
	
	//닉네임 중복검사
	function memberNickCheck() {
		let nickName = myform.nickName.value;
		if (!regNickName.test(nickName)) {
      Swal.fire({
          icon: 'error',
          title: '닉네임 조건 불일치!',
          text: '닉네임은 한글 + 영대소문자 + 숫자, 20자 이내여야 합니다.',
          confirmButtonText: '확인'
      });
      if(nickName.trim() == ""){
							Swal.fire({
				          icon: 'error',
				          title: '공백',
				          text: '닉네임을 입력해주세요.',
				          confirmButtonText: '확인'
				      });
						}
      myform.nickName.focus();
      return;  // 유효하지 않으면 중복 체크를 하지 않음
    }
		if(nickName.trim() != ""){
			$.ajax({
				url 	:  ctp + "/member/memberNickCheck",
				type	: "get",
				data	: {nickName : nickName},
				success:function(res) {
					if(res != '0'){
						Swal.fire({
		          icon: 'error',
		          title: '닉네임 중복!',
		          text: '이미 사용 중인 닉네임입니다. 다시 입력하세요.',
		          confirmButtonText: '확인'
	        	});
						myform.nickName.focus();
					}
					else{
						Swal.fire({
		          icon: 'success',
		          title: '사용 가능!',
		          text: '이 닉네임은 사용할 수 있습니다 😊',
		          confirmButtonText: '좋아요!'
	        	});
						nickCheckSw = 1;
						myform.nickName.readOnly = true;
						
						const nickBtn = document.getElementById("nickNameBtn");
					  nickBtn.disabled = true;
					  nickBtn.classList.add("disabled-btn");
					}
				},
				error : function() {
					Swal.fire({
		        icon: 'warning',
		        title: '전송 오류',
		        text: '서버와의 통신 중 문제가 발생했습니다.',
		        confirmButtonText: '확인'
	      	});
	      }
			});
		}
	}
	
// 휴대폰 인증번호 발송 함수
function sendVerificationCode() {
    let tel = myform.tel1.value.trim() + "-" + myform.tel2.value.trim() + "-" + myform.tel3.value.trim();
    
    // 요소가 null인 경우 예외 처리
    if (!myform.tel1.value.trim() || !myform.tel2.value.trim() || !myform.tel3.value.trim()) {
        Swal.fire({
            icon: 'error',
            title: '입력 오류',
            text: '전화번호 입력 필드를 확인해주세요.',
            confirmButtonText: '확인'
        });
        return;
    }

    if (!regTel.test(tel)) {
        Swal.fire({
            icon: 'error',
            title: '전화번호 오류!',
            text: '올바른 전화번호 형식이 아닙니다.',
            confirmButtonText: '확인'
        });
        return;
    }
		
// SMS 발송을 위한 AJAX 요청 (예시)
  // 1. 휴대폰 번호 중복 체크 먼저 수행
    $.ajax({
        url: ctp + "/member/checkTelDuplicate",
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify({ tel: tel }),
        success: function (isDuplicate) {
            if (isDuplicate) {
                Swal.fire({
                    icon: 'error',
                    title: '중복된 전화번호!',
                    text: '이미 가입된 전화번호입니다.',
                    confirmButtonText: '확인'
                });
                return;
            }

            // 2. 중복이 아니면 인증번호 발송 요청
            $.ajax({
                url: ctp + "/member/sendVerificationCode",
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({
						        type: 'signup', // 또는 'id', 'pw'
						        tel: tel
						    }),
                success: function (data) {
                    if (data.success) {
                        Swal.fire({
                            icon: 'success',
                            title: '인증번호 발송 완료!',
                            text: '휴대폰으로 인증번호가 발송되었습니다.',
                            confirmButtonText: '확인'
                        });
                        document.getElementById("verifySection").style.display = 'block'; //인증번호 입력란 보여주기
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: '인증번호 발송 실패!',
                            text: '다시 시도해주세요.',
                            confirmButtonText: '확인'
                        });
                        console.log("보내는 데이터:", {
												  type: 'signup',
												  tel: tel
												});
                    }
                },
                error: function () {
                    Swal.fire({
                        icon: 'warning',
                        title: '전송 오류',
                        text: '서버와의 통신 중 문제가 발생했습니다.',
                        confirmButtonText: '확인'
                    });
                }
            });

        },
        error: function () {
            Swal.fire({
                icon: 'error',
                title: '중복 확인 실패',
                text: '서버와의 통신 오류입니다.',
                confirmButtonText: '확인'
            });
        }
    });
}

// 인증번호 확인 함수
function verifyCode(type) {
    let verificationCodeElement = document.getElementById('verificationCode');
    


    let verificationCode = verificationCodeElement.value.trim();
    
    if (verificationCode === '') {
        Swal.fire({
            icon: 'warning',
            title: '입력 오류',
            text: '인증번호를 입력해주세요.',
            confirmButtonText: '확인'
        });
        return;
    }

    $.ajax({
        url: ctp + "/member/verifyCode",
        type: 'POST',
        data: JSON.stringify({ code: verificationCode, type: type}),
        contentType: 'application/json',
        success: function (data) {
				console.log(data); // 서버의 응답 내용 출력
            if (data === 'success') {
                isPhoneVerified = true; // 인증 완료 처리
                Swal.fire({
                    icon: 'success',
                    title: '휴대폰 인증 완료!',
                    text: '휴대폰 인증이 완료되었습니다.',
                    confirmButtonText: '확인'
                });
                document.getElementById('verificationBtn').disabled = true;
            } else if (data === 'expired') {
                Swal.fire({
                    icon: 'error',
                    title: '인증번호 만료',
                    text: '인증번호가 만료되었습니다. 다시 시도해주세요.',
                    confirmButtonText: '확인'
                });
            } else {
                Swal.fire({
                    icon: 'error',
                    title: '인증번호 불일치!',
                    text: '입력하신 인증번호가 일치하지 않습니다.',
                    confirmButtonText: '확인'
                });
            }
        },
        error: function () {
            Swal.fire({
                icon: 'warning',
                title: '전송 오류',
                text: '서버와의 통신 중 문제가 발생했습니다.',
                confirmButtonText: '확인'
            });
        }
    });
}
	
	const midInput = document.getElementById("memberId");
	const idMessage = document.getElementById("idMessage");
	const pwdInput = document.getElementById("password");
	const pwdCheckInput = document.getElementById("memberPwdCheck");
	const pwdCheckMessage = document.getElementById("pwdCheckMessage");
	const nickNameInput = document.getElementById("nickName");
	const nickNameMessage = document.getElementById("nickNameMessage");
	const nameInput = document.getElementById("name");
	const nameMessage = document.getElementById("nameMessage");
	const genderRadios = document.querySelectorAll("input[name='gender']");
	const genderMessage = document.getElementById("genderMessage");
	const email1Input = document.getElementById("email1");
	const email2Input = document.getElementById("email2");
	const emailMessage = document.getElementById("emailMessage");
	
	// 아이디 실시간 입력 시 조건이 맞으면 메시지 숨김
	midInput.addEventListener("input", function () {
	  const value = midInput.value.trim();
	  if (regMid.test(value)) {
	    idMessage.style.display = "none";
	    pwdCheckMessage.style.display = "none";
	  }
	});
	// 아이디 입력창 벗어날 때 (blur) 조건 검사
	midInput.addEventListener("blur", function () {
	  const value = midInput.value.trim();
	
	  if (value === "") {
	    idMessage.textContent = "아이디는 필수 입력 항목입니다.";
	    idMessage.style.display = "block";
	  } else if (!regMid.test(value)) {
	    idMessage.textContent = "아이디는 4~20자리의 영문 대/소문자와 숫자, 언더바(_)만 가능합니다.";
	    idMessage.style.display = "block";
	  } else {
	    idMessage.style.display = "none";
	  }
	});
	
	// 비밀번호 실시간 입력 시 유효성 검사
	pwdInput.addEventListener("input", function () {
	  const value = pwdInput.value.trim();
	  if (value.length >= 8 && value.length <= 20) {
	    pwdMessage.style.display = "none"; // 조건 만족 시 메시지 숨김
	  }
	});
	// 비밀번호 blur 시 조건 검사
	pwdInput.addEventListener("blur", function () {
	  const value = pwdInput.value.trim();
	  if (value === "") {
	    pwdMessage.textContent = "비밀번호는 필수 입력입니다.";
	    pwdMessage.style.display = "block";
	  }
	  else if (value.length < 8 || value.length > 20) {
	    pwdMessage.textContent = "비밀번호는 영문자, 숫자, 특수문자 각 하나 이상 포함 필수 8~20 자리로 작성해주세요.";
	    pwdMessage.style.display = "block";
	  } else {
	    pwdMessage.style.display = "none";
	  }
	});
	
	// 비밀번호 확인 실시간 입력 시 확인
	pwdCheckInput.addEventListener("input", function () {
	  if (pwdCheckInput.value.trim() === pwdInput.value.trim()) {
	    pwdCheckMessage.style.display = "none";
	  }
	});
	// 비밀번호 확인 blur 시 검사
	pwdCheckInput.addEventListener("blur", function () {
		const value = pwdCheckInput.value.trim();
		if (value === "") {
	    pwdCheckMessage.textContent = "비밀번호 확인은 필수 입력입니다.";
	    pwdCheckMessage.style.display = "block";
	  }
	  else if (pwdCheckInput.value.trim() !== pwdInput.value.trim()) {
	    pwdCheckMessage.textContent = "비밀번호가 일치하지 않습니다.";
	    pwdCheckMessage.style.display = "block";
	  } else {
	    pwdCheckMessage.style.display = "none";
	  }
	});
	// 닉네임 blur 이벤트
	nickNameInput.addEventListener("blur", function () {
	  const value = nickNameInput.value.trim();
	  if (value === "") {
	    nickNameMessage.textContent = "닉네임은 필수 입력 항목입니다.";
	    nickNameMessage.style.display = "block";
	  } else if (!regNickName.test(value)) {
	    nickNameMessage.textContent = "닉네임은 한글, 영문, 숫자로 1~20자까지 가능합니다.";
	    nickNameMessage.style.display = "block";
	  } else {
	    nickNameMessage.style.display = "none";
	  }
	});
	
	// 이름 blur 이벤트
	nameInput.addEventListener("blur", function () {
	  const value = nameInput.value.trim();
	  if (value === "") {
	    nameMessage.textContent = "이름은 필수 입력 항목입니다.";
	    nameMessage.style.display = "block";
	  } else if (!regName.test(value)) {
	    nameMessage.textContent = "이름은 한글 또는 영문으로 1~5자 이내여야 합니다.";
	    nameMessage.style.display = "block";
	  } else {
	    nameMessage.style.display = "none";
	  }
	});
	
	// 성별 change 이벤트로 변경
	genderRadios.forEach(radio => {
	  radio.addEventListener("change", function () {
	    if (document.querySelector("input[name='gender']:checked")) {
	      genderMessage.style.display = "none";
	    } else {
	      genderMessage.textContent = "성별을 선택해주세요.";
	      genderMessage.style.display = "block";
	    }
	  });
	});
	
	// 이메일 입력 유효성 검사 함수
	function validateEmailInputs() {
	  const email1Val = email1.value.trim();
	  const email2Val = email2.value.trim();
		
	  if (email1Val === "" || email2Val === "") {
	    emailMessage.textContent = "이메일을 입력해주세요.";
	    emailMessage.style.display = "block";
	  } else {
	    emailMessage.textContent = "";
	    emailMessage.style.display = "none";
	  }
	}
	
	// blur 이벤트 등록 (입력란에서 포커스 벗어날 때 실행)
	email1.addEventListener("blur", validateEmailInputs);
	email2.addEventListener("blur", validateEmailInputs);
	//email1이나 email2 어느 칸에서 포커스를 벗어나도 같은 검사 로직을 실행합니다.
	
	//선택항목버튼을 통해 보이고 숨기는
	 function optionCheck() {
    const section = document.getElementById("choiceSection");
    const button = document.getElementById("addContentCheck");

    if (section.style.display === "none" || section.classList.contains("fade-out")) {
      section.style.display = "block";
      section.classList.remove("fade-out");
      section.classList.add("fade-in");
      button.value = "선택항목 ▲";
    } else {
      section.classList.remove("fade-in");
      section.classList.add("fade-out");
      button.value = "선택항목 ▼";

      // 애니메이션이 끝난 후 display를 none으로 바꿔줌
      section.addEventListener("animationend", function handler() {
        section.style.display = "none";
        section.classList.remove("fade-out");
        section.removeEventListener("animationend", handler);
      });
    }
  }
  
  //업로드 시킬 사진 미리보기
  	function imgCheck(e) {
			if(e.files && e.files[0]) {
				let reader = new FileReader();
				reader.onload = function(e) {
					document.getElementById("photoDemo").src = e.target.result;
				}
				reader.readAsDataURL(e.files[0]);
			}
		}
		
	// 아이디 입력창 클릭 시 readOnly 해제 및 중복확인 상태 초기화
		midInput.addEventListener("focus", function () {
		  if (midInput.readOnly) {
		    midInput.readOnly = false;
		    idCheckSw = 0;
		
			 	const idBtn = document.getElementById("midBtn");
		    idBtn.disabled = false;
		    idBtn.classList.remove("disabled-btn");
		    
		    // 경고 메시지 제거 및 버튼 복원
		    document.getElementById('idMessage').style.display = 'none';
		  }
		});
		
	// 닉네임 입력창 클릭 시 readOnly 해제 및 중복확인 상태 초기화
		nickNameInput.addEventListener("focus", function () {
		  if (nickNameInput.readOnly) {
		    nickNameInput.readOnly = false;
		    nickCheckSw = 0;
		
		    const nickBtn = document.getElementById("nickNameBtn");
		    nickBtn.disabled = false;
		    nickBtn.classList.remove("disabled-btn");
		    document.getElementById('nickNameMessage').style.display = 'none';
		  }
		});