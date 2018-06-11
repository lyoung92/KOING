<%@page import="koing.kosta180.domain.StoreVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="koing.kosta180.domain.CommentVO"%>
<%@page import="java.util.List"%>
<%@page import="koing.kosta180.domain.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Bootstrap core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../css/blog-home.css" rel="stylesheet">
<script src="//code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<style>
	.carousel-item{
		width: 750!important;
		height: 400px!important;
	}
	p.card-text{
		color: #ffffff;
    font-weight: 1000;
    font-size: 17px;
	}
</style>
<body>
<jsp:include page="../layout/header.jsp"/>
    <!-- Page Content -->
    <div class="container">

      <div class="row">

        <!-- Blog Entries Column -->
        <div class="container" style="padding:0; font-family: monospace; margin-top: 5%;" >

          <h1 class="my-4">${store.s_name } / 
            <small>${store.s_category }</small>
          </h1>
          

          <!-- Blog Post -->
          <div class="card mb-4" style="border-radius:6px; background-color:#b91b39; width: 800px;margin: auto; text-align: center;">
               <div id="carouselExampleIndicators" class="carousel slide"
                  data-ride="carousel" style="height:100%; width:100%">
                  <ol class="carousel-indicators">
                     <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                     <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                     <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                  </ol>
                  <div class="carousel-inner">
                     <div class="carousel-item active">
                        <img class="d-block w-100" src="../images/store/${store.s_no}/${store.s_no}-1.jpg" alt="첫번째 슬라이드"
                        		style=" width: 100%!important; height: 100%!important;">
                     </div>
                     <div class="carousel-item">
                        <img class="d-block w-100" src="../images/store/${store.s_no}/${store.s_no}-2.jpg" alt="두번째 슬라이드"
                        		style=" width: 100%!important; height: 100%!important;">
                     </div>
                     <div class="carousel-item">
                        <img class="d-block w-100" src="../images/store/${store.s_no}/${store.s_no}-3.jpg" alt="세번째 슬라이드"
                        		style=" width: 100%!important; height: 100%!important;">
                     </div>
                  </div>
                  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                     <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                     <span class="sr-only">이전</span>
                  </a>
                  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                     <span class="carousel-control-next-icon" aria-hidden="true"></span>
                     <span class="sr-only">다음</span>
                  </a>
               </div>
               <div class="card-body">
              <h2 class="card-title"></h2>
              <p class="card-text">${store.s_address }</p>
              <p class="card-text">${store.s_tel }</p>
              <p class="card-text">${store.s_category }</p>
              <p class="card-text">${store.s_keyword }</p>
              <a href="reservationStore.do?s_no=${store.s_no}" class="btn btn-primary">예약하기 &rarr;</a>
            </div>   
            <div class="card-footer text-muted">
              Posted on January 1, 2017 by
              <a href="#">Start Bootstrap</a>
            </div>
          </div>

				<jsp:include page="../review/comment.jsp" /><!-- 리뷰 작성 폼 -->
				<!-- Pagination -->
         

        </div>
        </div>
      <!-- /.row -->

      </div>
    <!-- /.container -->

    <jsp:include page="../layout/footer.jsp"/>

    <!-- Bootstrap core JavaScript -->
    <script src="../vendor/jquery/jquery.min.js"></script>
    <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>