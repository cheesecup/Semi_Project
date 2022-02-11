<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<link href="${contextPath}/resources/css/updateView.css" rel="stylesheet">
		<style type="text/css">
			li {list-style: none; float: left; padding: 6px;}
		</style>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='updateForm']");
			
			$(".cancel_btn").on("click", function(){
				event.preventDefault();
				location.href = "${contextPath}/notice/readView?bno=${update.bno}"
					   + "&page=${scri.page}"
					   + "&perPageNum=${scri.perPageNum}"
					   + "&searchType=${scri.searchType}"
					   + "&keyword=${scri.keyword}";
			})
			
			$(".update_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "${contextPath}/notice/update");
				formObj.attr("method", "post");
				formObj.submit();
			})
		})
			
		function fn_valiChk(){
			var updateForm = $("form[name='updateForm'] .chk").length;
			for(var i = 0; i<updateForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("title"));
					return true;
				}
			}
		}
		
	</script>
	<body>
	
		<div id="root">
		
			<section id="container">
				<form name="updateForm" role="form" method="post" action="${contextPath}/notice/update">
					<input type="hidden" name="bno" value="${update.bno}" readonly="readonly"/>
					<div id="t_update_loc">
						<table>
						<tbody>
							<tr>
								<td class="t_title">
									<label for="title">제목</label>
									<input type="text" id="title" name="title" value="${update.title}" class="chk" title="제목을 입력하세요."/>
								</td>
							</tr>
							<tr>
								<td class="t_content">
									<label for="content">내용</label>
									<textarea id="content" name="content" class="chk" title="내용을 입력하세요.">
									<c:out value="${update.content}" /></textarea>
								</td>
							</tr>
							<tr>
								<td class="t_id">
									<label for="id">작성자</label>
									<input type="text" id="id" name="id" value="${update.id}" readonly="readonly"/>
								</td>
							</tr>
							<tr>
								<td class="t_date">
									<label for="regdate">작성날짜</label>
									<fmt:formatDate value="${update.regdate}" pattern="yyyy-MM-dd"/>					
								</td>
							</tr>		
						</tbody>			
					</table>
					<br><br>
					<div id="t_update_btn">
						<button type="submit" class="update_btn">저장</button>
						<button type="submit" class="cancel_btn">취소</button>
					</div>
					</div>
				</form>
			</section>
		</div>
		<br>
		<div>
			<%@include file="footer.jsp" %>
		</div>
	</body>
</html>