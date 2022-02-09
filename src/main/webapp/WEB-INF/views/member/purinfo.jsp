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
<title>마이페이지 내차사기 주문관리</title>
</head>
<body>
<div class="order">
                <table class="purinfo" id="purinfo">
                    <tr class="purinfo_title" height="50px">
                        <td colspan="2">차량정보</td>
                        <td>구매일자</td>
                        <td>배송일자</td>
                        <td>가격</td>
                        <td>문의</td>
                    </tr>
                    <tr>
                        <td>
                            <a href="car_info.html">
                                <img src="${contextPath}/resources/image/볼보앞.png" width="180px" height="140px">                        
                            </a>
                        </td>
                        <td>
                            <a href="car_info.html">
                            <span style="font-size: 25px;">볼보 XC60 2세대 T6 인스크립션</span>
                            </a>
                        </td>
                        <td>
                            <span style="font-weight: 300; font-size: 18px;">2022.01.07</span>
                        </td>
                        <td>
                            <span style="font-weight: 300; font-size: 18px;">2022.01.20 예정</span>
                        </td>
                        <td>
                            <span style="color: #dc232d; font-size: 25px">5,940만원</span>
                        </td>
                        <td>
                            <input type="button" id="inquire_btn" onclick="location.href='board.html';" value="문의하기">
                            <br>
                            <input type="button" id="refund_btn" value="환불하기">
                            <br>
                            <input type="button" id="review_btn" onclick="location.href='board.html';" value="후기작성">
                        </td>
                    </tr>
                </table>
        </div>
</body>
</html>