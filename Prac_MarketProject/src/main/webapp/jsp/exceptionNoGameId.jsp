<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>게임ID 오류</title>
</head>
<body>
<%@ include file = "header.jsp" %>
<h1>해당 게임이 존재하지 않습니다.</h1>
<p><%=request.getRequestURL() %>?<%=request.getQueryString() %></p>
<%@ include file = "footer.jsp" %>
</body>
</html>