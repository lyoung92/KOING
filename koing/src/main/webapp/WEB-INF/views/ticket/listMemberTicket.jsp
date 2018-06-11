<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>쿠폰관리</title>
<style type="text/css">
body {
	font-family: "Malgun Gothic";
	font-size: 0.8em;
}

.tab_container {
	border: 1px solid #999;
	border-top: none;
	overflow: hidden;
	clear: both;
	float: left;
	width: 100%;
	background: #fff;
	margin-bottom: 20px;
}


div#dontUse{
	background: gray;
}

div.card {
	border: medium;
	position: relative;
	/* box-sizing: border-box; */
	width: 300px;
	height: 500px;
	float: left;
	margin: 30px;
}


div.card-body {
	margin: 0px;
	width: 200px;
	height:220px;
	display: block;
	margin-left: auto;
	margin-right: auto;
}


a.ticketinfo {
	color: black;
	height: 100px;
}
a.overline{
 text-decoration:line-through;
}
a.storeinfo:HOVER {
	color: black;
}

div.card img {
	width: 200px;
	height: 200px;
	vertical-align: middle;
	display: block;
	margin-left: auto;
	margin-right: auto;
}

h5.card-title {
	color: #333333;
	font-size: 1.2em;
	font-weight: 700;
	text-align: center;
	height: 45px;
	padding-top: 10px;
}

p.card-contents {
	/* text-align: center; */
}

p.card-location {
	text-align: center;
}

p.card-tel {
	text-align: center;
}
p.card-use{
	text-align: center;
	background: white;
}

p.card-use a{
	color: #b91b39;
    font-weight: 1000;
}



</style>
</head>
<body>
<script src="../js/ticket.js" type="text/javascript"></script>
<jsp:include page="../layout/header.jsp" />
	<div class="tab_container">
		<c:choose>
			<c:when test="${empty memberTicketList}">
				회원 티켓이 존재하지 않습니다.
            </c:when>
            
			<c:otherwise>
				<c:forEach var="list" items="${memberTicketList}">
					<c:choose>
						<c:when test="${list.com_contents eq '사용가능'}">
							<div class="card">
								<a> <img alt=""
									src="/images/store/${list.s_no }/${list.s_no}-2.jpg">
								</a>
								<div class="card-body">
									<h5 class="card-title">
										<a class="ticketinfo">${list.i_no}</a>
									</h5>
									<p class="card-location">
										<a class="ticketinfo">유효기간 : ${list.i_valid}</a>
									</p>

									<p class="card-tel">
										<a class="ticketinfo overline">가격 : ${list.t_cost}원</a> <a
											class="ticketinfo"> ---> ${list.t_fixedprice}원</a>
									</p>


									<p class="card-tel">
										<a class="ticketinfo">내용 : ${list.t_contents}</a>
									</p>
								</div>
									<p class="card-use">
										<a class="ticketinfo">${list.com_contents }</a>
									</p>
							</div>
						</c:when>
						<c:otherwise>
							<div class="card">
								<a> <img alt=""
									src="/images/store/${list.s_no }/${list.s_no}-2.jpg">
								</a>
								<div class="card-body" id="dontUse">
									<h5 class="card-title">
										<a class="ticketinfo">${list.i_no}</a>
									</h5>
									<p class="card-location">
										<a class="ticketinfo">유효기간 : ${list.i_valid}</a>
									</p>

									<p class="card-tel">
										<a class="ticketinfo overline">가격 : ${list.t_cost}원</a> <a
											class="ticketinfo"> ---> ${list.t_fixedprice}원</a>
									</p>


									<p class="card-tel">
										<a class="ticketinfo">내용 : ${list.t_contents}</a>
									</p>
								</div>
									<p class="card-use">
										<a class="ticketinfo">${list.com_contents }</a>
									</p>
							</div>
						</c:otherwise>

					</c:choose>


				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
	<c:if test="${sessionMember.m_grade == '기업회원' }">
		<jsp:include page="../ticket/listManagerTicket.jsp" />
	</c:if>
	<jsp:include page="../layout/footer.jsp" />
</body>
</html>