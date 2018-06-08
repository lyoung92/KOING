<%@page import="koing.kosta180.domain.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Koing 회원가입</title>
<link rel="stylesheet" href="../css/join.css">

<script type="text/javascript">
    
        // 회원가입 화면의 입력값들을 검사한다.
        function checkValue()
        {
            var form = document.join_form;
        
            if(!form.id.value){
                alert("아이디를 입력하세요.");
                return false;
            }
            
           if(form.idDuplication.value != "idCheck"){
                alert("아이디 중복체크를 해주세요.");
                return false;
            } 
            
            if(!form.pw.value){
                alert("비밀번호를 입력하세요.");
                return false;
            }
            
            if(form.pw.value.length<6){
            	alert("비밀번호를 6자리 이상 입력하세요.");
            	return false;
            }
            
            // 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
            if(form.pw.value != form.pw2.value ){
                alert("비밀번호를 동일하게 입력하세요.");
                return false;
            }
            
            if(!form.m_name.value){
                alert("이름을 입력하세요.");
                return false;
            }
            
            if(!form.m_ssno.value){
                alert("생년월일을 입력하세요.");
                return false;
            }
            
            if(!form.m_gender.value){
                alert("성별을 선택하세요.");
                return false;
            }
            
            if(isNaN(form.m_ssno.value)){
                alert("주민번호는 숫자만 입력가능합니다.");
                return false;
            }
            
            if(isNaN(form.m_pno.value)){
                alert("전화번호는 - 제외한 숫자만 입력해주세요.");
                return false;
            }
            
            if(!form.m_address.value){
                alert("주소를 입력하세요.");
                return false;
            }
        }
        
        $("input[name = Id]").keyup(function() {
			$.ajax({
				url : "/duplicationCheck",
				type : "post",
				data : $("form").serialize(),
				success : function(data) {
					if (data.length > 0) {
					document.getElementById("duplicateResult").value = "이미 해당 아이디로 가입된 회원이 있습니다.";
					} else {
						if ($("input[name = Id]").val().length < 5) {
						document.getElementById("duplicateResult").value = "아이디를 5자 이상 입력해주세요.";
						} else {
							document.getElementById("duplicateResult").value = "사용 가능한 아이디입니다.";
						}
					}
				},
				error : function(error) {
					alert(error.statusText);
				}
			});

			return false;
		});
        
       // 아이디 중복체크 화면open
        function openIdChk(){
            window.name = "parentForm";
            window.open("IdCheckForm",
                    "chkForm", "width=500, height=300, resizable = no, scrollbars = no");    
        }

        // 아이디 입력창에 값 입력시 hidden에 idUncheck를 세팅한다.
        // 이렇게 하는 이유는 중복체크 후 다시 아이디 창이 새로운 아이디를 입력했을 때
        // 다시 중복체크를 하도록 한다.
        function inputIdChk(){
            document.join_form.idDuplication.value ="idUncheck";
        }
        
		//체크박스 all
 		function check(){
	   		cbox = join_form.m_agree;
		    if(cbox.length) {  // 여러 개일 경우
    		    for(var i = 0; i<cbox.length;i++) {
	           		cbox[i].checked=join_form.allCheck.checked;
		        }
		    } else { // 한 개일 경우
		        cbox.checked=input_form.all.checked;
	   		}
		}
   </script>

</head>
<body>
	<jsp:include page="../layout/header.jsp" />
	<div id="content_wrap">
		<div class="join">
			<form name="join_form" id="join_form" method="post"
				onsubmit="return checkValue()">
				<p class="title">회원가입</p>

				<p class="subtitle">정보입력</p>
				<div class="basic">

					<div>
						<input type="text" name="id" placeholder="아이디"
							onkeydown=inputIdChk()> <input type="button" value="중복확인"
							class="small" onclick="openIdChk()"> <input type="hidden"
							name="idDuplication" value="idUncheck">
					</div>


					<div class="password divide">
						<input type="password" name="pw" placeholder="비밀번호 (6자이상)"
							maxlength="30"> <input type="password" name="pw2"
							placeholder="비밀번호 재확인" maxlength="30">
					</div>

					<div>
						<input type="text" name="m_name" placeholder="이름">
					</div>

					<div class="gender divide">
						<input type="radio" name="m_gender" value="M" id="gender_male"><label
							for="gender_male">남자</label> <input type="radio" name="m_gender"
							value="F" id="gender_female"><label for="gender_female">여자</label>
					</div>

					<div class="ssno divide">
						<input type="text" name="m_ssno" placeholder="생년월일6자리"
							maxlength="6"> <input type="text" name="m_ssno2"
							placeholder="주민등록번호 뒤 맨 앞자리" maxlength="1">
					</div>

					<div>
						<input type="text" name="m_pno" placeholder="핸드폰번호">
					</div>

					<div>
						<input type="text" name="m_address" placeholder="주소">
					</div>

					<div>
						<input type="text" name="m_address2" placeholder="세부주소">
					</div>






					<p class="subtitle">약관동의</p>
					<div class="clause">

						<input type="checkbox" id="allCheck" onclick="check()"><label
							for="allCheck">전체 이용약관에 동의합니다.</label>
						<hr>
						<input type="checkbox" name="m_agree" id="agree_1"><label
							for="agree_1">만 14세 이상입니다. <span>(필수)</span></label> <input
							type="checkbox" name="m_agree" id="agree_2"><label
							for="agree_2">이용약관 <span>(필수)</span></label>
						<iframe src="../static/tos.html"></iframe>

						<input type="checkbox" name="m_agree" id="agree_3"><label
							for="agree_3">개인정보취급방침 <span>(필수)</span></label>
						<iframe src="../static/privacy.html"></iframe>


						<input type="checkbox" name="m_agree" id="m_agree"
							data-target="marketing" value='true'><label for="m_agree">
							Social 매칭 서비스 동의 <span class="optional">(선택)</span>
						</label>
						<p>Social Dining을 위한 정보수집에 동의해주세요.</p>

					</div>
					<input type="submit" class="complete" tabindex="-1" value="다음">
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="../layout/footer.jsp" />
</body>

</html>