<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
   request.setCharacterEncoding("UTF-8");
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 - All바른 중고차</title>
	<link rel="stylesheet" href="${contextPath}/resources/css/login.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;500;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;500;700&display=swap" rel="stylesheet">
    
   <%--  <c:choose>
		<c:when test="${result =='loginfailed'}">
	  		<script>
	      		alert('${result}');
	      		location.href="<c:out value="${contextPath}"/>${url}";
	  		</script>
		</c:when>
	</c:choose>  --%>
</head>
<body>
<div>
        <h1 id="logo"><a href="${contextPath}/main.do"><img img src="${contextPath}/resources/image/logo.png"
                    width="200" height="100" alt="home"></a></h1>
    </div>
    <div id="wholePage">
        <div id="log_form">
            <div>
                <h3 id="log_div">로그인</h3>
            </div>
            <div>
                <form name="login_form" id="login_form" method="post" action="${contextPath}/member/login.do">
                    <div id="t_box">
                        <div id="id_div">
                            <input name="id" id="size_textbox1" type="text" placeholder="아이디 입력">
                        </div>
                        <div id="pw_div">
                            <input name="pwd" id="size_textbox2" type="password" placeholder="비밀번호 입력">
                        </div>
                    </div>
                    <div id="opt_div">
                        <span><input type="checkbox" id="a"><label for="a">아이디 저장</label></span>
                        <span id="find"><a href="#">아이디 찾기</a></span>
                        <span id="find"><a href="#">비밀번호 찾기</a></span>
                    </div>
                    <div id="button_div">
                        <button id="login_button" type="submit" onclick="loginCheck()">로그인</button>
                    </div>
                    <div id="reg_div">
                        <span>아직 M Car 회원이 아니세요?</span>
                        <span id="float_r"><a href="${contextPath}/member/signupForm.do">회원가입</a></span>
                    </div>
                    <div id="guest_search">
                        <span>내차팔기 신청내역을 조회하실 수 있습니다</span>
                        <span id="float_r"><a href="#">비회원 조회</a></span>
                    </div>
                </form>
            </div>
        </div>
        <div id="ad_image">
            <img id="imgId" src="${contextPath}/resources/image/0.jpg" alt="">
        </div>
    </div>
    <div id="rights">Copyright © 올바른중고차 주식회사 All Rights Reserved<br></div>
    <script src="${contextPath}/resources/js/login.js"></script>
</body>
</html>