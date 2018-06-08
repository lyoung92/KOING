<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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

	<div class="row">
		<h1>${matching.mc_title}</h1>
	</div>

	<div class="row">
		<h3>작성자: ${matching.id}</h3>
	</div>

	<div class="row">
		<h3>장소 : ${matching.s_name}</h3>
	</div>

	<div class="row">
		<h3>소개글</h3>
		<h3>${matching.mc_contents}</h3>
	</div>

	<div class="row">
		<h3>참가비 : ${matching.mc_entryfee}</h3>
	</div>

	<div class="row">
		<h3>날짜 : ${matching.mc_date}</h3>
		<h3>시간 : ${matching.mc_time}</h3>
	</div>

	<div class="row">
		<h3>참여인원 : ${matching.mc_applicantnum}/${matching.mc_totalnum}</h3>
	</div>
	<c:if test="${matching.mc_totalnum == matching.mc_applicantnum}">
		<div class="row">
			<h3>매칭완료</h3>
		</div>
	</c:if>
	<c:if test="${matching.mc_totalnum != matching.mc_applicantnum}">
		<div class="row">
			<h3>${matching.mc_status}</h3>
		</div>
	</c:if>
	<button class="btn btn-primary btn-lg btn-block" onclick="fn_payment()">결제</button>

	<c:if test="${matching.mc_totalnum == matching.mc_applicantnum}">
		<button class="btn btn-primary btn-lg btn-block"
			onclick="cancelMatching('${matching.mc_bno}')">취소하기</button>
	</c:if>
	<c:if test="${matching.mc_totalnum != matching.mc_applicantnum}">
		<button class="btn btn-primary btn-lg btn-block"
			onclick="applyMatching('${matching.mc_bno}')">참여하기</button>
	</c:if>

</body>
</html>


