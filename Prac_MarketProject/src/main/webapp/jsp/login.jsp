<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> 로그인 폼</title>
</head>
<body>
	<% String error = request.getParameter("error");
	if(error!=null) {
		out.println("<div> 아이디와 비밀번호를 확인해 주세요 </div>");
	}
	%>
	<form name="loginForm" action="j_security_check" method="post">
		<p> ID : <input type="text" name="j_username">
		<p> PW : <input type="password" name="j_password">
		<p> <input type="submit" value="로그인">
	</form>
</body>
</html>