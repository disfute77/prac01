<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> 로그인 실패 </title>
</head>
<body>
	로그인 실패
	<% response.sendRedirect("login.jsp?error=1"); %>
</body>
</html>