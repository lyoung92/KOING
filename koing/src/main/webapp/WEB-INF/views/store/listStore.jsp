<%@page import="koing.kosta180.domain.StoreVO"%>
<%@page import="java.util.List"%>
<%@page import="koing.kosta180.persistence.StoreDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   request.setCharacterEncoding("utf-8");
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="../vendor/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="../css/flexslider.css">
<link rel="stylesheet" href="../css/mypage.css">
<script type="text/javascript">
	var result = '${msg}';
	
	if(result == 'success'){
		alert("처리가 완료 되었습니다.");
	}
</script>
</head>
<body>
<jsp:include page="../layout/header.jsp"/>
<!-- Banner Section -->
   <div id="banner" class="image "
      style="background-image: url(http://c1.poing.co.kr/original/images/restaurant/kind.png)">
      <div class="title_wrap">
         <div class="title">
            포잉 다이닝 티켓을 통해 최고의 레스토랑들을<br>합리적인 가격에 만나보세요.
         </div>
      </div>
      <div class="line">
         <hr>
      </div>
      <div class="subtitle">Curated by Koing</div>
   </div>

   <div class="container" style="width: 750px;">
   <c:choose>
   	<c:when test="${category ==null }">
   		<h1>전체상점리스트</h1>
   	</c:when>
   	<c:otherwise>
 	  	<h1>${category}상점 리스트</h1>
   	</c:otherwise>
   </c:choose>
      <table class="storelist table table-hover table-dark">
         <tr>
            <th>상점번호</th>
            <th>이미지</th>
            <th>상호명</th>
            <th>주소</th>
            <th>전화번호</th>
            <th>분류</th>

         </tr>
         <c:choose>
            <c:when test="${storeList == null}">
               <div>상점을 불러오지 못했습니다.</div>
            </c:when>
            <c:otherwise>
               <c:forEach var="store" items="${storeList}">
                  <tr>
                     <td>${store.s_no }</td>
                     <td><div style="width:120px; height:120px;"><a href="/store/detailStore?s_no=${store.s_no }"><img src="../images/store/${store.s_no}/${store.s_no}-1.jpg" style=" width: 100%!important; height: 80%!important"></a></div></td>
                     <td><a href="/store/detailStore?s_no=${store.s_no }">${store.s_name}</a></td>
                     <td>${store.s_address }</td>
                     <td>${store.s_tel }</td>
                     <td>${store.s_category}</td>
                  </tr>
               </c:forEach>
            </c:otherwise>
         </c:choose>
      </table>
   </div>
   <jsp:include page="../layout/footer.jsp"/>
</body>
</html>