<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.1.1.min.jsaaa"></script>
<script type="text/javascript" src="<c:url value="/resources/js/sockjs-0.3.4.js"/>"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#sendBtn").click(function(){
			sendMessage();
		});
	});
	var sock;
	//웸소켓을 지정한 url로 연결한다.
    sock = new SockJS("<c:url value="/echo"/>");

    //자바스크립트 안에 function을 집어넣을 수 있음.
    //데이터가 나한테 전달되읐을 때 자동으로 실행되는 function
    sock.onmessage = onMessage;

    //데이터를 끊고싶을때 실행하는 메소드
    sock.onclose = onClose;

    /* sock.onopen = function(){
        sock.send($("#message").val());
    }; */

    function sendMessage() {
        /*소켓으로 보내겠다.  */
        sock.send($("#message").val());
    }

    //evt 파라미터는 웹소켓을 보내준 데이터다.(자동으로 들어옴)
    function onMessage(evt) {
        var data = evt.data;
        $("#data").append(data + "<br/>");
        //sock.close();
    }

    function onClose(evt) {
        $("#data").append("연결 끊김");
    }
</script>
</head>
<body>
	<input type="text" id="message"/>
	<input type="button" id="sendBtn" value="전송"/>
	<div id="data"></div>
</body>
</html>