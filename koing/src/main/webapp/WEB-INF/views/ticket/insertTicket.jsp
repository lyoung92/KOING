<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script>
	
	var s_no = document.getElementById("s_no");
	var val = s_no.options[s_no.selectedIndex].value;

	function checkValue() {
		var form = document.insert_Ticket;

		if (!form.t_contents.value) {
			alert("티켓정보를 입력하세요.");
			return false;
		}
		if (!form.t_cost.value) {
			alert("정상가격 입력하세요.");
			return false;
		}
		if (!form.t_discount.value) {
			alert("할인율을 입력하세요.");
			return false;
		}
		if (!form.t_effectivelife.value) {
			alert("유효기간을 입력하세요.");
			return false;
		}
		if (!form.s_no.value) {
			alert("상점을 선택하세요.");
			return false;
		}

	}
</script>

</head>
<body>
	<jsp:include page="../layout/header.jsp" />
	<form name = "insert_Ticket" id = "insert_Ticket"action="insertTicket" method="post" 	onsubmit="return checkValue()">
		<h3>티켓 등록</h3>
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

			<li class="item text">
				<select name="s_no" id="s_no">
					<option value="">매장선택</option>
					<c:forEach var="item" items="${storeList }" varStatus="i"  >
						<option value="${item.s_no }">${item.s_name}</option>
					</c:forEach>
				</select>
			</li>
		</ul>
		<div class="body review write">
			<button class="border_radius soft" type="submit">티켓 등록하기</button>
		</div>
	</form>
	<jsp:include page="../layout/footer.jsp" />
</body>
</html>