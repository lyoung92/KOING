function ticketdetail(t_bno) {
   location.href = "findTicket?t_bno=" + t_bno;
}

function ticketdelete(t_bno) {
   location.href = "deleteTicket?t_bno=" + t_bno;
}

function ticketManagement(t_bno){
	location.href = "issuedTicketManagement?t_bno=" +t_bno;
}

function completeTicketInsert(i_no){
	post_to_url("completeTicketInsert",{'i_no':i_no,'path':location.pathname+ location.search});
}



/*
 * path : 전송 URL
 * params : 전송 데이터 {'q':'a','s':'b','c':'d'...}으로 묶어서 배열 입력
 * method : 전송 방식(생략가능)
 */
// 실제 구동 방식 : post_to_url('http://example.com/', {'q':'a'});

function post_to_url(path, params, method) {
    method = method || "post"; // Set method to post by default, if not specified.
    // The rest of this code assumes you are not using a library.
    // It can be made less wordy if you use one.
    var form = document.createElement("form");
    form.setAttribute("method", method);
    form.setAttribute("action", path);
    for(var key in params) {
        var hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", key);
        hiddenField.setAttribute("value", params[key]);
        form.appendChild(hiddenField);
    }
    document.body.appendChild(form);
    form.submit();
}
