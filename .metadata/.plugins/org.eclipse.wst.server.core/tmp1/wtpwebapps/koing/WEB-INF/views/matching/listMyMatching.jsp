<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="../vendor/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="../css/flexslider.css">
<link rel="stylesheet" href="../css/mypage.css">

<script src="../js/matching.js" type="text/javascript"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- <script type="text/javascript">
	$(document).ready(function() {

		var mc_totalnum = '${matchingList.mc_totalnum}';
		var mc_applicantnum = '${matchingList.mc_applicantnum}';
		alert("OOOOOOOOOOOOOO");
		if (mc_totalnum == mc_applicantnum) {
			sendMail();
		}
	});

	function sendMail() {
		var mc_bno = '${matchingList.mc_bno}';
		location.href = "sendMail?mc_bno=" + mc_bno;
	}
</script> -->
</head>
<body>
	<jsp:include page="../layout/header.jsp" />
	<jsp:include page="../main/ticketmain.jsp" />

	<div class="container" style="width: 750px;">
		<h2>나의 매칭글</h2>
		<c:choose>
			<c:when test="${empty myMatchingList}">
				게시글이 없습니다.
            </c:when>
			<c:otherwise>
				<table class="storelist table table-hover">
					<thead>
						<tr>
							<th></th>
							<th>장소</th>
							<th>제목</th>
							<th>글쓴이</th>
							<th></th>
							<th></th>
							<th></th>
						</tr>
					</thead>

					<tbody>
						<c:forEach var="matchingList" items="${myMatchingList}">
							<input type="hidden" value="${matchingList.id }" id="matchingid" />
							<tr>
								<td>${matchingList.mc_bno}</td>
								<td>${matchingList.s_name}</td>
								<td><a href="readMatching?mc_bno=${matchingList.mc_bno}">${matchingList.mc_title}</a></td>
								<td>${matchingList.id}</td>
								<td><button type="button"
										class="btn btn-primary btn-lg btn-block"
										onclick="updateMatching('${matchingList.mc_bno}')">수정</button></td>
								<td><button type="button"
										class="btn btn-primary btn-lg btn-block"
										onclick="deleteMatching('${matchingList.mc_bno}')">삭제</button></td>
								<c:if
									test="${matchingList.mc_totalnum == matchingList.mc_applicantnum}">
									<c:if test="${matchingList.id !='hanna'}">
										<c:if test="${matchingRes.mr_status !='예약대기중'}">
											<td><button type="button"
													class="btn btn-primary btn-lg btn-block"
													onclick="reserveMatching('${matchingList.mc_bno}')">예약하기</button></td>
										</c:if>
										<c:if test="${matchingRes.mr_status=='예약대기중'}">
											<td><button type="button"
													class="btn btn-primary btn-lg btn-block"
													onclick="cancelResMatching('${matchingList.mc_bno}')">예약취소</button></td>
										</c:if>
									</c:if>
								</c:if>
								<c:if test="${matchingList.id=='hanna'}">
									<c:if test="${matchingRes.mr_status=='예약대기중'}">
										<td><button type="button"
												class="btn btn-primary btn-lg btn-block"
												onclick="acceptRes('${matchingList.mc_bno}')">예약승인</button></td>
										<td><button type="button"
												class="btn btn-primary btn-lg btn-block"
												onclick="rejectRes('${matchingList.mc_bno}')">예약거절</button></td>
									</c:if>
								</c:if>
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