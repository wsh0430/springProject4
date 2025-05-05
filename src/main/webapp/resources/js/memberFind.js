let idVerificationPassed = false; // 인증 여부

// 아이디 찾기
function idSearch() {
    const nameInput = document.getElementById("name");
    const telInput = document.getElementById("tel");

    const name = nameInput.value.trim();
    const tel = telInput.value.trim();

    if (!name || !tel) {
        Swal.fire({
            icon: 'error',
            title: '입력 오류',
            text: '이름과 휴대폰 번호를 모두 입력해주세요.',
            confirmButtonText: '확인'
        });
        return;
    }

    if (!idVerificationPassed) {
        Swal.fire({
            icon: 'error',
            title: '인증 필요',
            text: '휴대폰 인증을 먼저 완료해주세요.',
            confirmButtonText: '확인'
        });
        return;
    }

    $.ajax({
        url: ctp + "/member/findId",
        type: "POST",
        contentType: "application/json",
        data: JSON.stringify({ name, tel }),
        success: function (data) {
            if (data.memberId) {
                Swal.fire({
                    icon: "success",
                    title: "아이디 찾기 성공",
                    html: `회원님의 아이디는 <strong>${data.memberId}</strong> 입니다.`,
                    confirmButtonText: "확인"
                });
            } else {
                Swal.fire({
                    icon: 'info',
                    title: '조회 실패',
                    text: '입력하신 정보로 등록된 아이디가 없습니다.',
                    confirmButtonText: '확인'
                });
            }
        },
        error: function () {
            Swal.fire({
                icon: 'error',
                title: '서버 오류',
                text: '서버와의 통신 중 문제가 발생했습니다.',
                confirmButtonText: '확인'
            });
        }
    });
}

// 인증번호 요청
function sendVerificationCode() {
     const telInput = document.getElementById("tel");
    
    // 요소가 null인 경우 예외 처리
    if (!telInput){
        Swal.fire({
            icon: 'error',
            title: '입력 오류',
            text: '전화번호 입력을 확인해주세요.',
            confirmButtonText: '확인'
        });
        return;
    }

		const telValue = telInput.value.trim();
		
    if (!tel || !/^(010|011|016|017|018|019|043)\d{7,8}$/.test(telValue)) {
        Swal.fire({
            icon: 'error',
            title: '전화번호 오류',
            text: '정확한 전화번호(숫자만)를 입력해주세요. (예: 01012345678)',
            confirmButtonText: '확인'
        });
        return;
    }
    // 인증번호 입력란을 보여주기
    document.getElementById("verifySection").style.display = 'block';

    $.ajax({
        url: ctp + "/member/checkTelDuplicate",
        type: "POST",
        contentType: "application/json",
        data: JSON.stringify({ tel: telValue }),
        success: function (data) {
            if (data.success) {
                Swal.fire({
                    icon: 'success',
                    title: '인증번호 발송 완료',
                    text: '인증번호가 휴대폰으로 전송되었습니다.',
                    confirmButtonText: '확인'
                });
                document.getElementById("verifySection").style.display = 'block';
                idVerificationPassed = false;
            } else {
                Swal.fire({
                    icon: 'error',
                    title: '발송 실패',
                    text: '인증번호 발송에 실패했습니다. 다시 시도해주세요.',
                    confirmButtonText: '확인'
                });
            }
        },
        error: function () {
            Swal.fire({
                icon: 'error',
                title: '서버 오류',
                text: '인증번호 발송 중 오류가 발생했습니다.',
                confirmButtonText: '확인'
            });
        }
    });
}

// 인증번호 확인
function verifyCode() {
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
        data: JSON.stringify({ code: verificationCode }),
        contentType: 'application/json',
        success: function (data) {
            if (data === 'success') {
                isPhoneVerified = true; // 인증 완료 처리
                Swal.fire({
                    icon: 'success',
                    title: '휴대폰 인증 완료!',
                    text: '휴대폰 인증이 완료되었습니다.',
                    confirmButtonText: '확인'
                });
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