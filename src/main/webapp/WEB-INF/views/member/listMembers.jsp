<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%>    


<html>
<head>
<meta charset=UTF-8">
<title>회원 정보 출력창</title>
</head>
<body>
<table border="1"  align="center">
    <tr align="center" bgcolor="lightgreen">
    	<td><b>이름</b></td>
      	<td><b>아이디</b></td>
      	<td><b>비밀번호</b></td>
      	<td><b>이메일</b></td>
      	<td><b>휴대폰번호</b></td>
      	<td><b>생년월일</b></td>
      	<td><b>성별</b></td>
      	<td><b>우편번호</b></td>
      	<td><b>주소</b></td>
      	<td><b>상세주소</b></td>
      	<td><b>마케팅 수신동의</b></td>
      	<td><b>수신방법</b></td>
      	<td><b>가입일</b></td>
   	</tr>
   
 <c:forEach var="member" items="${membersList}" >     
   	<tr align="center">
   		<td>${member.name}</td>
		<td>${member.id}</td>
      	<td>${member.pwd}</td>
      	<td>${member.emailId}@${member.emailAddress}</td>
      	<td>${member.phoneNum}</td>
      	<td>${member.birth_y}${member.birth_m}${member.birth_d}</td>
      	<td>${member.gender}</td>
      	<td>${member.postcode}</td>
      	<td>${member.address}</td>
      	<td>${member.detailAddress}</td>
      	<td>${member.marketingOk}</td>
      	<td>${member.noticeKinds}</td>  	
      	<td>${member.regdate}</td>  	
    </tr>
  </c:forEach>   
</table>
<a href="${contextPath}/member/signupForm.do"><h1 style="text-align:center">회원가입</h1></a>
</body>
</html>
