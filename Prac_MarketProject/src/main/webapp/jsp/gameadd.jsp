<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "javaBeansPrac.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> 게임 추가 </title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<style>
@import url('https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Black+Han+Sans&family=Do+Hyeon&family=Nanum+Gothic&family=Noto+Sans+KR:wght@100..900&display=swap');
main { margin : 20px auto; }
#titletext {padding :40px;
		font-family: "Noto Sans KR", serif;
		font-optical-sizing: auto;
		font-weight: 900;
		font-style: normal;
		}
</style>
</head>
<body>
<%@ include file = "header.jsp" %>

<main>
	
	<section>
		<article id="titletext">
			<h1>게임정보 추가</h1>
			<p>newGameData</p>
		</article>
		<%@ include file = "gameaddform.jsp" %>
	</section>
</main>

<%@ include file = "footer.jsp" %>
</body>
</html>