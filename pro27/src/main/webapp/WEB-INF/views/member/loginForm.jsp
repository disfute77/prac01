<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action = "${contextPath }/member/login.do">
	로그인5방식 사용중<br>
	아이디<input type = "text" name = "id" size = "10" /><br>
	비번<input type = "text" name = "pwd" size = "10" /><br>
	
	<input type = "submit" value = "눌러" />
	<input type = "reset" value = "누르지마" />
	</form>
	
</body>
</html>