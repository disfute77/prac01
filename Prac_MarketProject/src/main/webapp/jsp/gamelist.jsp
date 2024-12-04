<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "javaBeansPrac.Game" %>

<jsp:useBean id = "gameDAO" class="javaBeansPrac.GameRepository" scope="session"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> 게임 목록 </title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<style>
@import url('https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Black+Han+Sans&family=Do+Hyeon&family=Nanum+Gothic&family=Noto+Sans+KR:wght@100..900&display=swap');

main {margin : 20px auto; min-height : 300px;}
#titletext {padding :40px;
		font-family: "Noto Sans KR", serif;
		font-optical-sizing: auto;
		font-weight: 900;
		font-style: normal;
		}

#detail {float:right; margin-top:10px; margin-right: 20px;}
</style>
</head>
<body>
<%@ include file = "header.jsp" %>

<main>
	<section>
		<article id="titletext">
			<h1>나만의 GOTY</h1>
			<p>Gamelist</p>
		</article>
		
		<%ArrayList<Game> Games = gameDAO.getSomeGames();%>
		
		<article class="container text-left">
			<div class="row">
				<%
				for(int i=0; i<Games.size(); i++) {
							Game goods = Games.get(i);
				%>
				<div class="col">
					<img src="http://localhost:8081/Prac_MarketProject/img/<%=goods.getMainimg()%>" width= "400px" height= "187px">
					<div id="detail"><a href="./gamedetail.jsp?id=<%=goods.getGameId() %>" class="btn btn-secondary" role="button"> 상세정보 &raquo;</a></div>
					<h4 class="mt-2"><strong><%=goods.getName() %></strong></h4>
					
					<p>가격 : <%=goods.getGamePrice() %>원<br>
					<div style="text-align : center; max-width:400px; margin-bottom: 20px;"><%=goods.getDescription() %></div>
				</div>
				<% } %>
				
				<%
				int listPlaceholder = (3-Games.size()%3 )%3; 
				for(int i=0; i<listPlaceholder; i++) {
				%>
				<div class="col"></div>
				<% } %>
				
			</div>
		</article>
		
	</section>

</main>

<%@ include file = "footer.jsp" %>
</body>
</html>