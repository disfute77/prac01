<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> ㅇㅇ </title>
</head>
<body>
	<% request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id"); 
	String pw = request.getParameter("pw");%> 
	<p> 입력된 id값 : <%=id %>
	<p> 입력된 pw값 : <%=pw %>
	<h1> 로그인 성공 여부 : ${msg }</h1>
</body>
</html>