<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;500;700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;500;700&display=swap" rel="stylesheet">

<html>
	<head>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<link href="${contextPath}/resources/css/Header_Footer.css" rel="stylesheet">
		<link href="${contextPath}/resources/css/list.css" rel="stylesheet">
		<style type="text/css">
			li {list-style: none; float: left; padding: 6px;}
		</style>
	</head>
	<body>
	
		<div id="root">
			
			<section id="container">
				<form role="form" method="get">
					<table id="t_board">
						<tr><th class="t_nav">번호</th><th class="t_nav">제목</th><th class="t_nav">작성자</th><th class="t_nav">등록일</th></tr>
						
						<c:forEach items="${list}" var = "list">
							<tr>
								<td class="t_num"><c:out value="${list.bno}" /></td>
								<td class="t_title">
									<a href="${contextPath}/notice/readView?bno=${list.bno}&
															page=${scri.page}&
															perPageNum=${scri.perPageNum}&
															searchType=${scri.searchType}&
															keyword=${scri.keyword}"><c:out value="${list.title}" /></a>
								</td>
								<td class="t_id"><c:out value="${list.id}" /></td>
								<td class="t_date"><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd"/></td>
							</tr>
						</c:forEach>
					</table>
					
					<div id="t_loc">
						<div class="search">
					    <select name="searchType" class="box1">
					      <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
					      <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
					      <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
					      <option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
					      <option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
					    </select>
					
					    <input type="text" name="keyword" id="keywordInput" class="box2" value="${scri.keyword}"/>
					
					    <button id="searchBtn" type="button" class="box3">검색</button>
					    <script>
					      $(function(){
					        $('#searchBtn').click(function() {
					          self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
					        });
					      }); 
					    </script>
					  </div>
					</div>
					
						<div>
						  <ul class="t_page">
						    <c:if test="${pageMaker.prev}">
						    	<li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
						    </c:if> 
						
						    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
						    	<li><a href="list${pageMaker.makeSearch(idx)}">${idx}</a></li>
						    </c:forEach>
						
						    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						    	<li><a href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
						    </c:if> 
						  </ul>
						</div>
						<br><br>
				</form>
			</section>
		</div>
	</body>
</html>
