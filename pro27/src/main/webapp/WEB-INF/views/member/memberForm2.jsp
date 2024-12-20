<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>회원가입</title>
</head>
<script>
펑션 이메일인증
입력한 이메일을 무슨무슨 서블릿에 보낸다
(서블릿에선 랜덤코드 생성하고 그걸 세션에 저장한다음 입력한 이메일에 보냄)
(그리고 이 페이지로 리디렉트 시키는데 그 서블릿에 보내놨던 id랑 pw 이름 값까지 같이 보내서 자동으로 채워넣음)

펑션 이메일인증확인
입력한 코드를 세션이랑 비교... 자바스크립트에서 안될듯?
입력한 코드를 무슨무슨 서블릿에 보낸다
(서블릿에선 입력한 코드를 세션에 저장된 랜덤코드랑 비교함)
(equal이면 세션에 랜덤코드 키값삭제, 세션에 키 : checkedEmail, 값 : 입력한이메일 로 저장하고 리디렉트시키는데 idpw이름이메일도 같이 자동채워넣기)
(아니면 세션에 랜덤코드 키값삭제, 리디렉트시키는데 idpw이름이메일)

펑션 회원가입
입력한 id, pw, 이름, 이메일을 무슨무슨 서블릿에 보낸다
(서블릿에선 입력한 이메일이 세션에 저장된 체크드이메일이랑 동일한지 비교함)
(equal이면 그대로 회원가입)


</script>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>
회원가입
<form method="post" action="${pageContext.request.contextPath}/member/addMember.do">
	<label for="id">ID</label>
	<input type="text" id="id" name="id" required><br>
	<label for="pwd">PW</label>
	<input type="password" id="pwd" name="pwd" required><br>
	<label for="name">이름</label>
	<input type="text" id="name" name="name" required><br>
	
	<label for="email">이메일</label>
	<input type="email" id="email" name="email" required><br>
	<button id="emailAuthButton" type="button">이메일인증</button><br>
	
	<label for="emailVerifyCode">이메일 인증번호 입력</label>
	<input type="text" id="emailVerifyCode" name="emailVerifyCode" placeholder="메일 확인 후 인증번호 입력"><br>
	<button id="emailVerifyCodeButton" type="button">인증하기</button><br>
	
	<button type="button">가입신청</button>
</form>

<%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>
