<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  <script src="../js/matching.js" type="text/javascript"></script>
  
  <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">
	<script src="../resources/js/matching.js" type="text/javascript"></script>
</head>

<body>
	<div class="container">
		<form action="updateMatching" method="post">
		<input type="hidden" name="mc_bno" value=${matching.mc_bno }>
			<h3>매칭글 수정</h3>
			<div class="form-group row">
				<div class="col-xs-4">
					<label for="matching_title">제목</label> <input class="form-control"
						id="matching_title" type="text" name="mc_title">
				</div>
			</div>
			
			<div class="form-group">
				<label for="matching_text">소개글</label>
				<textarea class="form-control" rows="5" id="comment"
					id="matching_contents" name="mc_contents"></textarea>
			</div>

			<div class="form-group">
				<label for="matching_res">장소</label>
				<textarea class="form-control" rows="5" id="comment"
					id="matching_res" name="s_name"></textarea>
			</div>
			
			<div class="form-group row">
				<div class="col-xs-2">
					<label for="matching_entryfee">참가비</label> <input
						class="form-control" id="matching_entryfee" type="text"
						name="mc_entryfee" value="ex) 20000">
				</div>
			</div>

			<div class="form-group row">
				<label for="matching_title">모임 날짜</label> <input id="datepicker"
					type="text" name="mc_date" value="날짜">
			</div>

			<div class="form-group row">
				<div class='input-group date' id='datetimepicker3'>
					<label for="matching_entryfee">모임 시간</label> <input type='text'
						class="form-control" name="mc_time"/> <span class="input-group-addon"> <span
						class="glyphicon glyphicon-time"></span>
					</span>
				</div>
			</div>
			
			<div class="form-group row">
				<div class="col-xs-2">
					<label for="matching_entryfee">인원수</label> <input
						class="form-control" id="matching_totalnum" type="text"
						name="mc_totalnum" value="ex) 10">명
				</div>
			</div>
			
			<button type="submit" class="btn btn-primary btn-lg btn-block">글 수정하기</button>
		</form>
	</div>

</body>
</html>