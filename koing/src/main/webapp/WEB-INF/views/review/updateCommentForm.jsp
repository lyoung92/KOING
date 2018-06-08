<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
        #wrap {
            width: 550px;
            margin: 0 auto 0 auto;
            text-align :center;
        }
    
        #commentUpdateForm{
            text-align :center;
        }
    </style>
    
    <script type="text/javascript">
    
        var httpRequest = null;
        
        // httpRequest 객체 생성
        function getXMLHttpRequest(){
            var httpRequest = null;
        
            if(window.ActiveXObject){
                try{
                    httpRequest = new ActiveXObject("Msxml2.XMLHTTP");    
                } catch(e) {
                    try{
                        httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
                    } catch (e2) { httpRequest = null; }
                }
            }
            else if(window.XMLHttpRequest){
                httpRequest = new window.XMLHttpRequest();
            }
            return httpRequest;    
        }
    
    
        function checkValue()
        {
            var form = document.forms[0];
            // 전송할 값을 변수에 담는다.    
            var c_no = "${comment.c_no}";
            var c_contents = form.c_contents.value
            var c_img = form.c_img.value
            
            if(!c_contents)
            {
                alert("내용을 입력하세요");
                return false;
            }
            else{
                var param="c_no="+c_no+"&c_contents="+c_contents+"&c_img="+c_img;
 
                httpRequest = getXMLHttpRequest();
                httpRequest.onreadystatechange = checkFunc();
                httpRequest.open("POST", "updateComment.do", true);    
                httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded;charset=utf-8'); 
                httpRequest.send(param);
            }
        }
        
        function checkFunc(){
        	alert("수정완료")
            if(httpRequest.readyState == 4){
                // 결과값을 가져온다.
                var resultText = httpRequest.responseText;
                if(resultText == 1){
                    if (opener != null) {
                        // 부모창 새로고침
                        window.opener.document.location.reload(); 
                        opener.commentUpdateForm = null;
                        self.close();
                    }
                }
            }
        }
        
    </script>

</head>
<body>
   <div id="wrap">
      <br> <b><font size="5" color="gray">리뷰수정</font></b>
      <hr size="1" width="550">
      <br>

      <div id="commentUpdateForm">
         <form name="updateInfo" target="parentForm">
            <div>사진을 다시 선택해주세요.</div>
            <input type="file" name="c_img">
            <textarea rows="7" cols="70" name="c_contents">${comment.c_contents}</textarea>
            <br>
            <br> <input type="button" value="등록" onclick="checkValue()">
            <input type="button" value="창닫기" onclick="window.close()">
         </form>
      </div>
   </div>


</body>
</html>