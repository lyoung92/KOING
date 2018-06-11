<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script src="resources/js/ticket.js" type="text/javascript"></script>
	<form action="updateTicket" method="post">
		<input type="hidden" name="t_sno" value="${ticket.t_bno}">
		<input type="hidden" name="s_no" value="${ticket.s_no}">
		<h3>티켓 수정</h3>
		<ul class="list">
			<li class="item text">
				<div class="name">티켓 정보</div>
				<div class="detail">
					<textarea id="ticket_text" name="t_contents"
						class="border_radius soft" value="티켓 정보를 입력하세요."></textarea>
				</div>
			</li>
			<li class="item text">
				<div class="name">정상가격</div>
				<div class="detail">
					<input type="text" id="ticket_price" name="t_cost"
						class="border_radius soft"> 원
				</div>
			</li>
			<li class="item text">
				<div class="name">할인율</div>
				<div class="detail">
					<input type="text" id="ticket_discount" name="t_discount"
						class="border_radius soft"> %
				</div>
			</li>
			<li class="item text">
				<div class="name">유효기간</div>
				<div class="detail">
					<input type="text" id="ticket_effectivelife" name="t_effectivelife"
						class="border_radius soft"> 일
				</div>
			</li>
		</ul>
		<div class="body review write">
			<button class="border_radius soft" type="submit">티켓 수정하기</button>
		</div>
	</form>
</body>
</html>