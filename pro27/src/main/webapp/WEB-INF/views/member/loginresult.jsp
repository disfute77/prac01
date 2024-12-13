<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<h1>아이디 : ${userID}</h1>
<h2>이름 : ${userName}</h2>
<h3>이메일 : ${email }</h3>

<p>Map info 사용한경우

<h1>아이디 : ${info.userID}</h1>
<h2>이름 : ${info.userName}</h2>
<h3>이메일 : ${info.email}</h3>

<h1>결과 : ${result }</h1>
<h2>로그인시도아디 : ${idpw.id}</h2>
<h2>로그인시도비번 : ${idpw.pwd}</h2>

</body>
</html>