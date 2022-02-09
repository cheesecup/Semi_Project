<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<%
   request.setCharacterEncoding("UTF-8");
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 - All바른 중고차</title>
	<link rel="stylesheet" href="${contextPath}/resources/css/signup.css?v1">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;500;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;500;700&display=swap" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	window.onload = function(){
    	document.getElementById("searchAddress_btn").addEventListener("click", function(){ //주소입력칸을 클릭하면
        	//카카오 지도 발생
        	new daum.Postcode({
            	oncomplete: function(data) {
                	// 우편번호와 주소 정보를 해당 필드에 넣는다.
                	document.getElementById("postcode").value = data.zonecode;
                	document.getElementById("address").value = data.address;
                	// 커서를 상세주소 필드로 이동한다.
                	document.getElementById("detailAddress").focus();
            	}
        	}).open();
    	});
	}
	</script>
</head>
<body>
	<header>
        <div style="text-align: center;" id="logo">
            <a href="${contextPath}/main.do"><img src="${contextPath}/resources/image/로그인 로고(100x100).png" width="120px" height="120px"> </a>
        </div>

        <nav class="nav_menu">
            <div class="cen">
                <div class="menu">
                    <ul class="menu_list">
                        <li class="menu_list_item"><a href="#">내차팔기</a></li>
                        <li class="menu_list_item"><a href="search.html">내차사기</a></li>
                        <li class="menu_list_item"><a href="#">금융</a></li>
                        <li class="menu_list_item"><a href="#">렌트</a></li>
                        <li class="menu_list_item"><a href="#">위클리특가</a></li>
                        <li class="menu_list_item"><a href="${contextPath}/notice/list">게시판</a></li>
                        <li class="menu_list_item"><span class="dropdown" style="text-decoration: underline;">내계정
                            <div class="dropdown-contents">
                                <a href="${contextPath}/member/loginForm.do">로그인</a>
                                <br>
                                <a href="${contextPath}/member/signupForm.do" style="text-decoration: underline;">회원가입</a>
                            </div>
                        </span>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>

    <div style="text-align: center;">
        <div class="title">
            <h1 id="signtest" onclick="testfn()"> 회원가입 </h1>
            <p>회원가입을 위해 개인정보를 입력해주세요</p>
        </div>
    </div>

    <div class="wrap">
        <form name="signup_form" class="signup_form" method="post" action="${contextPath}/member/addMember.do">
            <div class="terms_check">
                <h2> 약관동의 </h2>
                <hr>
                <label>
                    <input type="checkbox" name="terms_agree" id="terms_agree" value="">
                    이용약관 동의(필수항목)
                </label>
                <br>
                <label>
                    <input type="checkbox" name="info_agree" id="info_agree" value="">
                    개인정보 수집 및 이용 동의(필수항목)
                </label>
                <br>
                <label>
                    <input type="checkbox" name="refund_agree" id="refund_agree" value="">
                    환불약관 동의(필수항목)
                </label>
                <br>
                <label>
                    <input type="checkbox" name="marketingOk" id="marketing_agree" value="동의">
                    마케팅 활용/수신 동의(선택)
                </label>
                <br>
                <label>
                    (
                    <input type="checkbox" name="noticeKinds" id="notice_agree" value="문자">
                    문자메시지(SMS) 및 앱 푸시 알림
                </label>
                <label>
                    <input type="checkbox" name="noticeKinds" id="email_agree" value="이메일">
                    이메일 )
                </label>
            </div>


            <div class="input_info">
                <table cellspacing="5">
                    <tr>
                        <td colspan="2">
                            <h2> 필수정보 입력 </h2>
                            <hr>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="input_name"> 이름 </label><br>
                            <input type="text" name="name" id="input_name" placeholder="&nbsp;이름 입력">
                        </td>
                        <td>
                            <label for="input_id"> 아이디 </label><br>
                            <input type="text" name="id" id="input_id" placeholder="&nbsp;아이디 입력">
                            <button type="button" class="idcheck_btn" onclick="idcheckfn()"> 중복확인 </button>
                            <br>
                            <label for="id_condition">
                                ※ 4~12자 영문, 숫자 조합으로 입력해 주세요.
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="input_pw"> 비밀번호 입력 </label><br>
                            <input onchange="pwcheckfn()" type="password" name="pwd" 
                                class="pw" id="input_pw" placeholder="&nbsp;비밀번호 입력">
                            <br>
                            <label for="input_pw">
                                ※ 8~15자 영문 대/ 소문자, 숫자, 특수문자 조합으로 입력해 주세요.<br>
                                ※ 특수문자는 [~!@#$%^*+=-_]만 허용됩니다.
                            </label>
                        </td>
                        <td>
                            <label for="pw_check"> 비밀번호 확인 </label><br>
                            <input onchange="pwcheckfn()" type="password" name="pw_check" 
                                class="pw" id="pw_check" placeholder="&nbsp;비밀번호 다시 입력">
                            <br>
                            <label id="pw_check_alert"></label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="input_email"> 이메일 </label><br>
                            <input type="text" name="emailId" id="input_email" placeholder="&nbsp;이메일 입력">
                            @
                            <input type="text" name="emailAddress" id="input_emailadd" placeholder="&nbsp;직접 입력">
                        </td>
                        <td>
                            <label for="input_phone1"> 휴대폰번호 </label><br>
                            <input type="text" name="phoneNum" id="input_phone" onkeyup="auto_hyphen(this)">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <h2> 부가정보 입력(선택) </h2>
                            <p> 부가정보를 입력하면 맞춤형 차량 정보와 서비스를 받을 수 있어요 </p>
                            <hr>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="birth"> 출생년월 </label><br>
                            <input type="text" name="birth_y" id="yy" maxlength="4" placeholder="&nbsp;년">
                            <input type="text" name="birth_m" id="mm" maxlength="2" placeholder="&nbsp;월">
                            <input type="text" name="birth_d" id="dd" maxlength="2" placeholder="&nbsp;일">
                        </td>
                        <td>
                            <label for="gender"> 성별 </label><br>
                            <select name="gender" id="gender">
                                <option value=""> &nbsp;선택 </option>
                                <option value="남자"> 남자 </option>
                                <option value="여자"> 여자 </option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <label for="postcode"> 주소 </label><br>
                           	<input type="text" name="postcode" id="postcode" placeholder="&nbsp;우편번호"
                           						style="width:130px">
                           	<input type="button" name="searchAddress_btn" id="searchAddress_btn" value="주소검색" />
                        </td>
                    </tr>
                    <tr>
                    	<td colspan="2">
                    		<input type="text" name="address" id="address" placeholder="&nbsp;주소"
                    							style="width:450px">
                    	</td>
                    </tr>
                    <tr>
                    	<td colspan="2">
                    		<input type="text" name="detailAddress" id="detailAddress" placeholder="&nbsp;상세주소">
                    	</td>
                    </tr>
                </table>
            </div>

            <div class="btn_sign" style="text-align: center;">
                <input type="submit" value="가입하기" onclick="validationfn()">
            </div>
        </form>
    </div>


    <footer style="text-align: center;">
        <hr>
        <nav class="foot">
            <div class="foot_cen">
                <div class="foot_menu">
                    <ul class="foot_list">
                        <li class="foot_list_item"><a href="#">회사소개</a></li>
                        <li class="foot_list_item"><a href="#">IR정보</a></li>
                        <li class="foot_list_item"><a href="#">보증서비스</a></li>
                        <li class="foot_list_item"><a href="#">인재채용</a></li>
                        <li class="foot_list_item"><a href="#">이용약관</a></li>
                        <li class="foot_list_item"><a href="#">개인정보처리방침</a></li>
                        <li class="foot_list_item"><a href="#">고객지원</a></li>
                        <li class="foot_list_item"><a href="#">윤리강령</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <hr><br>
        <div style="text-align: center;">
            <div class="footer_text">
                상호명: 올바른중고차 주식회사<br>
                대표자: 김대용 | 개인정보관리책임자: 관리장<br>
                사업자등록번호: 156-87-00729 | 통신판매업신고: 제 2021-서울강남-0562호 | 사업장 소재지: 서울특별시 강남구<br>
                내차사기 홈서비스: 1588-5577(1) | 일반문의: 1588-5577(4) | 사업제휴문의: kdy8252@naver.com<br>
                Copyright © 올바른중고차 주식회사 All Rights Reserved<br>
                &nbsp;
            </div>
        </div>
    </footer>
    
    <script src="${contextPath}/resources/js/signup.js"></script>
</body>
</html>