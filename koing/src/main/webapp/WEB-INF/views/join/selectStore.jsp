<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>koing 선호 상점 선택</title>
<style type="text/css">
body {
	font-family: "Malgun Gothic";
	font-size: 0.8em;
}
/*TAB CSS*/
ul.tabs {
	margin: 0;
	padding: 0;
	float: left;
	list-style: none;
	height: 32px; /*--Set height of tabs--*/
	border-bottom: 1px solid #999;
	border-left: 1px solid #999;
	width: 100%;
}

ul.tabs li {
	float: left;
	margin: 0;
	padding: 0;
	height: 31px;
	/*--Subtract 1px from the height of the unordered list--*/
	line-height: 31px; /*--Vertically aligns the text within the tab--*/
	border: 1px solid #999;
	border-left: none;
	margin-bottom: -1px; /*--Pull the list item down 1px--*/
	overflow: hidden;
	position: relative;
	background: #e0e0e0;
}

ul.tabs li a {
	text-decoration: none;
	color: #000;
	display: block;
	font-size: 1.2em;
	padding: 0 20px;
	/*--Gives the bevel look with a 1px white border inside the list item--*/
	border: 1px solid #fff;
	outline: none;
}

ul.tabs li a:hover {
	background: #ccc;
}

html ul.tabs li.active, html ul.tabs li.active a:hover {
	/*--Makes sure that the active tab does not listen to the hover properties--*/
	background: #fff;
	/*--Makes the active tab look like it's connected with its content--*/
	border-bottom: 1px solid #fff;
}

/*Tab Conent CSS*/
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

.tab_content {
	padding: 20px;
	font-size: 1.2em;
}

.tab_content>h1 {
	text-align: center;
	font-size: 2em;
	color: #2c363e;
	text-shadow: 0 1px 2px rgba(0, 0, 0, 0.37);
	font-weight: 300;
}

div .title {
	text-align: center;
	font-size: 2.5em;
	color: #2c363e;
	text-shadow: 0 1px 2px rgba(0, 0, 0, 0.37);
	font-weight: 600;
}

div.card {
	border: medium;
	position: relative;
	/* box-sizing: border-box; */
	width: 300px;
	height: 350px;
	float: left;
	margin: 30px;
}

div.card-body {
	margin: 0px;
	width: 200px;
	display: block;
	margin-left: auto;
	margin-right: auto;
}

a.storeinfo {
	color: black;
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

input.joinbtn {
	position: inherit;
	padding: 12px 94px;
	background: #c91b3c;
	color: #fff;
	border: 0;
	border-radius: 5px;
	font-size: 18px;
	display: block;
	margin-left: auto;
	margin-right: auto;
	margin-top: 20px;
	margin-bottom: 200px;
}

p.card-tel > button{
    margin-top: 10px;
}
</style>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		//When page loads...
		$(".tab_content").hide(); //Hide all content
		$("ul.tabs li:first").addClass("active").show(); //Activate first tab
		$(".tab_content:first").show(); //Show first tab content

		//On Click Event
		$("ul.tabs li").click(function() {

			$("ul.tabs li").removeClass("active"); //Remove any "active" class
			$(this).addClass("active"); //Add "active" class to selected tab
			$(".tab_content").hide(); //Hide all tab content

			var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
			$(activeTab).fadeIn(); //Fade in the active ID content
			return false;
		});

	});
</script>


</head>
<body>
	<jsp:include page="../layout/header.jsp" />
	<form action="../join/selectStore" method="post">
		<!-- 회원가입 1페이지 작성 내용  -->
		<input type="hidden" name="id" value="${member.id}"> <input
			type="hidden" name="pw" value="${member.pw}"> <input
			type="hidden" name="m_name" value="${member.m_name}"> <input
			type="hidden" name="m_gender" value="${member.m_gender}"> <input
			type="hidden" name="m_ssno" value="${member.m_ssno}"> <input
			type="hidden" name="m_pno" value="${member.m_pno}"> <input
			type="hidden" name="m_address" value="${member.m_address}"> <input
			type="hidden" name="m_agree" value="${member.m_agree}">

		<div id="wrapper">
			<!--탭 메뉴 영역 -->
			<div class="title">지역별 선호 상점</div>
			<ul class="tabs">
				<li><a href="#tab1">서울</a></li>
				<li><a href="#tab2">인천</a></li>
				<li><a href="#tab3">경기</a></li>
			</ul>

			<!--탭 콘텐츠 영역 -->
			<div class="tab_container">
				<!-- 서울지역 -->
				<div id="tab1" class="tab_content">
					<!--Content-->
					<h1>서울지역</h1>
					<c:forEach var="list" items="${locationStoreVO.seoulList}" varStatus="i">
					
						<input type="hidden" id="s_name_${list.s_location_no}_${i.index}" value="${list.s_name}">
						<input type="hidden" id="s_contents_${list.s_location_no}_${i.index}" value="${list.s_contents}">
						<div class="card">
							<a> 
								<img alt="" src="/images/store/${list.s_no }/${list.s_no}-1.jpg">
							</a>
							<div class="card-body">
								<h5 class="card-title">
									<input type="checkbox" name="m_storeId" id="seoul_${i.index}" 
										value="${list.s_no }"><label for="seoul_${i.index}"> <a class="storeinfo">${list.s_name}</a></label>
								</h5>
								<p class="card-location">
									<a class="storeinfo">주소 : ${list.s_address}</a>
								</p>

								<p class="card-tel">
									<a class="storeinfo">전화번호 : ${list.s_tel}</a>
								<button type="button" class="btn btn-info btn-lg" onclick="show('${list.s_location_no}','${i.index }')">자세히보기</button>
								</p>
							</div>
						</div>
					</c:forEach>

				</div>
				<!--서울지역 끝  -->

				<!-- 인천지역 -->
				<div id="tab2" class="tab_content">
					<!--Content-->
					<h1>인천지역</h1>
					<c:forEach var="list" items="${locationStoreVO.incheonList}" varStatus="i">
					
						<input type="hidden" id="s_name_${list.s_location_no}_${i.index }" value="${list.s_name}">
						<input type="hidden" id="s_contents_${list.s_location_no}_${i.index }" value="${list.s_contents}">
						<div class="card">
							<a> 
								<img alt="" src="/images/store/${list.s_no }/${list.s_no}-1.jpg">
							</a>
							<div class="card-body">
								<h5 class="card-title">
									<input type="checkbox" name="m_storeId" id="incheon_${i.index}" 
										value="${list.s_no }"><label for="incheon_${i.index}"> <a class="storeinfo">${list.s_name}</a></label>
								</h5>
								<p class="card-location">
									<a class="storeinfo">주소 : ${list.s_address}</a>
								</p>

								<p class="card-tel">
									<a class="storeinfo">전화번호 : ${list.s_tel}</a>
								<button type="button" class="btn btn-info btn-lg" onclick="show('${list.s_location_no}','${i.index }')">자세히보기</button>
								</p>
							</div>
						</div>
					</c:forEach>

				</div>
				<!--인천지역 끝  -->

				<!-- 경기지역 -->
				<div id="tab3" class="tab_content">
					<!--Content-->
					<h1>경기지역</h1>
					<c:forEach var="list" items="${locationStoreVO.gyeonggiList}" varStatus="i">
					
						<input type="hidden" id="s_name_${list.s_location_no}_${i.index }" value="${list.s_name}">
						<input type="hidden" id="s_contents_${list.s_location_no}_${i.index }" value="${list.s_contents}">
						<div class="card">
							<a> 
								<img alt="" src="/images/store/${list.s_no }/${list.s_no}-1.jpg">
							</a>
							<div class="card-body">
								<h5 class="card-title">
									<input type="checkbox" name="m_storeId" id="gyeonggi_${i.index}" 
										value="${list.s_no }"><label for="gyeonggi_${i.index}"> <a class="storeinfo">${list.s_name}</a></label>
								</h5>
								<p class="card-location">
									<a class="storeinfo">주소 : ${list.s_address}</a>
								</p>

								<p class="card-tel">
									<a class="storeinfo">전화번호 : ${list.s_tel}</a>
								<button type="button" class="btn btn-info btn-lg" onclick="show('${list.s_location_no}','${i.index }')">자세히보기</button>
								</p>
							</div>
						</div>
					</c:forEach>

				</div>
				<!--경기지역 끝  -->

			</div>
			<input type="submit" class="joinbtn" tabindex="-1" value="가입완료">

		</div>
	</form>
	
	<!-- Modal -->

  <div class="modal fade" id="detailModal" role="dialog">

    <div class="modal-dialog">

    

      <!-- Modal content-->

      <div class="modal-content">

        <div class="modal-header">

          <button type="button" class="close" data-dismiss="modal">&times;</button>

          <h4 class="modal-title" id="title"></h4>

        </div>

        <div class="modal-body">

          <p id="content"></p>

        </div>

        <div class="modal-footer">

          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

        </div>

      </div>

      

    </div>

  </div>  



      
      <script type="text/javascript">

	function show(a,b){
		//var str=i;
		//show 호출시 넘겨준 값을 이용하여 ajax 등을 통해 modal 을 띄울때 동적으로 바뀌어야 하는 값을 얻어온다.  
		
		var s_name =$("#s_name_"+a+"_"+b).val();
		var s_contents = $("#s_contents_"+a+"_"+b).val();
		//얻어온 값을 이용하여, modal 에서 동적으로 바뀌어야 하는 값을 바꾸어 준다..  

	    $("#title").html(s_name);

	    $("#content").html(s_contents);



	    //modal을 띄워준다.  

	    $("#detailModal").modal('show');

	}

</script>
	<jsp:include page="../layout/footer.jsp" />
</body>
</html>