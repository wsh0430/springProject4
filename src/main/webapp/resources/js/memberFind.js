let regTel = /^(010|011|016|017|018|019|043)-\d{3,4}-\d{4}$/;

// 인증번호 전송
function sendVerificationCode(type) {
  let nameOrId = "";

  // 아이디 찾기에서 사용하는 전화번호
  let idTel1 = idFindForm.idTel1.value.trim();
  let idTel2 = idFindForm.idTel2.value.trim();
  let idTel3 = idFindForm.idTel3.value.trim();
  let idTel = idTel1 + "-" + idTel2 + "-" + idTel3;  // 하이픈 포함

  // 비밀번호 찾기에서 사용하는 전화번호
  let pwdTel1 = pwFindForm.pwTel1.value.trim();
  let pwdTel2 = pwFindForm.pwTel2.value.trim();
  let pwdTel3 = pwFindForm.pwTel3.value.trim();
  let pwdTel = pwdTel1 + "-" + pwdTel2 + "-" + pwdTel3;  // 하이픈 포함

  // 이름 또는 아이디 처리
  if (type === "id") {
    nameOrId = document.getElementById("idName").value.trim();
  } else if (type === "pw") {
    nameOrId = document.getElementById("pwMemberId").value.trim();
  }

  // 아이디 찾기
  if (type === "id") {
    if (!nameOrId || !idTel2 || !idTel3) {
      Swal.fire({
        icon: 'warning',
        title: '공백',
        text: '모든 정보를 입력해주세요.',
        confirmButtonText: '확인'
      });
      return;
    }

    if (!regTel.test(idTel)) {
      Swal.fire({
        icon: 'error',
        title: '전화번호 오류!',
        text: '올바른 전화번호 형식이 아닙니다.',
        confirmButtonText: '확인'
      });
      return;
    }
  }

  // 비밀번호 찾기
  if (type === "pw") {
    if (!nameOrId || !pwdTel2 || !pwdTel3) {
      Swal.fire({
        icon: 'warning',
        title: '공백',
        text: '모든 정보를 입력해주세요.',
        confirmButtonText: '확인'
      });
      return;
    }

    if (!regTel.test(pwdTel)) {
      Swal.fire({
        icon: 'error',
        title: '전화번호 오류!',
        text: '올바른 전화번호 형식이 아닙니다.',
        confirmButtonText: '확인'
      });
      return;
    }
  }

  // AJAX 요청
  $.ajax({
    type: "POST",
    url: ctp + "/member/sendVerificationCode",
    contentType: "application/json",  // JSON으로 보낸다고 명시
    data: JSON.stringify({
      type: type,          // 'id' 또는 'pw' 값
      idTel: idTel || "",  // idTel이 비어있으면 빈 문자열로 보내기
      pwdTel: pwdTel || "" // pwdTel도 비어있으면 빈 문자열로 보내기
    }),  // JSON 문자열로 변환해서 보냄
    success: function (res) {
      if (res.success) {
        Swal.fire({
          icon: 'success',
          title: '전송 성공',
          text: '인증번호 전송을 성공하였습니다.',
          confirmButtonText: '확인'
        });
        document.getElementById(`${type}VerifySection`).style.display = "block";
      } else {
        Swal.fire({
          icon: 'error',
          title: '전송 실패',
          text: res.message || '인증번호 전송을 실패하였습니다.',
          confirmButtonText: '확인'
        });
      }
    },
    error: function () {
      Swal.fire({
        icon: 'error',
        title: '전송 실패',
        text: '서버 오류가 발생했습니다.',
        confirmButtonText: '확인'
      });
    }
  });
}

// 인증번호 확인
function verifyCode(type) {
  const verificationCodeElement = document.getElementById(`${type}VerificationCode`);

  if (!verificationCodeElement || !verificationCodeElement.value.trim()) {
    Swal.fire({
      icon: 'warning',
      title: '공백',
      text: '인증번호를 입력해주세요.',
      confirmButtonText: '확인'
    });
    return;
  }

  const verificationCode = verificationCodeElement.value.trim();

  $.ajax({
    type: "POST",
    url: ctp + "/member/verifyCode",
    data: JSON.stringify({ code: verificationCode, type: type }), // ✅ type 추가
    contentType: 'application/json',
    success: function (res) {
      const messageElem = document.getElementById(`${type}VerifyMessage`);
      
      if (res === "success") {
        messageElem.style.color = "green";
        messageElem.innerText = "인증 완료";
        Swal.fire({
          icon: 'success',
          title: '휴대폰 인증 완료!',
          text: '휴대폰 인증이 완료되었습니다.',
          confirmButtonText: '확인'
        });
      } else if (res === "expired") {
        messageElem.style.color = "red";
        messageElem.innerText = "인증번호 만료";
        Swal.fire({
          icon: 'error',
          title: '인증번호 만료',
          text: '인증번호가 만료되었습니다. 다시 시도해주세요.',
          confirmButtonText: '확인'
        });
      } else {
        messageElem.style.color = "red";
        messageElem.innerText = "인증 실패";
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
        icon: 'error',
        title: '전송 실패',
        text: '서버 오류가 발생했습니다.',
        confirmButtonText: '확인'
      });
    }
  });
}

// 아이디 찾기
function idSearch() {
  const name = document.getElementById("idName").value.trim();
  const idTel = document.getElementById("idTel1").value.trim() + "-" + document.getElementById("idTel2").value.trim() + "-" + document.getElementById("idTel3").value.trim();
  const verifyMsg = document.getElementById("idVerifyMessage").innerText;


  if (!name || (idTel.length == 10 || idTel.length == 11 || verifyMsg !== "인증 완료")) {
    Swal.fire({
        icon: 'warning',
        title: '입력 확인',
        text: '모든 정보를 올바르게 입력후 인증완료를 해주세요',
        confirmButtonText: '확인'
      });
    return;
  }

  $.ajax({
  type: "POST",
  url: ctp + "/member/idSearch",
  data: { name: name, tel: idTel },
  success: function (res) {
    if (res) {
        let modifiedId = "";
        // 아이디에서 짝수 번째 문자는 '*'로 변경
        for (let i = 0; i < res.length; i++) {
          if (i % 2 === 1) {
            modifiedId += "*"; // 짝수 번째 인덱스는 '*'로 변경
          } else {
            modifiedId += res[i]; // 나머지 문자는 그대로
          }
        }
      Swal.fire({
        icon: 'success',
        title: '아이디 찾기 성공!',
        text: `회원님의 아이디는 "${modifiedId}" 입니다.`,
        confirmButtonText: '확인'
      });
    } else {
      Swal.fire({
        icon: 'warning',
        title: '검색 실패',
        text: '입력하신 정보로 등록된 아이디가 없습니다.',
        confirmButtonText: '확인'
      });
    }
  },
  error: function () {
    Swal.fire({
      icon: 'error',
      title: '서버 오류',
      text: '아이디 찾기 요청 중 오류가 발생했습니다.',
      confirmButtonText: '확인'
    });
  }
});
}
// 비밀번호 찾기
function pwdSearch() {
  const memberId = document.getElementById("pwMemberId").value.trim();
  const pwdTel = document.getElementById("pwTel1").value.trim() + "-" + document.getElementById("pwTel2").value.trim() + "-" + document.getElementById("pwTel3").value.trim();
  const verifyMsg = document.getElementById("pwVerifyMessage").innerText;

  if (!memberId || (pwdTel.length == 10 || pwdTel.length == 11) || verifyMsg !== "인증 완료") {
    Swal.fire({
        icon: 'warning',
        title: '입력 확인',
        text: '모든 정보를 올바르게 입력하고 인증을 완료해주세요.',
        confirmButtonText: '확인'
      });
    return;
  }

  $.ajax({
    type: "POST",
    url: `${ctp}/member/pwdSearch`,
    data: { memberId: memberId, tel: pwdTel },
    success: function (res) {
      if (res === "ok") {
        Swal.fire({
        icon: 'success',
        title: '비밀번호 찾기 성공!',
        text: `임시 비밀번호가 발급되었습니다. 이메일을 확인해주세요.`,
        confirmButtonText: '확인'
      });
      } else {
        Swal.fire({
		      icon: 'warning',
		      title: '검색 실패',
		      text: '입력하신 정보로 등록된 회원이 없습니다.',
		      confirmButtonText: '확인'
		    });     
      }
    },
    error: function () {
      Swal.fire({
      icon: 'error',
      title: '서버 오류',
      text: '비밀번호 찾기 요청 중 오류가 발생했습니다.',
      confirmButtonText: '확인'
    });
    }
  });
}
