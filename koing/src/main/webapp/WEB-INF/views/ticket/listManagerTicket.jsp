<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script src="resources/js/ticket.js" type="text/javascript"></script>
	<div class="body">
		<c:choose>
			<c:when test="${managerTicketList == null }">
            관리자 티켓이 존재하지 않습니다.
            </c:when>
			<c:otherwise>
				<c:forEach var="ticketList" items="${managerTicketList}">
					<div class="element  small_coupon first">
						<a href="detailTicket?t_bno=${ticketList.t_bno}" class="image"
							style="display: block; background-image: url(&quot;http://c2.poing.co.kr/MRI-original/MjAxNzA5/150657782259cc8d9ed5a94.jpeg&quot;);">
							<div class="shading"></div>

							<div class="bottom">
								<span class="name">${ticketList.s_no}</span>
							</div>
						</a>

						<div class="desc">
							<div class="coupon">
								<div class="option">
									<span>${ticketList.s_no}</span><br>${ticketList.t_contents}
								</div>
								<div class="price">
									<div class="ratio long ">${ticketList.t_discount }%OFF</div>
									<div class="discount">${ticketList.t_fixedprice}원</div>
									<div class="origin">${ticketList.t_cost}원</div>
								</div>
							</div>
						</div>

						<div class="body review write">
							<button type="button" class="border_radius soft"
								onclick="ticketdetail('${ticketList.t_bno}')">수정</button>
							<button type="button" class="border_radius soft"
								onclick="ticketdelete('${ticketList.t_bno}')">삭제</button>
						</div>

					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>