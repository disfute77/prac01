<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>헤더</title>
<style>

header p {text-align: right; margin : 0;}
header navbar-brand {position: relative;}
#logotext {position: absolute; top: 13px; left: 50px;}

</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>

<header>

	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid">
			<a class="navbar-brand" href="./welcome_EXE.jsp">
			<img src="http://localhost:8081/Prac_MarketProject/img/fireelement.webp" alt="Logo" width="30" height="30" class="d-inline-block align-text-top">
			</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
		<ul class="navbar-nav">
		<li class="nav-item">
		<a class="nav-link active" aria-current="page" href="./welcome_EXE.jsp">메인</a>
		</li>
		<li class="nav-item">
		<a class="nav-link" href="./gamelist.jsp">게임 목록</a>
		</li>
		<li class="nav-item">
		<a class="nav-link" href="./gameadd.jsp">게임 추가</a>
		</li>
		<li class="nav-item">
		<a class="nav-link disabled" aria-disabled="true">개발중</a>
		</li>
		</ul>
		</div>
		</div>
	</nav>
	
	<%@ page import = "java.text.*" %>
	<%@ page import = "java.util.*" %>
	<% SimpleDateFormat nf = new SimpleDateFormat("yyyy-MM-dd (E)", Locale.KOREA); %>
	<% String now = nf.format(new Date()); %>
	<p> <%=now %></p>
</header>

</body>
</html>