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
<title>마이페이지 - All바른 중고차</title>
<link rel="stylesheet" href="${contextPath}/resources/css/mypage.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;500;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;500;700&display=swap" rel="stylesheet">
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
						<li class="menu_list_item"><span class="dropdown"
							style="text-decoration: underline;">내계정 <c:choose>
									<c:when test="${isLogOn == true && member != null }">
										<div class="dropdown-contents">
											<a href="${contextPath}/member/logout.do">로그아웃</a> <br>
											<a href="${contextPath}/member/mypage.do">마이페이지</a>
										</div>
									</c:when>
									<c:otherwise>
										<div class="dropdown-contents">
											<a href="${contextPath}/member/loginForm.do">로그인</a> <br>
											<a href="${contextPath}/member/signupForm.do">회원가입</a>
										</div>
									</c:otherwise>
								</c:choose>
						</span></li>
					</ul>
                </div>
            </div>
        </nav>
    </header>

    <div class="adbanner" style="text-align: center; padding-top: 15px;">
        <a href="#"> <img src="${contextPath}/resources/image/광고배너(1260x84).png" width="1260px" height="120px"> </a>
    </div>

    <div style="text-align: center;">
        <div class="my_header">
            <div class="my_title">
                <strong class="my_title_name"> ${member.name} 고객님</strong>
            </div>
            <ul class="my_lists">
                <li>
                    <span class="list">내차사기 주문관리</span>
                    <strong class="listNumfn" onclick="textfn('0')">1</strong>
                </li>
                <li>
                    <span class="list">내차팔기 신청관리</span>
                    <strong class="listNumfn" onclick="textfn('1')">0</strong>
                </li>
                <li>
                    <span class="list">방문예약 신청내역</span>
                    <strong class="listNumfn" onclick="textfn('2')">0</strong>
                </li>
                <li style="border: 0px">
                    <span class="list">불편사항 접수내역</span>
                    <strong class="listNumfn" onclick="textfn('3')">0</strong>
                </li>
            </ul>
        </div>
    </div>

    <div style="text-align: center;">
        <div class="info">
            <table class="info_list">
                <tr>
                    <td onclick="textfn('0')" id="orderfn" class="listfn">내차사기 주문관리</td>
                    <td onclick="textfn('1')" id="applyfn" class="listfn">내차팔기 신청관리</td>
                    <td onclick="textfn('2')" id="reservefn" class="listfn">방문예약 신청내역</td>
                    <td onclick="textfn('3')" id="questionfn" class="listfn">불편사항 접수내역</td>
                    <td onclick="textfn('4')" id="modifyfn" class="listfn">회원정보 수정</td>
                </tr>
            </table>
        </div>
    </div>

    <div class="inner_text" style="text-align: center; display: none;">
        <jsp:include page="purinfo.jsp" flush="false" />
    </div>

    <div class="inner_text" style="text-align: center; display: none;">
        <div class="apply">
            <h1>판매신청 내역이 없습니다.</h1>
        </div>
    </div>

    <div class="inner_text" style="text-align: center; display: none;">
        <div class="reserve">
            <h1>예약신청 내역이 없습니다.</h1>
        </div>
    </div>

    <div class="inner_text" style="text-align: center; display: none;">
        <div class="question">
            <h1>문의한 내역이 없습니다.</h1>
            <input type="button" id="question_btn" onclick="location.href='board.html';" value="문의하기">
        </div>
    </div>

    <div class="inner_text" style="display: block;">
        <jsp:include page="modmember.jsp" flush="false" />
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
            <div class="footer_text">
                상호명: 올바른중고차 주식회사<br>
                대표자: 김대용 | 개인정보관리책임자: 관리장<br>
                사업자등록번호: 156-87-00729 | 통신판매업신고: 제 2021-서울강남-0562호 | 사업장 소재지: 서울특별시 강남구<br>
                내차사기 홈서비스: 1588-5577(1) | 일반문의: 1588-5577(4) | 사업제휴문의: kdy8252@naver.com<br>
                Copyright © 올바른중고차 주식회사 All Rights Reserved<br>
                &nbsp;
            </div>
    </footer>

    <script src="${contextPath}/resources/js/mypage.js"></script>
</body>
</html>