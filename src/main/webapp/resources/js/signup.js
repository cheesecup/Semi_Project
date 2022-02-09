// 마케팅 수신 동의 체크 여부

// 비밀번호 일치 확인
function pwcheckfn() {
    var input_pw = document.getElementById('input_pw');
    var pw_check = document.getElementById("pw_check");
    var pw_check_alert = document.getElementById('pw_check_alert');
    if(input_pw.value != '' && pw_check.value != '') {
        if(input_pw.value === pw_check.value) {
            pw_check_alert.innerHTML='* 비밀번호가 서로 일치합니다.';
            pw_check_alert.style.color='blue';
        } else if(input_pw.value != pw_check.value) {
            pw_check_alert.innerHTML='* 비밀번호가 서로 다릅니다.';
            pw_check_alert.style.color='red';
        }
     } else if(input_pw.value === '' && pw_check.value === '') {
        pw_check_alert.innerHTML='';
    }
}

//아이디 중복확인
function idcheckfn() {
    var input_id = $("#input_id").val();
    if(input_id==''){
      	 alert("ID를 입력하세요");
      	 return;
       }
    $.ajax({
    	type:"post",
        async:false, // 동기식  
        url:"idcheck.do",
        dataType:"text",
    	data: {id : input_id},
    	success: function (data, textStatus){
    		if(data == "false") {
    			alert("사용 가능한 ID입니다.");
    		} else {
    			alert("사용할 수 없는 ID입니다.");
    		}
    	}
    });
}

// 휴대폰번호 하이픈 자동생성
function auto_hyphen(obj) {

    var number = obj.value.replace(/[^0-9]/g, "");
    var phone = "";

    if(number.length < 4) {
        return number;
    } else if(number.length < 7) {
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3);
    } else if(number.length < 11) {
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3, 3);
        phone += "-";
        phone += number.substr(6);
    } else {
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3, 4);
        phone += "-";
        phone += number.substr(7);
    }
    obj.value = phone;
}

// 가입하기 유효성 검사
function validationfn() {
    var terms_agree = document.getElementById("terms_agree").checked;
    var info_agree = document.getElementById("info_agree").checked;
    var refund_agree = document.getElementById("refund_agree").checked;

    event.preventDefault(); 
    if(!terms_agree || !info_agree || !refund_agree) {
        alert('필수항목에 동의해 주세요');
        terms_agree.focus();
        return false;
    }

    var input_name = document.getElementById('input_name');
    if(input_name.value === '') {
        alert('이름을 입력해주세요.');
        input_name.focus();
        return false;
    }
    var valid_name = /^[가-힝]{2,10}$/;
    if(!valid_name.test(input_name.value)) {
        alert('이름 형식이 틀렸습니다.');
        input_name.focus();
        return false;
    }

    var input_id = document.getElementById('input_id');
    if(input_id.value === '') {
        alert('아이디를 입력해주세요.');
        input_id.focus();
        return false;
    }
    var vaild_id = /^[a-z0-9]{4,12}$/;
    if(!vaild_id.test(input_id.value)) {
        alert('아이디는 4~12자의 영문,숫자 조합으로 입력해주세요.');
        input_id.focus();
        return false;

    }

    var input_pw = document.getElementById('input_pw');
    if(input_pw.value === '') {
        alert('비밀번호를 입력해주세요.');
        input_pw.focus();
        return false;
    }
    var valid_pw = /^(?=.*[a-zA-Z])(?=.*[~!@#$%^*+=-_])(?=.*[0-9]).{8,20}$/;
    if(!valid_pw.test(input_pw.value)) {
        alert('비밀번호는 8~15자 영문 대/소문자,숫자,특수문자 조합으로 입력해주세요.');
        input_pw.focus();
        return false;
    }
    var pw_check = document.getElementById("pw_check");
    if(pw_check.value === '') {
        alert('비밀번호 확인을 해주세요');
        pw_check.focus();
        return false;
    }

    var input_email = document.getElementById("input_email");
    var input_emailadd = document.getElementById("input_emailadd");
    if(input_email.value === '' || input_emailadd.value === '') {
        alert('이메일을 입력해주세요');
        input_email.focus();
        return false;
    }
    var valid_email = /^[a-z0-9]{4,12}$/;
    var valid_emailadd = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; //대소문자 구분 안함
    if(!valid_email.test(input_email.value) || !valid_emailadd.test(input_emailadd.value)) {
        alert('이메일을 잘못 입력했습니다.');
        input_email.focus();
        return false;
    }

    var input_phone = document.getElementById("input_phone");
    if(input_phone.value === '') {
        alert('휴대폰번호를 입력해주세요');
        input_phone.focus();
        return false;
    }
    var valid_phone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
    if(!valid_phone.test(input_phone.value)) {
        alert('휴대폰번호를 잘못 입력했습니다');
        input_phone.focus();
        return false;
    }

    alert('회원가입이 되셨습니다.');
    document.signup_form.submit();
}