<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
   request.setCharacterEncoding("UTF-8");
%>  
<html>
<head>
	<title>All바른 중고차</title>
	<link rel="stylesheet" href="${contextPath}/resources/css/main.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;500;700&display=swap"
        rel="stylesheet">
</head>
<body>
  <!-- 전체를 감싸는 태그 -->
    <div>
        <!--헤더-->
        <header>
            <div style="text-align: center;">
                <a href="${contextPath}/main.do"><img src="${contextPath}/resources/image/logo(100x100).png" id="logo_m" width="120px" height="120px"> </a>
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
        <!--본문-->
        <div>
            <div id="ad_image">
                <!--광고 배너-->
                <img id="imgId" src="${contextPath}/resources/image/m1.PNG" width="1500" height="500" alt="">
            </div>
            <!--검색박스-->
            <div>
                <div id="grayZone">
                    <form>
                        <div id="chooseBox">
                            <a href="#" onclick="switchPage('0')"><span class="boxes">원하는 차가 있어요</span></a>
                            <a href="#" onclick="switchPage('1')"><span class="boxes">예산이 정해져 있어요</span></a>
                        </div>
                        <div id="optionBox">
                          <div class="selectbox" style="display: block">
                            <select id="madeFrom" name="madeFrom">
                                <option value="국산">국산</option>
                                <option value="수입">수입</option>
                            </select>
                            <select id="manufacturer" name="manufacturer">
                                <option value="제조사">제조사</option>
                                <option value="기아">기아</option>
                                <option value="르노삼성">르노삼성</option>
                                <option value="쉐보레(GM대우)">쉐보레(GM대우)</option>
                                <option value="쌍용">쌍용</option>
                                <option value="제네시스">제네시스</option>
                                <option value="현대">현대</option>
                            </select>
                            <select id="model" name="model">
                                <option value="모델">모델</option>
                                <option value="a">K3</option>
                                <option value="a">K5</option>
                                <option value="a">K7</option>
                                <option value="a">레이</option>
                                <option value="a">모닝</option>
                                <option value="a">카니발</option>
                            </select>
                            <select id="specificModel" name="spacificModel">
                                <option value="세부모델">세부모델</option>
                            </select>
                            <span>
                                <input id="opt_txt" type="text" placeholder="모델명을 입력해주세요.">
                                <button id="opt_btn" type="submit" class="searchCars">검색</button>
                            </span>
                          </div>
                          <div class="selectbox" style="display: none">
                            <select>
                                <option value="국산">국산</option>
                                <option value="국산">수입</option>
                            </select>
                            <select>
                                <option value="제조사">제조사</option>
                            </select>
                            <select>
                                <option value="최저가격">최저가격</option>
                            </select>
                            <select>
                                <option value="최고가격">최고가격</option>
                            </select>
                            <span>
                                <input id="opt_txt" type="text" placeholder="모델명을 입력해주세요.">
                                <button id="opt_btn" type="submit" class="searchCars">검색</button>
                            </span>
                           </div>
                        </div>    
                        
                    </form>
                </div>
            </div>

            <p>
            <h2 id="weekly">위클리특가</h2>
            <h3 id="count"></h3>
            <div id="cars_align">
                <ul id="weekly_cars">
                    <li class="noDot">
                        <a href="#">
                            <span class="cars"><img src="${contextPath}/resources/image/car1.jpg" width="280" height="250" alt=""></span>
                            <em>포드익스플로러<br>
                                <del>3,220만원</del>&nbsp; 3,140만원
                            </em>
                        </a>
                    </li>
                    <li class="noDot">
                        <a href="#">
                            <span class="cars"><img src="${contextPath}/resources/image/car2.jpg" width="280" height="250" alt=""></span>
                            <em>현대아반떼AD<br>
                                <del>1,200만원</del>&nbsp; 1,150만원
                            </em>
                        </a>
                    </li>
                    <li class="noDot">
                        <a href="#">
                            <span class="cars"><img src="${contextPath}/resources/image/car3.jpg" width="280" height="250" alt=""></span>
                            <em>BMW2시리즈 액티브 투어러(F45) 조이<br>
                                <del>1,900만원</del>&nbsp; 1,840만원
                            </em>
                        </a>
                    </li>
                    <li class="noDot">
                        <a href="#">
                            <span class="cars"><img src="${contextPath}/resources/image/car4.jpg" width="280" height="250" alt=""></span>
                            <em>기아더 뉴 스포티지 R<br>
                                <del>1,260만원</del>&nbsp; 1,230만원
                            </em>
                        </a>
                    </li>
                    <li class="noDot">
                        <a href="#">
                            <span class="cars"><img src="${contextPath}/resources/image/car5.jpg" width="280" height="250" alt=""></span>
                            <em>현대팰리세이드<br>
                                <del>4,040만원</del>&nbsp; 3,950만원
                            </em>
                        </a>
                    </li>
                </ul>
            </div>
            </p>
            <p>
            <div id="purpleBox">
                <div>
                    <h2 id="findingStore">찾으시는 All Car 직영점이 있으세요?</h2>
                    <div>
                        <div>
                            <ul id="location">
                                <li><a href="#">수도권</a>
                                    <ul>
                                        <li><a href="#">강남직영점</a></li>
                                        <li><a href="#">영등포직영점</a></li>
                                        <li><a href="#">서초직영점</a></li>
                                        <li><a href="#">김포직영점</a></li>
                                        <li><a href="#">수원직영점</a></li>
                                        <li><a href="#">안양직영점</a></li>
                                    </ul>
                                </li>
                                <li><a href="#">경상도</a>
                                    <ul>
                                        <li><a href="#">부산직영점</a></li>
                                        <li><a href="#">양산직영점</a></li>
                                        <li><a href="#">울산직영점</a></li>
                                        <li><a href="#">대구직영점</a></li>
                                        <li><a href="#">포항직영점</a></li>
                                    </ul>
                                </li>
                                <li><a href="#">전라도</a>
                                    <ul>
                                        <li><a href="#">광주직영점</a></li>
                                        <li><a href="#">전주직영점</a></li>
                                    </ul>
                                </li>
                                <li><a href="#">충청도</a>
                                    <ul>
                                        <li><a href="#">대전직영점</a></li>
                                        <li><a href="#">천안직영점</a></li>
                                        <li><a href="#">청주직영점</a></li>
                                    </ul>
                                </li>
                                <li><a href="#">강원도</a>
                                    <ul>
                                        <li><a href="#">원주직영점</a></li>
                                    </ul>
                                </li>
                                <li><a href="#">제주도</a>
                                    <ul>
                                        <li><a href="#">제주직영점</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <div id="whiteBox">
                            <span id="img_store"><img src="${contextPath}/resources/image/직영점.jpg" width="200" height="200" alt=""></span>
                            <span id="info_store">
                                <h4>강남 직영점</h4>
                                주소 서울특별시 강남구 언주로 508 14층(역삼동, 서울상록빌딩)<br>
                                대표전화 1544-9001<br>
                                영업시간 월~토 08:00~20:00<br>
                                점심시간 12:00~13:00 <br>
                                휴점일 매주 일요일<br>
                                보유차량 290대<br>
                            </span>
                            <span id="btn_store">
                                <button id="btn_store11" type="submit">직영점 안내 바로가기</button><br>
                                <button id="btn_store1" type="submit">빠른 길찾기</button><br>
                                <button id="btn_store1" type="submit">직영점 정보 문자전송</button><br>
                                <button id="btn_store1" type="submit">모바일 팩스</button><br>
                            </span>
                        </div>
                    </div>
                </div>
            </div>

            </p>
            <div id="info_align">
                <div id="info_sum">
                    <span id="info_num">
                        <h4>내차 사고 팔 땐</h4>
                        <h4>1588-5455</h4>
                        <span>
                            월~토요일 09:00~18:00<br>
                            점심시간 12:00~13:00<br>
                            일요일 휴무<br>
                        </span>
                    </span>
                    <span id="notice">
                        <h4 id="info_menu">공지사항</h4>
                        <button type="menu" id="info_plus"><a href="#">➕</a></button>
                        <ul id="info_list">
                            <li><a href="#">[공지]휴무안내</a></li>
                            <li><a href="#">[당첨자 발표] 이달의 이벤트11</a></li>
                            <li><a href="#">[업데이트]21.12.19</a></li>
                            <li><a href="#">[이벤트] 이달의 이벤트11</a></li>
                            <li><a href="#">[당첨자 발표]이달의 이벤트10</a></li>
                            <li><a href="#">[업데이트]21.11.19</a></li>
                        </ul>
                    </span>
                    <span id="icons">
                        <img src="${contextPath}/resources/image/warranty.PNG" width="120" height="120" alt="">
                        <img src="${contextPath}/resources/image/foreignS.PNG" width="120" height="120" alt="" id="icon_r">
                    </span>
                </div>
            </div>


        </div>
    </div>
    <!--푸터-->
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
    <script src="${contextPath}/resources/js/main.js"></script>
</body>
</html>
