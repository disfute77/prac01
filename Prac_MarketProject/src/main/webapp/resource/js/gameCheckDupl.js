$(document).ready(function() {
	$("#checkDupl").click(function(){
		var gameId = $("#gameid").val();			
		$.ajax({
			type: "POST", url: "gameAddCheckDupl.jsp", data: {id: gameId },
			success: function(response) {
				if(response==1){
					alert("이미 존재하는 ID입니다.");
					$("#haveCheckDupl").val("0");
				} else if(response==0) {
					alert("사용 가능한 ID입니다.");
					$("#haveCheckDupl").val("1");
				} else {
					alert("SQL 오류가 발생했습니다.");
					$("#haveCheckDupl").val("0");
				} 
			},
			error: function() {
				alert("오류가 발생했습니다.");
			}
		});	
	});
});