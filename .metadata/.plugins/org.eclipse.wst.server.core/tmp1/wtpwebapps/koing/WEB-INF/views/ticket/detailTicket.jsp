<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">


function fn_payment() {
    /*  location.href = "payment.jsp"; */
    
 var IMP = window.IMP; // 생략가능
 
 IMP.init('iamport'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
 
 IMP.request_pay({
      pg : 'inicis', // version 1.1.0부터 지원.
      pay_method : 'card',
      merchant_uid : 'merchant_' + new Date().getTime(),
      name : '${ticket.t_sno}',
      amount : ${ticket.t_fixedprice},
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
   <div id="banner" class="product">
      <div class="i_wrap background">
         <i class="image"
            style="width: 100%; height: 100%; background-image: url('http://c2.poing.co.kr/MRI-original/MjAxODAz/15217123715ab37cf3d5f10.jpeg')"></i>
      </div>
      <div class="i_wrap blur background">
         <i class="image"
            style="width: 100%; height: 100%; background-image: url('http://c2.poing.co.kr/MRI-original/MjAxODAz/15217123715ab37cf3d5f10.jpeg')"></i>
      </div>
      <div class="inner_wrap">
         <div class="inner">
            <div class="header">
               <span class="name"> ${store.s_name} / ${ticket.s_no}</span> <span class="info">
                  ${ticket.t_contents} ${ticket.t_sno}</span>
            </div>
            <div class="body">
               <!-- 상점 사진 슬라이드 -->
               <div class="slider_wrap PoingSlider_wrap">
                  <div id="slider" class="PoingSlider">
                     <div class="i_wrap slice" style="top: 0px; left: -100%;">
                        <i class="image" data-index="0"
                           style="background-image: url(http://c2.poing.co.kr/MRI-original/MjAxODAz/15217123715ab37cf3d5f10.jpeg)"></i>
                     </div>
                     <div class="i_wrap slice" style="top: 0px; left: -100%;">
                        <i class="image" data-index="1"
                           style="background-image: url(http://c2.poing.co.kr/MRI-original/MjAxODAz/15217123725ab37cf448856.jpeg)"></i>
                     </div>
                  </div>
               </div>
               <div class="price">
                  <div class="i_wrap ">
                     <span class="main">${ticket.t_discount} %</span><br> <span
                        class="sub"> OFF</span>
                  </div>
                  <span class="reduced">${ticket.t_fixedprice} 원</span><br> <span
                     class="original">${ticket.t_cost} 원</span>
               </div>
            </div>
         </div>
      </div>
   </div>

   <div id="content_wrap">

      <div id="sidebar_wrap" class="detail">
         <button class="sidebar buy border_radius soft" data-id="2552"
            data-cart="true" tabindex="-1" onclick="fn_payment();">바로 구매하기</button>
      </div>
   </div>
</body>
</html>