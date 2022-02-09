<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" href="${contextPath}/resources/css/board.css">
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
                        <li class="menu_list_item"><a href="board.html" style="text-decoration: underline;">게시판</a></li>
                        <li class="menu_list_item"><span class="dropdown">내계정
                            <c:choose>
                                    	<c:when test="${isLogOn == true && member != null }">
                                    		<div class="dropdown-contents">
                                        		<a href="${contextPath}/member/logout.do">로그아웃</a>
                                        		<br>
                                        		<a href="${contextPath}/member/mypage.do">마이페이지</a>
                                    		</div>
                                    	</c:when>
                                    	<c:otherwise>
                                    		<div class="dropdown-contents">
                                        		<a href="${contextPath}/member/loginForm.do">로그인</a>
                                        		<br>
                                        		<a href="${contextPath}/member/signupForm.do">회원가입</a>
                                    		</div>
                                    	</c:otherwise>
                                    </c:choose>
                        </span>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>

    <div class="adbanner" style="text-align: center; padding-top: 15px;">
        <a href="#"> <img src="${contextPath}/resources/image/광고배너(1260x84).png" width="1260px" height="120px"> </a>
    </div>

    <div style="text-align: center;">
        <div class="info">
            <table class="info_list">
                <tr>
                    <td onclick="textfn('0')" id="noticefn" class="listfn">공지사항</td>
                    <td onclick="textfn('1')" id="question&answerfn" class="listfn">Q&A</td>
                    <td onclick="textfn('2')" id="postscriptnfn" class="listfn">후기</td>
                </tr>
            </table>
        </div>
    </div>

    <div class="inner_text" style="text-align: center; display: block;">
		<div id="t_link">
			<a href="${contextPath}/notice/list">목록</a>
			<a href="${contextPath}/notice/writeView">글 작성</a>
		</div>
		<br>
		<br>
		<br>
        <jsp:include page="list.jsp" flush="false" />
    </div>

    <div class="inner_text" style="text-align: center; display: none;">
        <div class="question&answer">
            <h1>문의 내역이 없습니다.</h1>
            <input type="button" id="question_btn" onclick="location.href='#';" value="문의하기">
        </div>
    </div>

    <div class="inner_text" style="text-align: center; display: none;">
        <div class="postscript">
            <h1>등록된 후기가 없습니다.</h1>
            <input type="button" id="question_btn" onclick="location.href='#';" value="후기올리기">
        </div>
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

    <script src="${contextPath}/resources/js/board.js"></script>
</body>
</html>