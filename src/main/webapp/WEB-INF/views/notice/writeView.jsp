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
	<link href="${contextPath}/resources/css/writeView.css" rel="stylesheet">
	<style type="text/css">
			li {list-style: none; float: left; padding: 6px;}
	</style>
</head>

	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='writeForm']");
			
			$(".write_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "${contextPath}/notice/write");
				formObj.attr("method", "post");
				formObj.submit();
			});
		})
		function fn_valiChk(){
			var regForm = $("form[name='writeForm'] .chk").length;
			for(var i = 0; i<regForm; i++){
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
			<form name="writeForm" method="post" action="${contextPath}/notice/write">
				<div id="t_update_loc">
					<table>
					<tbody>
						<tr>
							<td class="t_num">
								<label for="title">제목</label>
								<input type="text" id="title" name="title" class="chk" title="제목을 입력하세요."/>
							</td>
						</tr>
						<tr>
							<td class="t_content">
								<label for="content">내용</label>
								<textarea id="content" name="content" class="chk" title="내용을 입력하세요."></textarea>
							</td>
						</tr>
						<tr>
							<td class="t_id">
								<label for="id">작성자</label>
								<input type="text" id="id" name="id" class="chk" title="아이디를 입력하세요."/>
							</td>
					</tbody>
				</table>
				<br><br>
				<div id="t_write_btn">
					<button type="submit" class=write_btn>작성</button>
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