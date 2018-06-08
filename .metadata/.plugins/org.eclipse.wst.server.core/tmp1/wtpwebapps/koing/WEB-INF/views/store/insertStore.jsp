<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<!-- jQuery 2.1.4 -->
<script src="https://code.jquery.com/jquery-2.1.4.js"></script>
<script src="https://code.jquery.com/jquery-2.1.4.js"></script>
<link rel="stylesheet" href="../vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="../vendor/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="../css/flexslider.css">
<link rel="stylesheet" href="../css/mypage.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
.fileDrop {
	width: 80%;
	height: 100px;
	border: 1px dotted gray;
	background-color: lightslategray;
	margin: auto;
}
</style>
</head>
<body class="br-light">
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
	<div class="container-diy">
		<h2>상점 등록</h2>
		<tbody>
			<form id="insertForm" role="form" method="post">
				<input type="hidden" id="s_no" name="s_no" value="A07">
				<table class="table table-bordered">
					<tr>
						<th>아이디</th>
						<td><input type="text" id="id" name="id" value="aaa" readonly>
						</td>
					</tr>
					<tr>
						<th>상점 이름</th>
						<td><input type="text" id="s_name" name="s_name"
							placeholder="상점 이름 입력"></td>
					</tr>
					<tr>
						<th>상점 주소</th>
<!-- 						<td><input type="text" name="s_address" size="40" -->
<!-- 							placeholder="주소"></td> -->
						<td>
								<input type="text" id="sample6_postcode" placeholder="우편번호">
								<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
								<input type="text" id="s_address" name="s_address" placeholder="주소">
								<input type="text" id="sample6_address2" name="s_address" placeholder="상세주소">
							</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td><input type="text" id="s_tel" name="s_tel"
							placeholder="전화번호"> <!-- <select id="s_tel" name="s_tel1">
										<option value="0002" selected>02</option>
										<option value="0031">031</option>
										<option value="0032">032</option>
										<option value="0033">033</option>
										<option value="0041">041</option>
										<option value="0042">042</option>
										<option value="0043">043</option>
										<option value="0051">051</option>
										<option value="0052">052</option>
										<option value="0053">053</option>
										<option value="0054">054</option>
										<option value="0055">055</option>
										<option value="0061">061</option>
										<option value="0062">062</option>
										<option value="0063">063</option>
										<option value="0064">064</option>
										<option value="0502">0502</option>
								</select>-
								<input type="text" id="s_tel" name="s_tel2" placeholder="">-
								<input type="text" id="s_tel" name="s_tel3" placeholder=""> -->
						</td>
					</tr>
					<tr>
						<th>이미지</th>
						<td><input type="file" id="s_img" name="s_img"> <%-- <jsp:include page="uploadAjax.jsp"/> --%>
							<div class="fileDrop"></div></td>
					</tr>
					<tr>
						<th>첨부 파일 목록</th>
						<td>
							<ul class="mailbox-attachments clearfix uploadedList">
							</ul>
						</td>
					</tr>
					<tr>
						<th>카테고리</th>
						<td><select id="s_category" name="s_category">
								<option value="한식">한식</option>
								<option value="양식">양식</option>
								<option value="일식">일식</option>
								<option value="중식">중식</option>
								<option value="아시아식">아시아식</option>
						</select></td>
					</tr>
					<tr>
						<th>키워드</th>
						<td><input type="text" id="s_keyword" name="s_keyword"
							placeholder="키워드를 입력하세요"></td>
					</tr>
					<tr>
						<th>상점 소개 글</th>
						<td><textarea rows="3" cols="40" id="s_contents"
								name="s_contents" placeholder="상점 소개 내용"></textarea></td>
					</tr>
					<tr>
						<th>지역번호</th>
						<td><input type="text" id="s_location_no"
							name="s_location_no" placeholder="지역번호"></td>
					</tr>
					<tr>
						<td colspan="2">
							<button type="button" class="btn btn-primary btn-sm pull-right">취소</button>
							<button type="submit" class="btn btn-primary btn-sm pull-right" style="margin-right: 10px;">등록</button>
						</td>
					</tr>
				</table>
			</form>
		</tbody>
	</div>

	<script type="text/javascript" src="/js/upload.js"/>"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

	<script id="template" type="text/x-handlebars-template">
<li>
  <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
  <div class="mailbox-attachment-info">
	<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
	<a href="{{fullName}}" 
     class="btn btn-default btn-xs pull-right delbtn"><i class="fa fa-fw fa-remove"></i></a>
	</span>
  </div>
</li>                
</script>

	<script>
		var template = Handlebars.compile($("#template").html());

		$(".fileDrop").on("dragenter dragover", function(event) {
			event.preventDefault();
		});

		$(".fileDrop").on("drop", function(event) {
			event.preventDefault();

			var files = event.originalEvent.dataTransfer.files;

			var file = files[0];

			var formData = new FormData();

			formData.append("file", file);

			$.ajax({
				url : '/store/uploadAjax',
				data : formData,
				dataType : 'text',
				processData : false,
				contentType : false,
				type : 'POST',
				success : function(data) {

					var fileInfo = getFileInfo(data);

					var html = template(fileInfo);

					$(".uploadedList").append(html);
					$("#s_img").val(html);
				}
			});
		});

		$("#insertForm").submit(
				function(event) {
					event.preventDefault();

					var that = $(this);

					var str = "";

					$(".uploadedList .delbtn").each(
							function(index) {
								str += "<input type='hidden' name='files["
										+ index + "]' value='"
										+ $(this).attr("href") + "'> ";
							});

					that.append(str);

					that.get(0).submit();
				});
		
		$(".uploadedList").on("click", ".delbtn", function(event) {

			event.preventDefault();

			var that = $(this);

			//alert("DELETE FILE");

			$.ajax({
				url : "/store/deleteFile",
				type : "post",
				data : {
					fileName : $(this).attr("href")
				},
				dataType : "text",
				success : function(result) {
					console.log("RESULT: " + result);
					if (result == 'deleted') {
						that.closest("li").remove();
					}
				}
			});
		});
	</script>

	<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('s_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
</script>
	<jsp:include page="../layout/footer.jsp" />
</body>
</html>