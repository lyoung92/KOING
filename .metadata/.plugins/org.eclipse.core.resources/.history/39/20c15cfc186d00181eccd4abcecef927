<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Koing - Elegant, Minimal, Creative Bootstrap Template</title>
<link rel="stylesheet" href="../css/app.css">
<link rel="stylesheet" href="../css/review.css">
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/flexslider.css">
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="../css/responsive.css">
<link rel="stylesheet" href="../css/animate.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

<!-- 상단 고정 스크립트 -->
<script src="//code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
      $( document ).ready( function() {
        var jbOffset = $( '#header' ).offset();
        $( window ).scroll( function() {
          if ( $( document ).scrollTop() > jbOffset.top ) {
            $( '#header' ).addClass( 'jbFixed' );
          }
          else {
            $( '#header' ).removeClass( 'jbFixed' );
          }
        });
      } );
 
    </script>


</head>
<body>

	<div class="container" style="padding: 0;">
		<div>
			<%-- <c:choose>
				<c:when test="${isPossible}"> --%>
			<form action="insertCommentOk.do" method="post" style="margin: 0 auto; width: 800px;">
				<table class="table table-dark">
					<thead>
						<tr>
							<th class="col-md-1">아이디</th>
							<th class="col-md-1">내용</th>
							<th class="col-md-1">별점</th>
							<th class="col-md-1">사진</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${sessionMember.id}</td>
							<td><textarea rows="3" cols="20" name="c_contents" style="color: #000;"></textarea></td>
							<td><select name="c_score" id="c_score" style="color: #920021;">
									<option value="1">★</option>
									<option value="2">★★</option>
									<option value="3">★★★</option>
									<option value="4">★★★★</option>
									<option value="5">★★★★★</option>
							</select></td>
							<td><input type="hidden" name="r_no" value="${r_no}">
								<input type="hidden" name="s_no" value="${store.s_no}">
								<input type="file" name="c_img"></td>
						</tr>
					</tbody>
				</table>
				<input type="submit" class="btn" value="작성">
			</form>
			<%-- </c:when>
			</c:choose> --%>
		</div>
	</div>

</body>
</html>