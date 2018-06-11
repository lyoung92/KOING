<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Koing - Elegant, Minimal, Creative Bootstrap Template</title>

<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/flexslider.css">
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="../css/responsive.css">
<link rel="stylesheet" href="../css/animate.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<style type="text/css">
div .item > img{
width: 1519.2px;
height: 500px;
opacity: 0.4;
filter: alpha(opacity=40);
}
</style>

	
</head>

<body>
	<jsp:include page="../layout/header.jsp" />

	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<c:forEach var="list" items="${recommendStoreList}" varStatus="i">
				<c:if test="${i.index == 0 }">
					<li data-target="#myCarousel" data-slide-to="${i.index}" class="active"></li>			
				</c:if>
				<c:if test="${i.index != 0 }">
					<li data-target="#myCarousel" data-slide-to="${i.index}"></li>			
				</c:if>
			</c:forEach>
		
		</ol>
		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
		
			<c:forEach var="list" items="${recommendStoreList}" varStatus="i">
				<c:choose>
					<c:when test="${i.index==0}">
						<div class="item active">		
							<img src="../images/store/${list.s_no}/${list.s_no}-1.jpg" alt="Chania">
							<div class="carousel-caption" onclick="location.href='../store/detailStore?s_no=${list.s_no}';">
								<h3>${list.s_name}</h3>
								<p>${list.s_contents}</p>
							</div>
						</div>			
					</c:when>
					<c:otherwise>
						<div class="item">		
							<img src="../images/store/${list.s_no}/${list.s_no}-1.jpg" alt="Chania">
							<div class="carousel-caption" onclick="location.href='../store/detailStore?s_no=${list.s_no}';">
								<h3>${list.s_name}</h3>
								<p>${list.s_contents}</p>
							</div>
						</div>			
					</c:otherwise>
			</c:choose>	
		</c:forEach>
			
		</div>
		<!-- Controls -->
		<a class="left carousel-control" href="#myCarousel" role="button"
			data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
			aria-hidden="true"></span> <span class="sr-only">Previous</span></a> <a
			class="right carousel-control" href="#myCarousel" role="button"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span></a>
	</div>

	<!-- Slider Section -->

	<!-- Service Section -->
	<!-- <section id="services" class="section services">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-6 col-sm-3">
					<div class="services-content">
						<h4>We're Australia based branding & design agency.</h4>
						<p>Fusce dapibus, tellus ac cursus commodo, tortor mauris
							condimentum nibh, ut fermentum massa justo sit amet risus.
							Maecenas sed diam eget risus varius blandit sit amet non magna.
							Nullam quis risus eget urna mollis ornare vel eu leo.</p>
					</div>
				</div>
				<div class="col-md-3 col-sm-3"> 	
					<div class="services-content">
						<h5>Brand Experience</h5>
						<ul>
							<li><a href="#">Web Design</a></li>
							<li><a href="#">Mobile Application</a></li>
							<li><a href="#">Product Development</a></li>
							<li><a href="#">Packaging</a></li>
							<li><a href="#">Retail Management</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-3 col-sm-3">
					<div class="services-content">
						<h5>Media Marketing</h5>
						<ul>
							<li><a href="#">Marketing Research</a></li>
							<li><a href="#">Social Marketing</a></li>
							<li><a href="#">Mobile marketing</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section> -->
	<!-- Service Section -->

	<!-- portfolio grid section -->
	<section id="portfolio" class="section portfolio">
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 portfolio-item">
				<a href="../store/listStore" class="portfolio-link">
					<div class="caption">
						<div class="caption-content">
							<h3>ALL Category</h3>
							<h4>전체</h4>
						</div>
					</div> <img src="../images/portfolio/all.jpg" class="img-responsive"
					alt="">
				</a>
			</div>

			<div class="col-sm-3 portfolio-item">
				<a href="../store/listStore?s_category=한식" class="portfolio-link">
					<div class="caption">
						<div class="caption-content">
							<h3>Korean</h3>
							<h4>한식</h4>
						</div>
					</div> <img src="../images/portfolio/korea.jpg" class="img-responsive"
					alt="">
				</a>
			</div>
			<div class="col-sm-3 portfolio-item">
				<a href="../store/listStore?s_category=일식" class="portfolio-link">
					<div class="caption">
						<div class="caption-content">
							<h3>Japaness</h3>
							<h4>일식</h4>
						</div>
					</div> <img src="../images/portfolio/japan.jpg" class="img-responsive"
					alt="">
				</a>
			</div>
			<div class="col-sm-3 portfolio-item">
				<a href="../store/listStore?s_category=중식" class="portfolio-link">
					<div class="caption">
						<div class="caption-content">
							<h3>Chiness</h3>
							<h4>중식</h4>
						</div>
					</div> <img src="../images/portfolio/china.jpg" class="img-responsive"
					alt="">
				</a>
			</div>
			<div class="col-sm-4 portfolio-item">
				<a href="../store/listStore?s_category=양식" class="portfolio-link">
					<div class="caption">
						<div class="caption-content">
							<h3>Western</h3>
							<h4>양식</h4>
						</div>
					</div> <img src="../images/portfolio/western.jpg" class="img-responsive"
					alt="">
				</a>
			</div>

			<div class="col-sm-4 portfolio-item">
				<a href="../store/listStore?s_category=아시아식" class="portfolio-link">
					<div class="caption">
						<div class="caption-content">
							<h3>Asian</h3>
							<h4>아시아식</h4>
						</div>
					</div> <img src="../images/portfolio/asia.jpg" class="img-responsive"
					alt="">
				</a>
			</div>
			<div class="col-sm-4 portfolio-item">
				<a href="../store/listStore?s_category=술집" class="portfolio-link">
					<div class="caption">
						<div class="caption-content">
							<h3>Pub & Beer</h3>
							<h4>술집</h4>
						</div>
					</div> <img src="../images/portfolio/alcohol.jpg" class="img-responsive"
					alt="">
				</a>
			</div>


		</div>
	</div>
	</section>
	<!-- portfolio grid section -->
	
	
	<%-- <jsp:include page="../main/ticketmain.jsp" /> --%>
	 <jsp:include page="../main/matchingmain.jsp" />
	
	
	
	
<!-- Testimonials section -->
	<!-- 
	<section id="testimonials" class="section testimonials no-padding">
	<div class="container-fluid">
		<div class="row no-gutter">
			<div class="flexslider">
				<ul class="slides">
					
					<li>
						<div class="col-md-12">
							<blockquote>
								<h1>"처음에 체계가 잘 잡히지 않아서 헤맸던 부분이 가장 아쉽습니다.
								2주라는 시간이 너무 빨리 지나간 느낌이고 주요기능 구현을 시작하지도 못하는 등의 아쉬운 부분이 많은 것 같습니다.
								git을 사용하지 못하여 통합하는 데 시간이 많이 들었습니다. 
								파이널때는 체계적으로 설계를 하여 시작하도록 하겠습니다."</h1>
								<p>GUN</p>
							</blockquote>
						</div>
					</li>
				
					<li>
						<div class="col-md-12">
							<blockquote>
								<h1>"진심 너무 힘들었습니다.
								제대로 된 기능구현이 되지 않아 아쉬움이 많이 남았습니다. 
								git도 제대로 활용되지 못하였고, 여러모로 아쉬움이 많이 남았기에 
								final project때는 조금 더 개선된 결과물을 확인 할 수 있었으면 좋겠습니다."</h1>
								<p>Strong man</p>
							</blockquote>
						</div>
					</li>
					<li>
						<div class="col-md-12">
							<blockquote>
								<h1>"DB 설계가 정말 중요하다는 것을 다시 한 번 깨달았다. 각자의 DB에 다른 데이터를 삽입하니 오류가 나서 힘들었다.
								전에 배웠던 것들을 다 까먹어서 늘 복습해야겠다는 생각이 들었다.
								그리고 각자 한 부분을 합치는데 시간도 많이 걸리고 오류도 많이 나서 힘들었다. final 에서는 Git을 꼭 사용해보고싶다."</h1>
								<p>Hanna Kim</p>
							</blockquote>
						</div>
					</li>
					<li>
						<div class="col-md-12">
							<blockquote>
								<h1>"배웠던 내용을 참고해서 crud 기능을 연습하고 응용할 수 있었지만, 
								기능을 나눠 코딩하다 보니 다른 테이블의 기본키를 참조해야 하는 부분의 개발이 원활하지 않았다.
								설계한 db를 참고해 코딩하는 도중 수정해야 하는 부분이 조금 있었고, 소스 합치기가 쉽지 않았다."</h1>
								<p>MJ</p>
							</blockquote>
						</div>
					</li>
					<li>
						<div class="col-md-12">
							<blockquote>
								<h1>"개인일 때문에 참여를 거의 못하였고 할 줄 아는 게 별로 없었지만 팀원들이 잘 이끌어 주고 많이 알려주었다. 
								Git 담당 이였지만 사용방법이 까다로워 사용하지 않았다. 
								파이널 프로젝트에선 확실하게 Git에 대해 알고 사용하며 알려줄 수 있도록 하겠다."</h1>
								<p>Iron</p>
							</blockquote>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
	</section>
	Testimonials section
 -->
	<jsp:include page="../layout/footer.jsp" />

	<!-- JS FILES -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/jquery.flexslider-min.js"></script>
	<script src="../js/retina.min.js"></script>
	<script src="../js/modernizr.js"></script>
	<script src="../js/main.js"></script>
</body>
</html>