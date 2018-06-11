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
<jsp:include page="../layout/header.jsp" />
	<div class="body">
		<c:choose>
			<c:when test="${empty allTicketList}">
				티켓이 존재하지 않습니다.
            </c:when>
			<c:otherwise>
				<c:forEach var="ticketList" items="${allTicketList}">
					<div class="element  small_coupon first">
						<a href="detailTicket?t_bno=${ticketList.t_bno}"
							class="image"
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
								<div class="price ">
									<div class="ratio long ">${ticketList.t_discount } %OFF</div>
									<div class="discount">${ticketList.t_fixedprice} 원</div>
									<div class="origin">${ticketList.t_cost} 원</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
	<jsp:include page="../layout/footer.jsp" />
</body>
</html>