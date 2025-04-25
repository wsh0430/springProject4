 'use strict';
 //이메일 select로 값을 고르면 2번째 input에 자동으로 들어가게하는 스크립트
 	function setEmailDomain(value) {
    const domainInput = document.getElementById('email2');
    if (value === 'self') {
      domainInput.value = '';
      domainInput.readOnly = false;
    } else {
      domainInput.value = value;
      domainInput.readOnly = true;
    }
  }
 //회원가입에 필요한 정보 체크 스크립트
	let idCheckSw = 0;
	let nickCheckSw = 0;
	
	//정규식 정의
	let regMid = /^[a-zA-Z0-9_]{4,20}$/; 				//영문 대소문자 + 숫자 + 밑줄(_) 허용, 길이:4~20자
	let regNickName = /^[가-힣a-zA-Z0-9]{1,20}$/;	//한글 + 영대소문자 + 숫자, 길이:1~20자
	let regName = /^[가-힣a-zA-Z]{1,10}$/; 				//한글 + 영문만 허용, 길이:1~10자
	let regTel = /\d{3}-\d{4}-\d{4}$/;					//000-0000-0000 + 하이픈 구조
	let regEmail = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
	let regPwd = /^[A-Za-z\d!@#$%]{8,20}$/; // 영문, 숫자, 특수문자(!@#$%)만 가능한 8~20자

	
	//회원가입에 필요한 정보 체크
 	function fCheck() {
	  console.log("fCheck 실행됨");
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
	
		if (!regMid.test(mid)) {
			document.getElementById('idMessage').textContent = "아이디는 4~20자리의 영문 대/소문자와 숫자, 언더바(_)만 가능합니다.";
			document.getElementById('idMessage').style.display= 'block';
			myform.memberId.focus();
			return false; //유효성 검사 실패 시 폼 제출을 막기 위해 false 리턴
		}
		else {
	  document.getElementById('idMessage').style.display = 'none'; // ✅ 조건에 맞을 때 메시지 숨기기
		}
		if(pwd.length < 4 || pwd.length > 20) {
			document.getElementById('pwdMessage').textContent = "비밀번호는 영문, 숫자, 특수문자(!@#$%)만 가능한 8~20자여야 합니다.";
			document.getElementById('pwdMessage').style.display= 'block';
			myform.password.focus();
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
				document.getElementById('telMessage').textContent = "전화번호 형식을 확인해주세요.(000-0000-0000)";
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
	
	const midInput = document.getElementById("memberId");
	const idMessage = document.getElementById("idMessage");
	const pwdInput = document.getElementById("password");
	const pwdCheckInput = document.getElementById("memberPwdCheck");
	const pwdCheckMessage = document.getElementById("pwdCheckMessage");
	const nickNameInput = document.getElementById("nickName");
	const nickNameMessage = document.getElementById("nickNameMessage");
	const nameInput = document.getElementById("name");
	const nameMessage = document.getElementById("nameMessage");
	
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
	  if (value.length >= 4 && value.length <= 20) {
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
	  else if (value.length < 4 || value.length > 20) {
	    pwdMessage.textContent = "비밀번호는 4~20 자리로 작성해주세요.";
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
	  if (pwdCheckInput.value.trim() !== pwdInput.value.trim()) {
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