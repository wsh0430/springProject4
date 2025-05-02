'use strict';

let nickCheckSw = 0;

//정규식 정의
let regNickName = /^[가-힣a-zA-Z0-9]{1,20}$/;	//한글 + 영대소문자 + 숫자, 길이:1~20자

function nCheck() {
	let nickName = myform.nickName.value.trim();
	
	let submitFlag = 0;
	
	if(!regNickName.test(nickName)) {
			document.getElementById('nickNameMessage').textContent = "닉네임은 한글 + 영대소문자 + 숫자, 20자 이내여야 합니다.";
			document.getElementById('nickNameMessage').style.display= 'block';
			myform.nickName.focus();
			return false; 
		}
		else {
			submitFlag = 1;
		}
		if(submitFlag == 1) {
			if(nickCheckSw == 0) {
					 Swal.fire({
				      icon: 'warning',
				      title: '닉네임 중복 확인 필요!',
				      text: '닉네임 중복체크 버튼을 눌러주세요.',
				      confirmButtonText: '확인'
				    });
					document.getElementById("nickNameBtn").focus();
				}
				else{
					myform.submit();
				}
		}
		else {
			Swal.fire({
		    icon: 'error',
		    title: '전송 실패!',
		    text: '회원 정보를 확인해주세요.',
		    confirmButtonText: '확인'
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
      return false;
		}
		else if(nickName == sNickName) {
			Swal.fire({
          icon: 'info',
          title: '알림',
          text: '현재 닉네임을 그대로 사용합니다.',
          confirmButtonText: '확인'
      });
      nickCheckSw = 1;
      myform.nickName.readOnly = ture;
      return false;
		}
		else if(nickName.trim() != ""){
			$.ajax({
				url 	:  ctp + "/member/memberNickCheck",
				type	: "get",
				data	: {nickName : nickName},
				success:function(res) {
					console.log(res);  // 서버에서 반환된 값이 무엇인지 확인
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
	const nickNameInput = document.getElementById("nickName");
	const nickNameMessage = document.getElementById("nickNameMessage");
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