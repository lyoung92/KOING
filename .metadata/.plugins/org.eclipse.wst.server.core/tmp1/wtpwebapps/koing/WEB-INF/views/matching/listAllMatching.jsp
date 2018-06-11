<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>매칭리스트</title>
<link rel="stylesheet" href="../vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="../vendor/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="../css/flexslider.css">
<link rel="stylesheet" href="../css/mypage.css">

<script src="../js/matching.js" type="text/javascript"></script>
<style type="text/css">
a.noList{
	text-align: center;
}
h2.title{
	text-align: center;
}
.container table th, tr, td{
text-align: center;
font-weight: 1000;
color : white;
}

tr#hover:hover{
	background: #920021;
}
</style>
</head>
<body>
	<jsp:include page="../layout/header.jsp" />
	<jsp:include page="../main/ticketmain.jsp" />
	<!-- End Banner Section -->

	<div class="container" style="width: 80%; background: #b91b39">
		<h2 class="title" style="color: #ffffff; font-size: 20px; font-weight: 1000; text-shadow: #999999 1px 1px 1px">전체 매칭글 리스트</h2>
		<c:choose>
			<c:when test="${empty allMatchingList}">
				<a class="noList">게시글이 없습니다.</a>
            </c:when>
			<c:otherwise>
				<table class="storelist table table-hover">
					<thead>
						<tr>
							<th>글번호</th>
							<th>장소</th>
							<th>제목</th>
							<th>글쓴이</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="matchingList" items="${allMatchingList}">
							<tr id="hover">
								<td>${matchingList.mc_bno}</td>
								<td>${matchingList.s_name}</td>
								<td><a href="readMatching?mc_bno=${matchingList.mc_bno}" style="color: white;">${matchingList.mc_title}</a></td>
								<td>${matchingList.id}</td>
							</tr>
						</c:forEach>
				</table>
				</tbody>
			</c:otherwise>
		</c:choose>
	</div>
	<div class = "buttonDiv" style="margin-left: 80%">
		<button class="btn" type="button" onclick='location.href = "insertMatching"'>글쓰기</button>
		<button class="btn" type="button" onclick='location.href = "listCategoryMatching"'>카테고리</button>
	</div>
	<jsp:include page="../layout/footer.jsp" />
</body>
</html>