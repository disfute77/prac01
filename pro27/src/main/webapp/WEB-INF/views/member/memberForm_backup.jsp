<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ page import="java.util.Random" %>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>회원가입</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap');
body {
font-family: "Noto Sans KR", sans-serif;
font-optical-sizing: auto;
font-weight: <weight>;
font-style: normal;
background-color: #f8f9fa;
}
.form-container {
    max-width: 400px;
    margin: 0 auto;
    padding: 30px;
    background-color: white;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
</style>

</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>
<div class="form-container">
    <h2 class="text-center mb-4">회원가입</h2>
    <form method="post" action="${pageContext.request.contextPath}/member/addMember.do">
        <div class="mb-3">
            <label for="id" class="form-label">ID</label>
            <input type="text" class="form-control" id="id" name="id" required>
        </div>
        <div class="mb-3">
            <label for="pwd" class="form-label">PW</label>
            <input type="password" class="form-control" id="pwd" name="pwd" required>
        </div>
        <div class="mb-3">
            <label for="name" class="form-label">이름</label>
            <input type="text" class="form-control" id="name" name="name" required>
        </div>
        <div class="mb-3">
            <label for="email" class="form-label">이메일</label>
            <input type="email" class="form-control" id="email" name="email" required>
        </div>
        
		<p class="d-inline-flex gap-1">
		  <button id="emailAuthButton" class="btn btn-primary" type="button" aria-expanded="false" aria-controls="collapseExample">
		    이메일인증
		  </button>
		</p>
		
		<div class="collapse" id="collapseExample"> <!-- 숨겨져있던부분 -->
			<div class="mb-3">
	            <label for="emailVerifyCode" class="form-label">이메일 인증번호</label>
	            <input type="text" class="form-control" id="emailVerifyCode" name="emailVerifyCode" placeholder="메일 확인 후 인증번호 입력">
	        </div>
	        <button id="emailVerifyCodeButton" class="btn btn-secondary" type="button">
		    	인증번호확인
		  	</button> 
		</div>
		
        <div class="text-center">
            <button type="submit" class="btn btn-primary">가입신청</button>
        </div>
    </form>
</div>

    <!-- 부트스트랩 JS와 Popper.js 추가 -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
<script>
const emailAuthButton = document.getElementById('emailAuthButton');
const collapseExample = document.getElementById('collapseExample');
// 버튼 클릭 이벤트 핸들러
emailAuthButton.addEventListener('click', function() {
  var vrf_email = document.getElementById('email').value;
  alert(vrf_email+'로 인증번호 4자리를 보냈습니다.');
  
  // Ajax로 이메일주소로 인증코드 보내는 서블릿? 그거에 이메일주소를 전달함
  var xhr = new XMLHttpRequest();
  xhr.open("POST", "/sendAuthCode.do", true);  // Spring Controller URL로 요청
  xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");  // POST 데이터 전송
  
  var data = "email=" + encodeURIComponent(vrf_email);
  // 요청이 성공적으로 완료된 후 실행할 콜백 함수
  xhr.onreadystatechange = function() {
      if (xhr.readyState == 4 && xhr.status == 200) {
          alert(xhr.responseText);  // 서버에서 보낸 응답을 표시
      }
  };
  //데이터 전송
  xhr.send(data);
  
  // aria-expanded 속성 값 가져오기
  const isExpanded = emailAuthButton.getAttribute('aria-expanded') === 'true';
  if (!isExpanded) {
    // aria-expanded을 'true'로 변경하여 열림 상태로 설정
    emailAuthButton.setAttribute('aria-expanded', 'true');
    // collapse 클래스 추가하여 해당 div 열기
    collapseExample.classList.add('show');
  }
});
</script>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>
