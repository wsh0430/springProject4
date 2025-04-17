 //이메일 select로 값을 고르면 2번째 input에 자동으로 들어가게하는 스크립트
 function setEmailDomain(value) {
    const domainInput = document.getElementById('memberEmail2');
    if (value === 'self') {
      domainInput.value = '';
      domainInput.readOnly = false;
    } else {
      domainInput.value = value;
      domainInput.readOnly = true;
    }
  }