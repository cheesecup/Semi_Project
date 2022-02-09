<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;500;700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;500;700&display=swap" rel="stylesheet">

<div style="text-align: center;" id="logo">
   <a href="${contextPath}/main.do">
   <img src="${contextPath}/resources/image/logo(100x100).png" width="120px" height="120px"> </a>
</div>

<div class="nav_menu">
            <div class="cen">
                <div class="menu">
                    <ul class="menu_list">
                        <li class="menu_list_item"><a href="#">내차팔기</a></li>
                        <li class="menu_list_item"><a href="#">내차사기</a></li>
                        <li class="menu_list_item"><a href="#">금융</a></li>
                        <li class="menu_list_item"><a href="#">렌트</a></li>
                        <li class="menu_list_item"><a href="#">위클리특가</a></li>
                        <li class="menu_list_item"><a href="/notice/list">게시판</a></li>
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
                             <br>  
                      </div>
                        </span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        
        <div class="adbanner" style="text-align: center; padding-top: 15px;">
        	<a href=#> <img src="${contextPath}/resources/image/광고배너(1260x84).png" width="1260px" height="120px"> </a>
   	   </div>
   	   
   	   <hr />
   	   
   	   	<h1 id="t_notice">공지사항</h1><br><br>

	<div>
		<div id="t_link">
			<a href="${contextPath}/notice/list">목록</a>
			<a href="${contextPath}/notice/writeView">글 작성</a>
		</div>
	</div>
	<br><br>
   	   <hr />

   	   