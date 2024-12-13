<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>MAIN</title>
</head>
<body>
<%@ include file="./common/Navbar.jsp"%>

<main>
	<section>
		<article>
			<h1>메인화면임</h1>
			<h2>백엔드끝날때까지 css는한줄도안쓸거임</h2>
			<h3>오늘은 <%= Calendar.getInstance().getTime() %></h3>
		</article>
	</section>
</main>

<%@ include file="./common/Footer.jsp"%>
</body>
</html>