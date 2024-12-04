<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> 바디 </title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Black+Han+Sans&family=Do+Hyeon&family=Nanum+Gothic&family=Noto+Sans+KR:wght@100..900&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Black+Han+Sans&family=Do+Hyeon&family=Nanum+Gothic&family=Noto+Sans+KR:wght@900&display=swap');

main {margin : 20px auto; min-height : 300px;}
#titletext {padding :40px;
		font-family: "Noto Sans KR", serif;
		font-optical-sizing: auto;
		font-weight: 900;
		font-style: normal;
}
#titletext h1 {font-weight: bold; margin-bottom: 20px;}
#welcome2 {text-align: center;}
#start {text-align: center;}
</style>
</head>
<body>
<%@ include file = "header.jsp" %>
<main>
	<section>
		<article id="titletext">
			<h1>Someone's Game Archive</h1>
			<p>Puzzle &amp; Simulation</p>
			
		</article>
		<article id="welcome2">
			<h3>숨겨진 보석같은 게임을 발굴합니다.</h3>
		</article>
		
		<article id="start">
			<a href="./gamelist.jsp"><img src="http://localhost:8081/Prac_MarketProject/img/button_start1.png"></a>
		</article>
		
	</section>
</main>
<%@ include file = "footer.jsp" %>
</body>
</html>