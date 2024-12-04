<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> ㅇㅇ </title>
</head>
<body>
	<% request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name"); %> 
	<p> 입력된 name값 : <%=name %>
</body>
</html>