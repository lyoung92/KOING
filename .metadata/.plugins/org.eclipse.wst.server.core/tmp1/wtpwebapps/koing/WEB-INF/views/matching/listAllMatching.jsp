<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="../vendor/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="../css/flexslider.css">
<link rel="stylesheet" href="../css/mypage.css">

<script src="../js/matching.js" type="text/javascript"></script>

</head>
<body>
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

	<div class="container" style="width: 750px;">
		<c:choose>
			<c:when test="${allMatchingList == null}">
				<h2>전체 매칭글 리스트</h2>
				게시글이 없습니다.
            </c:when>
			<c:otherwise>
				<h2>전체 매칭글 리스트</h2>
				<table class="storelist table table-hover">
					<thead>
						<tr>
							<th></th>
							<th>장소</th>
							<th>제목</th>
							<th>글쓴이</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="matchingList" items="${allMatchingList}">
							<tr>
								<td>${matchingList.mc_bno}</td>
								<td>${matchingList.s_name}</td>
								<td><a href="readMatching?mc_bno=${matchingList.mc_bno}">${matchingList.mc_title}</a></td>
								<td>${matchingList.id}</td>
							</tr>
						</c:forEach>
				</table>
				</tbody>
			</c:otherwise>
		</c:choose>
	</div>
	<jsp:include page="../layout/footer.jsp" />
</body>
</html>