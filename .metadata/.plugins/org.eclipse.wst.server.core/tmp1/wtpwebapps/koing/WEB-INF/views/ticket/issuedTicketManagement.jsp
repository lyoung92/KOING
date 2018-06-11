<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>발급쿠폰관리</title>
<style type="text/css">
table.ticketList {
	width: 80%;
	margin-top: 80px;
	margin-left: 10%;
	margin-right: 10%;
	border: 1px solid;
	background: #b91b39;
	color: #ffffff;
}

table.ticketList tr.complete {
	background: gray;
	text-decoration: line-through;
}

table.ticketList th {
	border: 1px solid;
	border-bottom: 3px solid;
	text-align: center;
	width: 10%;
}

table.ticketList td {
	border: 1px solid;
	text-align: center;
}

table button.btnchange {
	background: #b91b39;
	width: 100%;
	outline: 0;
	border: 0;
}

h4.noTicket  {
	text-align: center;
	color: red !important;
	margin: 100px;
}
</style>




</head>
<body>
	<script src="../js/ticket.js" type="text/javascript"></script>
	<jsp:include page="../layout/header.jsp" />
	<div class="tab_container">
		<c:choose>
			<c:when test="${empty ticketList}">
				<h4 class="noTicket ">발급된 쿠폰이 존재하지 않습니다.</h4>
            </c:when>
			<c:otherwise>
				<table class="ticketList">
					<tr>
						<th>티켓 종류</th>
						<th>티켓 고유번호</th>
						<th>구매자</th>
						<th>유효 기간</th>
						<th>상태</th>
						<th>상태변경</th>
					</tr>
					<c:forEach var="list" items="${ticketList}">
						<c:choose>
							<c:when test="${list.com_contents eq '미사용' }">
								<tr>
									<td>${list.t_bno}</td>
									<td>${list.i_no}</td>
									<td>${list.id}</td>
									<td>${list.i_valid}</td>
									<td>${list.com_contents }</td>
									<td>
										<button class="btnchange path"
											onclick="completeTicketInsert('${list.i_no}')">변경</button>
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr class = "complete">
									<td>${list.t_bno}</td>
									<td>${list.i_no}</td>
									<td>${list.id}</td>
									<td>${list.i_valid}</td>
									<td>${list.com_contents }</td>
									<td>${list.com_date }</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</table>
			</c:otherwise>
		</c:choose>
	</div>
	<jsp:include page="../layout/footer.jsp" />
</body>
</html>