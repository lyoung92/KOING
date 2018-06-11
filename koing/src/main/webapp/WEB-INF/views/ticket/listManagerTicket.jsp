<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">

div.buttons{
	padding-top: 10px;
}

</style>
</head>
<body>
<script src="../js/ticket.js" type="text/javascript"></script>
	<div class="tab_container">
		<c:choose>
			<c:when test="${empty managerTicketList }">
            ������ Ƽ���� �������� �ʽ��ϴ�.
            </c:when>
			<c:otherwise>
				<c:forEach var="list" items="${managerTicketList}">
					<div class="card">
							<a> 
								<img alt="" src="/images/store/${list.s_no }/${list.s_no}-2.jpg">
							</a>

						<div class="buttons">
							<center>
								<button type="button" class="btn"
									onclick="ticketdetail('${list.t_bno}')">����</button>
								<button type="button" class="btn"
									onclick="ticketdelete('${list.t_bno}')">����</button>
								<button type="button" class="btn"
									onclick=	"ticketManagement('${list.t_bno}')" >Ƽ�ϰ���</button>
							</center>

						</div>

						<div class="card-body">
								<h5 class="card-title">
									<a class="ticketinfo">${list.s_no}</a>
								</h5>
								<p class="card-location">
									<a class="ticketinfo">${list.t_contents}</a>
								</p>

								<p class="card-tel">
									<a class="ticketinfo overline">���� : ${list.t_cost}��</a>
									<a class="ticketinfo"> ---> ${list.t_fixedprice}��</a>
								</p>
								
								
								<p class="card-tel">
									<a class="ticketinfo">���� : ${list.t_contents}</a>
								</p>

							

						</div>
						</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>