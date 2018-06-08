<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- jQuery 2.1.4 -->
<script src="https://code.jquery.com/jquery-2.1.4.js"></script>
<link rel="stylesheet" href="../vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="../vendor/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="../css/flexslider.css">
<link rel="stylesheet" href="../css/mypage.css">

<script src="../js/matching.js" type="text/javascript"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
.fileDrop {
	width: 80%;
	height: 100px;
	border: 1px dotted gray;
	background-color: lightslategray;
	margin: auto;
}
</style>
</head>

<body class="br-light">
	<jsp:include page="../layout/header.jsp" />
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
	<!-- End Banner Section -->
	<div class="container-diy">

		<h3>매칭글 등록</h3>
		<form action="insertMatching" method="post">
			<table class="table table-bordered">
				<tr>
					<th>제목</th>
					<td><input type="text" id="mc_title" name="mc_title"
						placeholder="제목을 입력하세요."></td>
				</tr>

				<tr>
					<th>매칭 소개글</th>
					<td><textarea rows="3" cols="40" id="mc_contents"
							name="mc_contents"></textarea></td>
				</tr>

				<tr>
					<th>장소</th>
					<td><input type="text" id="s_name" name="s_name"
						placeholder="매장 이름을 입력하세요."></td>
				</tr>

				<tr>
					<th>참가비</th>
					<td><input type="text" id="mc_entryfee" name="mc_entryfee">
					</td>
				</tr>

				<tr>
					<th>모임 날짜</th>
					<td><input type="text" id="mc_date" name="mc_date"
						placeholder="2018-07-25"></td>
				</tr>

				<tr>
					<th>모임 시간</th>
					<td><input type="text" id="mc_time" name="mc_time"
						placeholder="오전 11:00"></td>
				</tr>

				<tr>
					<th>인원수</th>
					<td><input type="text" id="mc_totalnum" name="mc_totalnum"
						placeholder="10"> 명</td>
				</tr>

				<tr>
					<td colspan="2">
						<button type="button" class="btn btn-primary btn-sm pull-right">취소</button>
						<button type="submit" class="btn btn-primary btn-sm pull-right"
							style="margin-right: 10px;">등록</button>
					</td>
				</tr>
			</table>
		</form>
	</div>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

	<jsp:include page="../layout/footer.jsp" />
</body>
</html>