$(document).ready(function() {
    // 중복 검사 버튼 클릭 이벤트
    $("#checkDupl").click(function(){
        console.log("중복검사 눌림");
        const memberId = $("#memberId").val();			
        $.ajax({
            type: "POST", 
            url: "signupCheckDupl.jsp", 
            data: {id: memberId },
            success: function(response) {
                if(response == 1) {
                    alert("이미 존재하는 ID입니다.");
                    $("#haveCheckDupl").val("0");
                } else if(response == 0) {
                    alert("사용 가능한 ID입니다.");
                    $("#haveCheckDupl").val("1");
                    $('#memberId').prop('readonly', true);
                    $('#checkDupl').val("ID 초기화");
                    $('#checkDupl').attr('id', 'resetID'); // ID를 resetID로 변경
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
    
    // ID 초기화 버튼 클릭 이벤트
    $(document).on('click', '#resetID', function() {
        console.log("리셋아이디 눌림");
        $('#memberId').val('');
        $('#memberId').prop('readonly', false);
        $('#resetID').val("중복검사");
        $('#resetID').attr('id', 'checkDupl'); // ID를 checkDupl로 변경
        $("#haveCheckDupl").val("0");
    });
});

//$(document).ready(function() {
//	$("#checkDupl").click(function(){
//		console.log("중복검사 눌림");
//		const memberId = $("#memberId").val();			
//		$.ajax({
//			type: "POST", url: "signupCheckDupl.jsp", data: {id: memberId },
//			success: function(response) {
//				if(response==1){
//					alert("이미 존재하는 ID입니다.");
//					$("#haveCheckDupl").val("0");
//				} else if(response==0) {
//					alert("사용 가능한 ID입니다.");
//					$("#haveCheckDupl").val("1");
//					$('#memberId').prop('readonly', true);
//				    $('#checkDupl').val("ID 초기화");
//				    $('#checkDupl').attr('id', 'resetId');
//				} else {
//					alert("SQL 오류가 발생했습니다.");
//					$("#haveCheckDupl").val("0");
//				} 
//			},
//			error: function() {
//				alert("오류가 발생했습니다.");
//			}
//		});	
//	});
//	
////	$("#resetId").on('click', function() {
//	$(document).on('click', '#resetID', function() {
//		console.log("리셋아이디 눌림");
//        $('#memberId').val('');
//        $('#memberId').prop('readonly', false);
//        $('#resetId').val("중복검사");
//        $('#resetId').attr('id', 'checkDupl');
//        $("#haveCheckDupl").val("0");
//    });
//	
//	
//});