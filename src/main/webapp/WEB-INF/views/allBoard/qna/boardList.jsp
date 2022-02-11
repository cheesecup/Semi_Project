<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="false" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
<script type="text/javascript">
  $(document).redy(function() {
	  var totalPage = ${totalPage}; //전체 페이지
	  var startPage = ${startPage}; //현재 페이지
	  
	  var pagination = "";
	  
	  var forStart=0;
	  var froEnd=0;
	  
	  if((startPage-5) < 1) {
		  forStart=1;
	  }else{
		  forStrat=startPage-5
	  }
	  if(forStart == 1){
          
          if(totalPage>9){
              forEnd = 10;
          }else{
              forEnd = totalPage;
          }
           
      }else{
          if((startPage+4) > totalPage){
              forEnd = totalPage;              
              if(forEnd>9){
                  forStart = forEnd-9
              }              
          }else{
              forEnd = startPage+4;
          }
      }
	  for(var i = forStart ; i<= forEnd ; i++){
          if(startPage == i){
              pagination += ' <button name="page_move" start_page="'+i+'" disabled>'+i+'</button>';
          }else{
              pagination += ' <button name="page_move" start_page="'+i+'" style="cursor:pointer;" >'+i+'</button>';
          }
      }
	  $("#pagination").append(pagination);
      //--페이지 셋팅   
      $("a[name='subject']").click(function(){           
          location.href = "/allCar/board/view?id="+$(this).attr("content_id");         
      });       
      $("#write").click(function(){
          location.href = "/allCar/board/edit"; //"/board/edit"
      });                      
      $(document).on("click","button[name='page_move']",function(){
           
          var visiblePages = 10;//리스트 보여줄 페이지
           
          $('#startPage').val($(this).attr("start_page"));//보고 싶은 페이지
          $('#visiblePages').val(visiblePages);
           
          $("#frmSearch").submit();
           
      });
  });
</script>
 <style>
  .mouseOverHighlight {
         //border-bottom: 1px solid black;
         cursor: pointer !important;
         color: black;
         pointer-events: auto;
         font-weight: bold;
         
      }
   .mouseOverHighlight:hover {
      border-bottom: 1px solid black;
   }  
   #write {
    background: #dc232d;
    font-weight: bold;
    color: white;
    border-color: #dc232d;
   }
   th {
     background: #dc232d;
     color: white;
   }
 </style>
</head>
<body>
  <form class="form-inline" id="frmSearch" action="${contextPath}/board/list">
            <input type="hidden" id="startPage" name="startPage" value=""><!-- 페이징을 위한 hidden타입 추가 -->
            <input type="hidden" id="visiblePages" name="visiblePages" value=""><!-- 페이징을 위한 hidden타입 추가 -->
            <div align="center">
                <table width="1200px">
                    <tr>
                        <td align="right">
                            <button type="button" id="write" name="write" onClick="location.href='${contextPath}/board/view'" >글 작성</button>
                        </td>
                    </tr>
                </table>
                <br>
                <table border="1" width="1200px">
                    <tr>
                        <th width="50px" >
                          No
                        </th>
                        <th width="850px">
                                                        제목
                        </th>
                        <th width="100px">
                                                        작성자
                        </th>
                        <th width="200px">
                                                        작성일
                        </th>
                    </tr>
                    <c:choose>
                        <c:when test="${fn:length(boardList) == 0}">
                            <tr>
                                <td colspan="4" align="center">
                                                                           조회결과가 없습니다.
                                </td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="boardList" items="${boardList}" varStatus="status">
                                <tr>
                                    <td align="center">${boardList.id}</td>
                                    <td>
                                        <a name="subject" class="mouseOverHighlight" content_id="${boardList.id}">${boardList.subject}</a>
                                    </td>
                                    <td align="center">${boardList.writer}</td>
                                    <td align="center">${boardList.register_datetime}</td>
                                </tr>
                            </c:forEach>
                        </c:otherwise> 
                    </c:choose>
                </table>
                <br>
                <div id="pagination"></div>
            </div>
        </form>
</body>
</html>