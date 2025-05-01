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
	//정규식 정의
	
	let regName = /^[가-힣a-zA-Z]{1,10}$/; 				//한글 + 영문만 허용, 길이:1~10자
	let regTel = /\d{3}-\d{4}-\d{4}$/;					//000-0000-0000 + 하이픈 구조
	let regEmail = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

	
	//회원가입에 필요한 정보 체크
 	function fCheck() {
	  console.log("fCheck 실행됨");
	//필수항목 먼저 체크
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
		if(!regName.test(name)) {
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
			  //모든 체크가 완료되었을때 email/tel을 채워준후 서버로 전송처리한다.
				myform.email.value = email;
				myform.tel.value = tel;
				myform.address.value = address;
				
				myform.submit();
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

	const nameInput = document.getElementById("name");
	const nameMessage = document.getElementById("nameMessage");
	
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
		
		function deleteCheck() {
			let ans = confirm("정말 탈퇴 하실겁니까?")
			if(ans){
				ans = confirm("탈퇴후 1달간 같은 아이디로 재가입할수 없습니다. \n\n 계속 진행할까요?");
				if(ans) location.href = ctp + "/member/memberPassCheck"
			}
		}
		
