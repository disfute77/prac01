<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> 페이지 오류</title>
</head>
<body>
<%@ include file = "header.jsp" %>
<h1>요청하신 페이지를 찾을 수 없습니다..</h1>
<p><%=request.getRequestURL() %>?<%=request.getQueryString() %></p>
<%@ include file = "footer.jsp" %>
</body>
</html>