<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="EUC-KR"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/flexslider.css">
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="../css/mypage.css">

</head>
<body>
   <!-- Banner Section -->
   	<div id="banner" class="image">
		<img alt="" src="../images/slider/coupons.jpg"
			style="width: 100%; height: 100%; opacity: 0.4; filter: alpha(opacity = 40);">
		<div class="wrap">
			<div
				style="position: absolute; bottom: 0; width: 100%; margin-bottom: 10%; color: #b91b39; font-size: 22px; line-height: 31px; text-align: center; font-weight: 1000;">
				<a href="../ticket/listAllTicket">코잉 다이닝 티켓을 통해 최고의 레스토랑들을<br>합리적인 가격에 만나보세요.</a>
			</div>
		</div>
	</div>
	
	
		<!-- <div id="banner" class="image" href="../matching/listAllMatching" >
		<img alt="" src="../images/slider/coupons.jpg"
			style="width: 100%; height: 100%; opacity: 0.4; filter: alpha(opacity = 40);">
		<div class="wrap">
			<div
				style="position: absolute; bottom: 0; width: 100%; margin-bottom: 10%; color: #b91b39; font-size: 22px; line-height: 31px; text-align: center; font-weight: 1000;">
					포잉 매칭서비스를 이용하여<br>모두 함께 식사를 즐겨보세요.
			</div>
		</div>
	</div> -->
	
	<a href="../matching/listAllMatching">
		<div id="banner" class="image "
			style="background-image: url(http://c1.poing.co.kr/original/images/product/banner.png)">
			<div class="title_wrap">

				<div class="title">
					포잉 매칭서비스를 이용하여<br>모두 함께 식사를 즐겨보세요.
				</div>
			</div>
			<div class="line">
				<hr>
			</div>
			<div class="subtitle">Curated by Koing</div>
		</div>
	</a>

   <!-- Ticket list Section -->
   <div id="content_wrap">
      <div class="section1">
         
      </div>
      
   </div>

   <script src="http://code.jquery.com/jquery-latest.min.js"></script>
   <script
      src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
   <script src="http://googledrive.com/host/0B-QKv6rUoIcGREtrRTljTlQ3OTg"></script>
   <!-- ie10-viewport-bug-workaround.js -->
   <script src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script>
   <!-- holder.js -->
<%--    <jsp:include page="../layout/footer.jsp" /> --%>
</body>
</html>