/* 선택박스 css 변경 함수 */
// 초기화
function init() {
    var listfn = document.getElementsByClassName("listfn");

    listfn[4].classList.add("list_clicked");
}
init();

function purinfocntfn() {
	var purinfo = document.getElementsByClassName("purinfo");
	var rowscnt = table.rows.length;
	innerText = rowscnt - 1;
}

// 표, 숫자 클릭시 내용 전환
function textfn(text_num) {
    var inner_text = document.getElementsByClassName("inner_text");
    var listfn = document.getElementsByClassName("listfn");

    for (var i=0; i<inner_text.length; i++) {
        inner_text[i].style.display = 'none';
        listfn[i].classList.remove("list_clicked");
    }
    switch(text_num) {
        case '0':
            inner_text[0].style.display = 'block';
            listfn[0].classList.add("list_clicked");
            break;
        case '1':
            inner_text[1].style.display = 'block';
            listfn[1].classList.add("list_clicked");
            break;
        case '2':
            inner_text[2].style.display = 'block';
            listfn[2].classList.add("list_clicked");
            break;
        case '3':
            inner_text[3].style.display = 'block';
            listfn[3].classList.add("list_clicked");
            break;
        case '4':
            inner_text[4].style.display = 'block';
            listfn[4].classList.add("list_clicked");
            break;
    }
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

// 비밀번호 일치 확인
function pwcheckfn() {
    var modify_pw1 = document.getElementById('modify_pw1');
    var modify_pw2 = document.getElementById("modify_pw2");
    var pw_check_alert = document.getElementById('pw_check_alert');
    if(modify_pw1.value != '' && modify_pw2.value != '') {
        if(modify_pw1.value === modify_pw2.value) {
            pw_check_alert.innerHTML='* 비밀번호가 서로 일치합니다.';
            pw_check_alert.style.color='blue';
        } else if(modify_pw1.value != modify_pw2.value){
            pw_check_alert.innerHTML='* 비밀번호가 서로 다릅니다.';
            pw_check_alert.style.color='red';
        }
    } else if(modify_pw1.value === '' && modify_pw2.value === '') {
        pw_check_alert.innerHTML='';
    }
}

function modifyfn() {
    var modify_phone = document.getElementById("modify_phone");
    var modify_pw1 = document.getElementById("modify_pw1");
    var modify_pw2 = document.getElementById("modify_pw2");
    var modify_email = document.getElementById("modify_email");
    var modify_emailadd = document.getElementById("modify_emailadd");

    event.preventDefault(); 
    if(modify_phone.value === '') {
        alert('휴대폰번호를 입력해주세요');
        return modify_phone.focus();
    }
    var valid_phone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
    if(!valid_phone.test(modify_phone.value)) {
        alert('휴대폰번호를 잘못 입력했습니다');
        return modify_phone.focus();
    }

    if(modify_pw1.value === '') {
        alert('비밀번호를 입력해주세요.');
        return modify_pw1.focus();
    }
    var valid_pw = /^(?=.*[a-zA-Z])(?=.*[~!@#$%^*+=-_])(?=.*[0-9]).{8,20}$/;
    if(!valid_pw.test(modify_pw2.value)) {
        alert('비밀번호는 8~15자 영문 대/소문자,숫자,특수문자 조합으로 입력해주세요.');
        return modify_pw2.focus();
    }
    if(modify_pw2.value === '') {
        alert('비밀번호 확인을 해주세요');
        return modify_pw2.focus();
    }

    if(modify_email.value === '' || modify_emailadd.value === '') {
        alert('이메일을 입력해주세요');
        return modify_email.focus();
    }
    var valid_email = /^[a-z0-9]{4,12}$/;
    var valid_emailadd = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; //대소문자 구분 안함
    if(!valid_email.test(modify_email.value) || !valid_emailadd.test(modify_emailadd.value)) {
        alert('이메일을 잘못 입력했습니다.');
        return modify_email.focus();
    }

    alert('회원정보 수정이 되었습니다.');
    document.modify_form.action = "/allCar/member/updateMember.do";
    document.modify_form.submit();
}
