<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
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

        <!-- 이메일 인증 버튼 -->
        <p class="d-inline-flex gap-1">
            <button id="emailAuthButton" class="btn btn-primary" type="button" aria-expanded="false" aria-controls="collapseExample">
                이메일인증
            </button>
        </p>

        <!-- 인증번호 입력 폼 (숨겨져 있음) -->
        <div class="collapse" id="collapseExample">
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
<c:if test="${not empty alert}">
    <script type="text/javascript">
        alert('${alert}');
    </script>
</c:if>

<script>
    const emailAuthButton = document.getElementById('emailAuthButton');
    const collapseExample = document.getElementById('collapseExample');
    const emailVerifyCodeButton = document.getElementById('emailVerifyCodeButton');

    // 이메일 인증번호 발송 버튼 클릭 이벤트
    emailAuthButton.addEventListener('click', function() {
        const vrfEmail = document.getElementById('email').value;

        if (!vrfEmail) {
            alert('이메일을 입력해주세요.');
            return;
        }

        // Ajax로 이메일 주소로 인증코드를 보내는 서블릿에 요청
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "${pageContext.request.contextPath}/sendAuthCode.do", true);  // Spring Controller URL로 요청
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

        var data = "email=" + encodeURIComponent(vrfEmail);
        
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                alert(xhr.responseText);  // 서버에서 보낸 응답을 표시
            }
        };

        xhr.send(data);

        // aria-expanded 속성 값 가져오기
        const isExpanded = emailAuthButton.getAttribute('aria-expanded') === 'true';
        if (!isExpanded) {
            emailAuthButton.setAttribute('aria-expanded', 'true');
            collapseExample.classList.add('show');
        }
    });

    emailVerifyCodeButton.addEventListener('click', function() { // 인증번호 확인 버튼 클릭 이벤트 리스너 추가
        const enteredCode = document.getElementById('emailVerifyCode').value; // 사용자가 입력한 인증번호 값을 가져옵니다.
        if (!enteredCode) { // 인증번호가 입력되지 않은 경우 경고창을 띄우고 함수 종료
            alert('인증번호를 입력해주세요.');  // 인증번호를 입력하라는 메시지 출력
            return;  // 입력이 없으면 이후 코드 실행을 중단
        }
        var xhr = new XMLHttpRequest(); // XMLHttpRequest 객체를 생성하여 AJAX 요청을 준비합니다.
        
        // POST 방식으로 서버의 Spring Controller URL에 요청을 보낼 준비를 합니다.
        xhr.open("POST", "${pageContext.request.contextPath}/verifyAuthCode.do", true);  // Spring Controller URL로 요청
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded"); // 요청 헤더에 Content-Type을 설정, 보내는 데이터가 URL 인코딩된 형태임을 명시
        
        // 서버로 전송할 데이터를 URL 인코딩하여 설정합니다.
        var data = "authCode=" + encodeURIComponent(enteredCode); // 입력한 인증번호를 URL 인코딩해서 전송

        // 서버 응답을 처리하기 위한 onreadystatechange 이벤트 핸들러 설정
        
        // XMLHttpRequest 객체 a에 a.onreadystatechange = function(); 하면
        // 해당 함수가 ajax 요청의 상태(readyState)가 변경될 때마다 호출된다?
        // readyState는 0~4의 정수인데 그중 4는 요청이 완료되고 응답이 수신된 상태를 표시한다?
        // a.readyState가 4dlrh a.status가 200이면 요청완료, 응답수신, 응답성공적인 상태니까
        // xhr.responseText를 쓸수있다?
        
        
        xhr.onreadystatechange = function() {
            // 서버 응답이 완료되었고, 응답 상태가 200(성공)인 경우
            if (xhr.readyState === 4 && xhr.status === 200) {
                alert(xhr.responseText);  // 서버에서 보낸 응답을 alert 창으로 표시
            }
            if (xhr.responseText === "인증번호가 일치합니다. 회원가입을 진행하세요.") {
            	const emailAuthButton = document.getElementById('emailAuthButton');
            	const collapseExample = document.getElementById('collapseExample');
            	const isExpanded = emailAuthButton.getAttribute('aria-expanded') === 'true';
            	if (isExpanded) {
            	    // 버튼이 열려 있으면, 'aria-expanded' 값을 'false'로 설정하여 닫음
            	    emailAuthButton.setAttribute('aria-expanded', 'false');
            	    // collapseExample에서 'show' 클래스를 제거하여 닫음
            	    collapseExample.classList.remove('show');
            	}
            	document.getElementById('emailAuthButton').style.display = 'none';
            	document.getElementById('email').setAttribute('disabled', true);
            }
            
            if (xhr.responseText === "인증을 세 번 실패했습니다. 새로운 인증번호를 발급해 주세요.") {
            	const emailAuthButton = document.getElementById('emailAuthButton');
            	const collapseExample = document.getElementById('collapseExample');
            	const isExpanded = emailAuthButton.getAttribute('aria-expanded') === 'true';
            	if (isExpanded) {
            	    // 버튼이 열려 있으면, 'aria-expanded' 값을 'false'로 설정하여 닫음
            	    emailAuthButton.setAttribute('aria-expanded', 'false');
            	    // collapseExample에서 'show' 클래스를 제거하여 닫음
            	    collapseExample.classList.remove('show');
            	}
            }
            
        };

        // 데이터를 서버로 전송
        xhr.send(data);  // 인증번호 데이터를 서버로 전송
    });

</script>

<%@ include file="/WEB-INF/views/footer.jsp" %>

</body>
</html>
