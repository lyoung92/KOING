<%@page import="java.util.List"%>
<%@page import="koing.kosta180.persistence.CommentDao"%>
<%@page import="koing.kosta180.domain.CommentVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
   request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<script type="text/javascript">
   function getXMLHttpRequest(){
       var httpRequest = null;
   
       if(window.ActiveXObject){
           try{
               httpRequest = new ActiveXObject("Msxml2.XMLHTTP");    
           } catch(e) {
               try{
                   httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
               } catch (e2) { httpRequest = null; }
           }
       }
       else if(window.XMLHttpRequest){
           httpRequest = new window.XMLHttpRequest();
       }
       return httpRequest;    
   }
   

   function checkFunc(){
       if(httpRequest.readyState == 4){
           // 결과값을 가져온다.
           var resultText = httpRequest.responseText;
           if(resultText == 1){ 
               document.location.reload(); // 상세보기 창 새로고침
           }
       }
   }
   
   // 댓글 등록
    function writeCmt()
    {
        var form = document.getElementById("writeCommentForm");
        
        /* var board = form.comment_board.value */
        var id = form.id.value
        var c_contents = form.c_contents.value;
        
        if(!c_contents)
        {
            alert("내용을 입력하세요.");
            return false;
        }
        else
        {    
            var param="id="+id+"&c_contents="+c_contents;
                
            httpRequest = getXMLHttpRequest();
            httpRequest.onreadystatechange = checkFunc;
            httpRequest.open("POST", "insertCommentOk.do", true);    
            httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded;charset=utf-8'); 
            httpRequest.send(param);
        }
    }


   //댓글 삭제
   function deleteCmt(c_no)
   {
       var param="c_no="+c_no;
       
       httpRequest = getXMLHttpRequest();
       httpRequest.onreadystatechange = checkFunc;
       httpRequest.open("POST", "deleteComment.do?c_no"+c_no, true);    
       httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded;charset=UTF-8'); 
       httpRequest.send(param);
   }
   
   // 댓글 수정창
   function cmUpdateOpen(c_no){
      window.name="parentForm";
      window.open("updateCommentForm.do?c_no="+c_no, "updateForm","width=600, height=380, resizable=no, scrollbars=no");
   }
</script>

</head>
<body>
<jsp:include page="../layout/header.jsp"/>
<div class="container" style="padding:0;">
<form action="insertCommentOk.do" method="post"style="width: 800px; margin: auto;">


			
					<table class="table table-dark">
					<thead>
						<tr>
							<th>댓글번호</th>
							<th>내용</th>
							<th>별점</th>
							<th>사진</th>
							<th>예약번호</th>
							<th>아이디</th>
							<th>상점번호</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var='i' items="${commentList}">
							<tr>
								<td>${i.c_no}</td>
								<td>${i.c_contents}</td>
								<td>${i.c_score}</td>
								<td>${i.c_img}</td>
								<td>${i.r_no}</td>
								<td>${i.id}</td>
								<td>${i.s_no}
								<c:if test="${sessionMember.id == i.id }">
									<input type="button" class="btn btn-primary" value="수정" onclick="cmUpdateOpen(${i.c_no})">
									<input type="button" class="btn btn-primary" value="삭제" onclick="deleteCmt(${i.c_no})">
								</c:if>
								</td>
						</tr>
						</c:forEach>
					</tbody>
					</table>




		</form>
</div>
</body>
</html>