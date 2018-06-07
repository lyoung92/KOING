<%@page import="koing.kosta180.domain.MemberVO"%>
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
<link rel="stylesheet" href="../css/responsive.css">
<link rel="stylesheet" href="../css/animate.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

<!-- 상단 고정 스크립트 -->
<script src="//code.jquery.com/jquery-1.12.4.min.js"></script>

<!-- 현재페이지 가져오기  -->
<script type="text/javascript">
	function init() {
		//    alert(location.pathname + location.search);
		document.getElementById("path").value = location.pathname
				+ location.search;
	}
</script>

</head>
<body onload="init();">
	<!-- Header Section -->
	<section class="tophead" role="tophead"> <!-- Navigation Section -->
	<header id="header">
	<div class="header-content clearfix">
		<a class="logo" href="../main/main">Koing</a>
		<nav class="navigation" role="navigation">
		<ul class="primary-nav">
			<li>
				<!-- <a href="#header-slider">Home</a> --> <select name="location1">
					<option value="">지역선택</option>
					<option value="1">서울</option>
					<option value="2">경기</option>
					<option value="3">인천</option>
			</select>
			</li>
			<li>
				<!-- <a href="#services">Our Services</a> --> <select
				name="location2">
					<option value="">지역선택</option>
					<option value="2">지</option>
					<option value="3">역</option>
					<option value="4">선</option>
					<option value="5">택</option>
					<option value="6">해</option>
					<option value="7">라</option>
			</select>
			</li>
			<li>
				<!-- <a href="#portfolio">Our Portfolio</a> --> <select>
					<option>카테고리</option>
					<option value="korea">한식</option>
					<option value="japan">일식</option>
					<option value="china">중식</option>
					<option value="western">양식</option>
					<option value="asia">아시아식</option>
					<option value="pub">술집</option>
			</select>
			</li>
			<li>
				<!-- <a href="#testimonials">Testimonials</a> --> <input type="text"
				name="search" placeholder="검색어 입력">
			</li>
			<li>
				<!-- <a href="#contact">Contact</a> -->
				<button type="button" class="btn">검색</button>
			</li>


			<!-- 아이디 및 비밀번호 오류 처리 -->
			<c:choose>
				<c:when test="${fail == 0}">
					<script>
						alert('비밀번호를 확인해주세요');
						history.back();
					</script>
				</c:when>
				<c:when test="${fail == -1}">
					<script>
						alert('아이디를 확인해주세요');
						history.back();
					</script>
				</c:when>
			</c:choose>

			<c:choose>
				<c:when test="${sessionMember != null }">
					<li>
						<button id="btnGroupDrop1" type="button"
							class="btn btn-secondary dropdown-toggle" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false">
							${sessionMember.m_name }님</button>
						<div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
							<a class="dropdown-item" href="../join/updateMember">회원정보</a> <a
								class="dropdown-item" href="#">예약관리</a> <a class="dropdown-item"
								href="#">쿠폰관리</a>
						</div>
					</li>


					<li>
						<form role="form" method="post" action="../join/logoutAction">
							<input type="hidden" name="path" id="path" />
							<button type="submit" class="btn" onclick="">로그아웃</button>
						</form>
					</li>
				</c:when>
				<c:otherwise>
					<li>
						<!-- modal 구동 버튼 (trigger) -->
						<button type="button" class="btn btn-primary" data-toggle="modal"
							data-target="#myModal">로그인</button>
					</li>
					<li>
						<button type="button" class="btn btn-primary"
							onclick="location.href='/join/join'">회원가입</button>
					</li>
				</c:otherwise>
			</c:choose>

		</ul>
		</nav>
		<!-- <a href="#" class="nav-toggle">Menu<span></span></a>  -->
	</div>
	</header> <!-- Navigation Section --> </section>
	<!-- Header Section -->


	<!-- Slider Section -->
	<section id="header-slider" class="section"> <!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px;">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4>
						<span class="glyphicon glyphicon-lock"></span> Login
					</h4>
				</div>
				<div class="modal-body" style="padding: 40px 50px;">
					<form role="form" method="post" action="../join/loginAction">
						<input type="hidden" name="path" id="path" />
						<div class="form-group">
							<label for="usrname"><span
								class="glyphicon glyphicon-user"></span> Username</label> <input
								type="text" class="form-control" name="id" id="id"
								placeholder="Enter id">
						</div>
						<div class="form-group">
							<label for="psw"><span
								class="glyphicon glyphicon-eye-open"></span> Password</label> <input
								type="password" class="form-control" name="pw" id="pw"
								placeholder="Enter password">
						</div>
						<div class="checkbox">
							<label><input type="checkbox" value="" checked>Remember
								me</label>
						</div>
						<button type="submit" class="btn btn-success btn-block">
							<span class="glyphicon glyphicon-off"></span> Login
						</button>
					</form>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-danger btn-default pull-left"
						data-dismiss="modal">
						<span class="glyphicon glyphicon-remove"></span> Cancel
					</button>
					<p>
						Not a member? <a href="http://localhost:8081/koing/join/join.jsp">Sign
							Up</a>
					</p>
					<p>
						Forgot <a href="#">Password?</a>
					</p>
				</div>
			</div>

		</div>
	</div>