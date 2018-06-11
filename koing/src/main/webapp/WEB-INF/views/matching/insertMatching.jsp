<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- jQuery 2.1.4 -->
<script src="https://code.jquery.com/jquery-2.1.4.js"></script>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/css/bootstrap.css">
<link rel="stylesheet" href="../css/flexslider.css">
<link rel="stylesheet" href="../css/mypage.css">

<script src="../js/matching.js" type="text/javascript"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
form.form{
width: 80%;
margin-left: 10%;
margin-right: auto;
}

</style>

<script type="text/javascript">

function checkValue()
{
    var form = document.form;
    
    if(!form.mc_title.value){
        alert("제목을 입력하세요.");
        return false;
    }
}

</script>
</head>

<body class="br-light">
	<jsp:include page="../layout/header.jsp" />
	<jsp:include page="../main/ticketmain.jsp" />

	<div class="container-diy">
		<form class="form" action="insertMatching" method="post" onsubmit="return checkValue()">
			<h3>매칭글 등록</h3>

			<table class="table table-bordered">
				<tr>
					<th>제목</th>
					<td><input type="text"  id="mc_title" name="mc_title"
						placeholder="제목을 입력하세요."></td>
				</tr>

				<tr>
					<th>매칭 소개글</th>
					<td><textarea rows="3" cols="40" id="mc_contents"
							name="mc_contents"></textarea></td>
				</tr>

				<tr>
					<th>장소</th>
					<td>
						<!-- <input type="text" id="s_name" name="s_name"
						placeholder="매장 이름을 입력하세요."> --> <select name="s_no" id="s_no">
							<option value="">매장선택</option>
							<c:forEach var="list" items="${storeList}">
								<option value="${list.s_no}">${list.s_name}
									(${list.s_address})</option>
							</c:forEach>
					</select>
					</td>
				</tr>

				<tr>
					<th>참가비</th>
					<td><input type="text" id="mc_entryfee" name="mc_entryfee">
					</td>
				</tr>

				<tr>
					<th>모임 날짜</th>
					<td><input type="text" id="mc_date" name="mc_date"
						placeholder="2018-07-25"></td>
				</tr>

				<tr>
					<th>모임 시간</th>

					<td><select name="mc_time" id="mc_time">
							<option value="09:00">09:00</option>
							<option value="10:00">10:00</option>
							<option value="11:00">11:00</option>
							<option value="12:00">12:00</option>
							<option value="13:00">13:00</option>
							<option value="14:00">14:00</option>
							<option value="15:00">15:00</option>
							<option value="16:00">16:00</option>
							<option value="17:00">17:00</option>
							<option value="18:00">18:00</option>
							<option value="19:00">19:00</option>
							<option value="20:00">20:00</option>
					</select></td>
				</tr>

				<tr>
					<th>인원수</th>
					<td><input type="text" id="mc_totalnum" name="mc_totalnum"
						placeholder="10"> 명</td>
				</tr>

				<tr>
					<td colspan="2">
						<button type="button" class="btn btn-primary btn-sm pull-right" onclick="history.back(-1)">취소</button>
						<button type="submit" class="btn btn-primary btn-sm pull-right"
							style="margin-right: 10px;">등록</button>
					</td>
				</tr>
			</table>
		</form>
	</div>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

	<jsp:include page="../layout/footer.jsp" />
</body>
</html>