<%@page import="koing.kosta180.domain.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Koing 회원가입</title>
<link rel="stylesheet" href="../css/join.css">

<script type="text/javascript">
    
        // 회원가입 화면의 입력값들을 검사한다.
	function checkValue() {
        	var form = document.join_form;
        	if (form.pw.value != "") {
        		if (form.pw.value.length < 6) {
        			alert("비밀번호를 6자리 이상으로 설정하세요.");
            		return false;
            		}
        		}

      // 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
      		if (form.pw.value != form.pw2.value) {
        		  alert("비밀번호를 동일하게 입력하세요.");
        	   	  return false;
 		      }


      if (isNaN(form.m_pno.value)) {
         alert("전화번호는 - 제외한 숫자만 입력해주세요.");
         return false;
      }
      
      alert("수정이 완료되었습니다.")


   }
</script>

</head>
<body>
	<jsp:include page="../layout/header.jsp" />
	<div id="content_wrap">
		<div class="join">
			<form name="join_form" id="join_form" action="updateMember" method="post"
				onsubmit="return checkValue()">
				<input type="hidden" name="path" id="path" value ="updateMember" />
				<input type="hidden" name="id" value="${sessionMember.id }">
				<input type="hidden" name="m_gender" value="${sessionMember.m_gender }">
				<input type="hidden" name ="m_ssno" value="${sessionMember.m_ssno }">
				<input type="hidden" name="m_agree" value="${sessionMember.m_agree }">
				<input type="hidden" name="m_grade" value="${sessionMember.m_grade }">
				<p class="title">회원정보수정</p>

				<p class="subtitle">정보입력</p>
				<div class="basic">

					<div class="notChange">
					<div class="insertCategory">회원ID</div>
					<div class="insertValue">${sessionMember.id }</div>
					</div>

					<div class="password divide">
						 <input type="password" name="pw" value="${sessionMember.pw }"
                              maxlength="30"><input type="password" name="pw2"
                              value="${sessionMember.pw }" maxlength="30">
					</div>

					<div>
						 <input type="text" name="m_name"
                              value="${sessionMember.m_name }">
					</div>
					
					<div>
						<input type="text" name="m_pno" value="${sessionMember.m_pno }">
					</div>

					<div>
						<input type="text" name="m_address"
                              value="${sessionMember.m_address }">
					</div>

					<div>
						<input type="text" name="m_address2" placeholder="세부주소">
					</div>

					<input type="submit" class="complete" tabindex="-1" value="수정완료">
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="../layout/footer.jsp" />
</body>

</html>