$(function () {
    $("#datepicker").datepicker();
    var today = new Date();
});

$(function () {
    $('#datetimepicker3').datetimepicker({
        format: 'LT'
    });
});

function updateMatching(mc_bno) {
	location.href = "updateMatching?mc_bno=" + mc_bno;
}

function deleteMatching(mc_bno) {
	location.href = "deleteMatching?mc_bno=" + mc_bno;
}

function applyMatching(mc_bno) {
	alert("신청되었습니다.");
	location.href = "applyMatching?mc_bno=" + mc_bno;
}

function cancelMatching(mc_bno) {
	alert("취소되었습니다.");
	location.href = "cancelMatching?mc_bno=" + mc_bno;
}

function reserveMatching(mc_bno) {
	location.href = "reserveMatching?mc_bno=" + mc_bno;
}

function cancelResMatching(mc_bno) {
	location.href = "cancelResMatching?mc_bno=" + mc_bno;
}

function acceptRes(mc_bno) {
	location.href = "acceptRes?mc_bno=" + mc_bno;
}

function rejectRes(mc_bno) {
	location.href = "rejectRes?mc_bno=" + mc_bno;
}
/*
$(document).ready(function(){

	 var mc_totalnum = '${matchingList.mc_totalnum}';
	 var mc_applicantnum = '${matchingList.mc_applicantnum}';
	 alert("ooo");
	 if(mc_totalnum == mc_applicantnum){
		 sendMail();
	   }
	});

	function sendMail(){
		var mc_bno = '${matchingList.mc_bno}';
		location.href = "sendMail?mc_bno=" + mc_bno;
	}
*/
