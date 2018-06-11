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
<script type="text/javascript">

function fn_payment() {
    /*  location.href = "payment.jsp"; */
    
 var IMP = window.IMP; // 생략가능
 
 IMP.init('iamport'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
 
 IMP.request_pay({
      pg : 'inicis', // version 1.1.0부터 지원.
      pay_method : 'card',
      merchant_uid : 'merchant_' + new Date().getTime(),
      name : ${matching.mc_bno},
      amount : ${matching.mc_entryfee},
      buyer_email : 'iamport@siot.do',
      buyer_name : '구매자이름',
      buyer_tel : '010-1234-5678',
      buyer_addr : '서울특별시 금천구',
      buyer_postcode : '123-456',
      m_redirect_url : 'https://www.yourdomain.com/payments/complete'
  }, function(rsp) {
      if ( rsp.success ) {
          var msg = '결제가 완료되었습니다.';
          msg += '고유ID : ' + rsp.imp_uid;
          msg += '상점 거래ID : ' + rsp.merchant_uid;
          msg += '결제 금액 : ' + rsp.paid_amount;
          msg += '카드 승인번호 : ' + rsp.apply_num;
      } else {
          var msg = '결제에 실패하였습니다.';
          msg += '에러내용 : ' + rsp.error_msg;
      }
      alert(msg);
  });
  }

</script>
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

	<div class="container">
		<h2>${matching.mc_title}</h2>
		<table class="table table-view">
			<colgroup>
				<col width="7%">
				<!-- 글 번호 -->
				<col width="*">
				<!--  제목   -->
				<col width="10%">
				<!-- 작성자 -->
				<col width="10%">
				<!-- 작성일 -->
				<col width="7%">
				<!-- 조회수 -->
			</colgroup>
			<thead>
				<tr>
					<th class="subject">${matching.mc_title}</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="infocell"><b>작성자 </b>${matching.id}</td>
				</tr>
				<tr>
					<td class="contents">장소 : ${matching.s_name}<br> 초대글 :
						${matching.mc_contents}<br> 참가비 : ${matching.mc_entryfee}<br>
						날짜 : ${matching.mc_date}<br> 시간 : ${matching.mc_time}<br>
						참여현황 : ${matching.mc_applicantnum} / ${matching.mc_totalnum} 명
						<p class="card-text">
							<c:if test="${matching.mc_totalnum == matching.mc_applicantnum}">
								<div class="row">
									<h4>매칭완료</h4>
								</div>
							</c:if>
							<c:if test="${matching.mc_totalnum != matching.mc_applicantnum}">
								<div class="row">
									<h4>${matching.mc_status}</h4>
								</div>
							</c:if>
						</p>
						<button class="btn btn-primary btn-lg btn-block"
							onclick="fn_payment()">결제</button> <c:if
							test="${matching.mc_totalnum == matching.mc_applicantnum}">
							<button class="btn btn-primary btn-lg btn-block"
								onclick="cancelMatching('${matching.mc_bno}')">취소하기</button>
						</c:if> <c:if test="${matching.mc_totalnum != matching.mc_applicantnum}">
							<button class="btn btn-primary btn-lg btn-block"
								onclick="applyMatching('${matching.mc_bno}')">참여하기</button>
						</c:if>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<jsp:include page="../layout/footer.jsp" />
</body>
</html>


