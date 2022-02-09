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
		<%@include file="header.jsp" %>
		<link href="${contextPath}/resources/css/Header_Footer.css" rel="stylesheet">
		<link href="${contextPath}/resources/css/readView.css" rel="stylesheet">
		<style type="text/css">
			li {list-style: none; float: left; padding: 6px;}
		</style>
	</head>
	
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='readForm']");
			
			// 수정 
			$(".update_btn").on("click", function(){
				formObj.attr("action", "/allCar/notice/updateView");
				formObj.attr("method", "get");
				formObj.submit();				
			})
			
			// 삭제
			$(".delete_btn").on("click", function(){
				var deleteYN = confirm("삭제하시겠습니까?");
				
				if(deleteYN == true){
				
				formObj.attr("action", "/allCar/notice/delete");
				formObj.attr("method", "post");
				formObj.submit();
				}
			})
			
			//목록
			$(".list_btn").on("click", function(){

				location.href = "${contextPath}/notice/list?page=${scri.page}"
							+"&perPageNum=${scri.perPageNum}"
							+"&searchType=${scri.searchType}&keyword=${scri.keyword}";
				})
			
		})
	</script>
	
	<body>
	
		<div id="root">
			 
			<section id="container">
				<form name="readForm" role="form" method="post">
					<input type="hidden" id="bno" name="bno" value="${read.bno}" />
					<input type="hidden" id="page" name="page" value="${scri.page}"> 
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
				    <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
				</form>
				<div id="t_update_loc">
					<table>
					<tbody>
						<tr>
							<td class="t_num">
								<label for="bno">글 번호</label>
								<input type="text" id="bno" name="bno" value="${read.bno}" />
							</td>
						</tr>	
						<tr>
							<td class="t_title">
								<label for="title">&nbsp;&nbsp;제목</label>
								<input type="text" id="title" name="title" value="${read.title}" readonly="readonly" />
							</td>
						</tr>	
						<tr>
							<td class="t_num">
								<label for="content">&nbsp;&nbsp;내용</label>
								<textarea id="content" name="content" readonly="readonly"><c:out value="${read.content}" /></textarea>
							</td>
						</tr>
						<tr>
							<td class="t_id">
								<label for="id">작성자</label>
								<input type="text" id="id" name="id" value="${read.id}"  readonly="readonly"/>
							</td>
						</tr>
						<tr>
							<td class="t_date">
								<label for="regdate">작성날짜</label>
								<fmt:formatDate value="${read.regdate}" pattern="yyyy-MM-dd" />					
							</td>
						</tr>		
					</tbody>			
				</table>
				<br><br>
				<div id="t_read_btn">
					<button type="submit" class="update_btn">수정</button>
					<button type="submit" class="delete_btn">삭제</button>
					<a href="${contextPath}/notice/list"><button type="submit" class="list_btn">목록</button></a>
				</div>
				</div>
			</section>
		</div>
		<br>
	<div>
		<%@include file="footer.jsp" %>
	</div>
	</body>
</html>