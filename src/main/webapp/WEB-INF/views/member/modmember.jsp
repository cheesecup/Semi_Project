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
<title>마이페이지 회원정보 수정</title>
</head>
<body>
<form name="modify_form" class="modify_form" method="post">
        <div class="modify">
            <table class="modify_table">
                <tr>
                    <td>
                        <label for="modify_id"> 아이디 </label><br>
                        <input type="text" name="id" id="modify_id" value="${member.id}" readonly="readonly">
                    </td>
                    <td>
                        <label for="modify_phone"> 휴대폰번호 </label><br>
                        <input style="width: 195px;" type="text" name="phoneNum" id="modify_phone" onkeyup="auto_hyphen(this)"
                            placeholder="&nbsp;휴대폰번호 입력">
                        <input type="button" name="self_certify" id="self_certify" value="본인인증">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="modify_pw1"> 새 비밀번호 </label><br>
                        <input onchange="pwcheckfn()" type="password" name="pwd" id="modify_pw1" placeholder="&nbsp;비밀번호 입력"><br>
                        <label for="modify_pw1">
                            ※ 8~15자 영문 대/ 소문자, 숫자, 특수문자 조합으로 입력해 주세요.<br>
                            ※ 특수문자는 [~!@#$%^*+=-_]만 허용됩니다.
                        </label>
                    </td>
                    <td>
                        <label for="modify_pw2"> 새 비밀번호 확인 </label><br>
                        <input onchange="pwcheckfn()" type="password" name="pwd_check" id="modify_pw2" placeholder="&nbsp;비밀번호 다시 입력">
                        <br>
                        <label id="pw_check_alert"></label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="modify_email"> 이메일 </label><br>
                        <input type="text" name="emailId" id="modify_email" value="${member.emailId}">
                        @
                        <input type="text" name="emailAddress" id="modify_emailadd" value="${member.emailAddress}">
                    </td>
                    <td style="text-align: center;">
                        <label></label><br>
                        <input type="submit" name="member_leave" id="member_leave" value="회원탈퇴"
                        							onclick="javascript: form.action='${contextPath}/member/deleteMember.do';" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center;">
                        <div class="modify_btn">
                            <input type="reset" value="취 소">
                            &nbsp;
                            <input type="submit" onclick="modifyfn()" value="수정하기">
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>