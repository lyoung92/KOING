<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style>
#modDiv {
	width: 300px;
	height: 100px;
	background-color: gray;	
	position: absolute;
	top: 50%;
	left: 50%;
	margin-top: -50px;
	margin-left: -150px;
	padding: 10px;
	z-index: 1000;
}

.star_rating {
	font-size: 0;
	letter-spacing: -4px;
}

.star_rating li {
	font-size: 22px;
	letter-spacing: 0;
	display: inline-block;
	margin-left: 0px;
	color: #ccc;
	text-decoration: none;
	padding: 0;
}

.star_rating li.on {
	color: yellow;
}

.col-md-1{
color: #ffffff;
text-align: center;
}

tr.commentLi{
text-align: center;
color: white;
}
</style>
</head>
<body>
	<div class="container">
		<h2>댓글등록</h2>
		<div class="row">
			<form action="">
				<table class="table" style="background: #b91b39; width: 100%">
					<thead>
						<tr>
							<th class="col-md-1" style="width: 10%;">아이디</th>
							<th class="col-md-1" style="width: 30%;">댓글내용</th>
							<th class="col-md-1" style="width: 20%;">평점</th>
							<th class="col-md-1" style="width: 20%;">첨부파일</th>
							<th class="col-md-1" style="width: 20%;">예약번호</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="color: #ffffff; font-weight: 1000;text-align: center;"><input type="hidden" name="s_no" id="s_no"
								value="${store.s_no }"> <input type="hidden" name="id"
								class="form-control" id="newReplyWriter"
								value="${sessionMember.id }" >${sessionMember.id }</td>
							<td><textarea name='c_contents' class="form-control"
									id='newReplyText' rows="3" cols="40"></textarea></td>
							<td><input type="hidden" name="c_score" id="newReplyScore" value="3">
								<ul class="star_rating" style="width: 80%; margin-left: 10%">
									<li data-score="1" class="on" style="width: 20%;">★</li>
									<li data-score="2" class="on" style="width: 20%;">★</li>
									<li data-score="3" class="on" style="width: 20%;">★</li>
									<li data-score="4" style="width: 20%;">★</li>
									<li data-score="5" style="width: 20%;">★</li>
								</ul></td>
							<td><input type="file" name="c_img" class="form-control"
								id="newReplyImg"></td>
							<td><!-- <input type='text' name='r_no' class="form-control"
								id='newReplyTr'> -->
								<select name='r_no' class="form-control" id='newReplyTr' style="height: 50%;">
									<option value="">예약날짜선택</option>
									<c:forEach var="list" items="${reserveList}">
									<option value="${list.r_no}">${list.r_date}(${list.r_time })</option>
									</c:forEach>
								</select>
								
								</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="5">
								<button class="btn" id="replyAddBtn" style="width: 20%; margin-left: 80%">ADD REPLY</button>
							</td>
						</tr>
					</tfoot>
				</table>
			</form>
		</div>
	</div>

	<div class="container" style="padding-left: 0; padding-right: 0">
		<table class="table" style="background: #b91b39; width: 100%;">
			<thead>
				<tr>
					<th class="col-md-1" style="width: 10%;">글번호</th>
					<th class="col-md-1" style="width: 25%;">등록날짜</th>
					<th class="col-md-1" style="width: 10%;">작성자</th>
					<th class="col-md-1" style="width: 40%;">내용</th>
					<th class="col-md-1" style="width: 5%;">별점</th>
					<th class="col-md-1" style="width: 10%;">사진</th>
				</tr>
			</thead>
			<tbody id="comment">

			</tbody>
		</table>
	</div>

	<ul class='pagination'>
	</ul>

	<script>
		$(".star_rating li").on("click", function() {
			var star = $(this).data("score");
			$("#newReplyScore").val(star);
		});

		$(".star_rating li").on("mouseover", function() {
			$(this).parent().children("li").removeClass("on");
			$(this).addClass("on").prevAll("li").addClass("on");
			return false;
		});

		function getPageList(page) {

			$
					.getJSON(
							"/comment/" + s_no + "/" + page,
							function(data) {

								console.log(data.list.length);

								var str = "";

								$(data.list)
										.each(
												function() {
													str += "<tr data-c_no='"+this.c_no+"' class='commentLi'>"
															+ "<td><div class='c_date'>"
															+ this.c_no
															+ "</div></td>"
															+ "<td><div class='c_date'>"
															+ this.dateToString
															+ "</div></td>"
															+ "<td><div class='id'>"
															+ this.id
															+ "</div></td>"
															/* + "<td><div class='s_no'>"+this.s_no+"</div></td>" */
															+ "<td><div class='c_contents'>"
															+ this.c_contents
															+ "</div></td>"
															+ "<td><div class='c_score'>"
															+ this.c_score
															+ "</div></td>"
															+ "<td><div class='c_img'>"
															+ this.c_img
															+ "</div></td>"
													/* + "<td><div class='r_no'>"+this.r_no+"</div></td>" */;

													if ("${sessionMember.id}" == this.id) {
														str += "<td><button class='update btn btn-primary'>수정</button></td></tr>";
													} else {
														str += "</tr>";
													}
												});

								$("#comment").html(str);

								$(".commentLi")
										.each(
												function() {
													$(this)
															.find(".update")
															.on(
																	"click",
																	function() {
																		var c_no = $(
																				this)
																				.parent()
																				.parent()
																				.data(
																						"c_no");
																		var idVal = $(
																				this)
																				.parent()
																				.prevAll(
																						"td")
																				.children(
																						".id")
																				.text();
																		var c_contentsVal = $(
																				this)
																				.parent()
																				.prevAll(
																						"td")
																				.children(
																						".c_contents")
																				.text();
																		var c_scoreVal = $(
																				this)
																				.parent()
																				.prevAll(
																						"td")
																				.children(
																						".c_score")
																				.text();
																		var c_imgVal = $(
																				this)
																				.parent()
																				.prevAll(
																						"td")
																				.children(
																						".c_img")
																				.text();
																		var r_noVal = $(
																				this)
																				.parent()
																				.prevAll(
																						"td")
																				.children(
																						".r_no")
																				.text();

																		$(
																				"#replyModifyModal .modal-body .modal-reply")
																				.attr(
																						'data-c_no',
																						c_no);
																		$(
																				"#replyModifyModal .modal-body")
																				.find(
																						"#newReplyWriter")
																				.val(
																						idVal);
																		$(
																				"#replyModifyModal .modal-body")
																				.find(
																						"#newReplyText")
																				.val(
																						c_contentsVal);
																		$(
																				"#replyModifyModal .modal-body")
																				.find(
																						"#newReplyScore")
																				.val(
																						c_scoreVal);
																		//$("#replyModifyModal .modal-body").find("#newReplyImg").val(c_imgVal[1]);
																		$(
																				"#replyModifyModal .modal-body")
																				.find(
																						"#newReplyTr")
																				.val(
																						r_noVal);
																		//$("#replyModifyModal .modal-body").text($(this).parent(".s_no").val());
																		$(
																				"#replyModifyModal")
																				.modal(
																						'show');

																	})

												});

								$("#replyModBtn")
										.on(
												"click",
												function() {
													var c_no = $(".modal-reply")
															.data("c_no");
													var c_contents = $(
															".modal-reply")
															.find(
																	"#newReplyText")
															.val();
													var c_score = $(
															".modal-reply")
															.find(
																	"#newReplyScore")
															.val();
													var c_img = $(
															".modal-reply")
															.find(
																	"#newReplyImg")
															.val();

													$
															.ajax({
																type : 'put',
																url : '/comment/'
																		+ c_no,
																headers : {
																	"Content-Type" : "application/json",
																	"X-HTTP-Method-Override" : "PUT"
																},
																data : JSON
																		.stringify({
																			c_contents : c_contents,
																			c_score : c_score,
																			c_img : c_img
																		}),
																dataType : 'text',
																success : function(
																		result) {
																	console
																			.log("result: "
																					+ result);
																	if (result == 'SUCCESS') {
																		$(
																				"#replyModifyModal")
																				.modal(
																						"hide");
																		//getAllList();
																		getPageList(replyPage);
																	}
																}
															});
												});
								$("#replyDelBtn")
										.on(
												"click",
												function() {
													var c_no = $(".modal-reply")
															.data("c_no");
													console.log("c_no:" + c_no);

													$
															.ajax({
																type : 'delete',
																url : '/comment/'
																		+ c_no,
																headers : {
																	"Content-Type" : "application/json",
																	"X-HTTP-Method-Override" : "DELETE"
																},
																dataType : 'text',
																success : function(
																		result) {
																	console
																			.log("result : "
																					+ result);
																	if (result == 'SUCCESS') {
																		alert("삭제 되었습니다.");
																		$(
																				"#replyModifyModal")
																				.modal(
																						"hide");
																		getPageList(replyPage);
																	}
																}
															});

												});

								printPaging(data.pageMaker);

							});

		}

		var s_no = "${store.s_no}";

		getPageList(1);

		function getAllList() {
			$.getJSON("/comment/all/" + s_no, function(data) {
				var str = "";
				console.log(data.length);

				$(data).each(function() {
					/* 			str += "<li data-c_no='"+this.c_no+"' class='commentLi'  style='border:1px solid #000; width:200px;'>"
										+ "s_no : "
										+ this.s_no
										+ "<br>"
										+ "c_contents : "
										+ this.c_contentsq
										+ "<br>"
										+ "c_score : "
										+ this.c_score
										+ "<br>"
										+ "c_img : "
										+ this.c_img
										+ "</li>"; */
				});
				$("#comment").html(str);
			});
		}

		$("#replyAddBtn").on("click", function() {
			var id = $("#newReplyWriter").val();
			var c_contents = $("#newReplyText").val();
			var c_score = $("#newReplyScore").val();
			var c_img = $("#newReplyImg").val();
			var r_no = $("#newReplyTr").val();

			$.ajax({
				type : 'post',
				url : '/comment/add',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
				data : JSON.stringify({
					s_no : s_no,
					id : id,
					c_contents : c_contents,
					c_score : c_score,
					c_img : c_img,
					r_no : r_no
				}),
				success : function(result) {

					if (result == 'SUCCESS') {

						alert("등록 되었습니다.");
						getPageList(1);

					}
				}
			});
		});

		// 		$("#comment").on("click", "#update", function() {
		// 			var c_no = $(this).prev().find("data-c_no").val();
		// 			alert($(this).text());
		// 				console.log("c_no :" + c_no);
		// 			$.getJSON("/comment/"+c_no,function(data){
		// 				var str ="";
		// 				var selected = "selected";
		// 				var comment = $(this).prev();
		// 				$(data).each(function(index, e){
		// 					/* alert("aaa",$(this).find("li").text()); */	
		// 					if(this.c_no == comment.attr("data-c_no")){

		// 					str += "<li data-c_no='"+this.c_no+"' class='commentLi'  style='border:1px solid #000; width:300px;'>"
		// 					+ "c_contents : "
		// 					+ "<input type='text' name='c_contents' id='newReplyText' value='"+this.c_contents+"'>"
		// 					+ "<br>"
		// 					+ "c_score : "
		// 					+ "<select name='c_score' id='newReplyScore' style='color:#920021;'";
		// 					for(var i = 0; i<6; i++){
		// 						if(this.c_score == i){
		// 							str += "<option value='"+i+"' "+selected+">"+i+"</option>";
		// 						} else{
		// 							str += "<option value='"+i+"'>"+i+"</option>";
		// 						}

		// 					}
		// 					str += "</select>"
		// 					+ "<br>"
		// 					+ "c_score : "
		// 					+ "<input type='text' name='c_img' id='newReplyImg' value='"+this.c_img+"'>"
		// 					+ "</li>"
		// 					+ "<button id='replyModBtn'>수정</button>";
		// 					}else{
		// 						alert("안됨");
		// 					}
		// 				});
		// 				var text = $(this).prev().val();
		// 				alert(text);
		// 				var c_no = comment.attr("data-c_no");

		// 				$(".modal-title").html(c_no);
		// 				$("#modContent").html(str);
		// 				$("#modDiv").show("fast");
		// 			});

		/* var comment = $(this).prev();

		var c_no = comment.attr("data-c_no");
		var c_contents = comment.text();

		alert(c_contents);

		$(".modal-title").html(c_no);
		$("#c_contents").val(c_contents);
		$("#modDiv").show("fast"); */
		// 		});
		function printPaging(pageMaker) {

			var str = "";

			if (pageMaker.prev) {
				str += "<li><a href='" + (pageMaker.startPage - 1)
						+ "'> << </a></li>";
			}

			for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
				var strClass = pageMaker.cri.page == i ? 'class=active' : '';
				str += "<li "+strClass+"><a href='"+i+"'>" + i + "</a></li>";
			}

			if (pageMaker.next) {
				str += "<li><a href='" + (pageMaker.endPage + 1)
						+ "'> >> </a></li>";
			}
			$('.pagination').html(str);
		}

		var replyPage = 1;

		$(".pagination").on("click", "li a", function(event) {

			event.preventDefault();

			replyPage = $(this).attr("href");

			getPageList(replyPage);

		});
	</script>
	<!-- Modal -->
	<div class="modal fade" id="replyModifyModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="modal-reply">
						<div>
							ID : <input type='text' name='id' id='newReplyWriter' readonly>
						</div>
						<div>
							댓글 : <input type='text' name='c_contents' id='newReplyText'>
						</div>
						<div>
							평점 : <select name="c_score" id="newReplyScore"
								style="color: #920021;">
								<option value="1">★</option>
								<option value="2">★★</option>
								<option value="3">★★★</option>
								<option value="4">★★★★</option>
								<option value="5">★★★★★</option>
							</select>
						</div>
						<div>
							첨부파일 : <input type='file' name='c_img' id='newReplyImg'>
						</div>
						<div>
							예약 정보 : <input type='text' name='r_no' id='newReplyTr' readonly>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-danger" id="replyDelBtn">Delete</button>
					<button type="button" class="btn btn-primary" id="replyModBtn">Save
						changes</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal End -->

</body>
</html>