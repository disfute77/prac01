<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "javaBeansPrac.*" %>
<%@ page errorPage = "exceptionNoGameId.jsp" %>
<jsp:useBean id = "gameDAO" class="javaBeansPrac.GameRepository" scope="session"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> 게임 상세정보 </title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="../resource/css/gamedetail.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="../resource/js/gamedetail.js"></script>

</head>
<body>
<%@ include file = "header.jsp" %>

<main>
<%String id=request.getParameter("id");
Game thisgame = gameDAO.getGameById(id);%>
	<section>
		<article id="titletext">
			<h1><%=thisgame.getName() %></h1>
			<p>GameInfo</p>
		</article>

		<article class="container-fluid text-left">
			<div id="slider">
			  <a href="#" class="control_next">-&gt;</a>
			  <a href="#" class="control_prev">&lt;-</a>
			  <ul>
			    <li><img src="http://localhost:8081/Prac_MarketProject/img/<%=thisgame.getSubimg1() %>"></li>
			    <li><img src="http://localhost:8081/Prac_MarketProject/img/<%=thisgame.getSubimg2() %>"></li>
			    <li><img src="http://localhost:8081/Prac_MarketProject/img/<%=thisgame.getSubimg3() %>"></li>
			    <li><img src="http://localhost:8081/Prac_MarketProject/img/<%=thisgame.getSubimg4() %>"></li>
			  </ul>  
			</div>
				
			<div id="imganddescription">
			<img src="http://localhost:8081/Prac_MarketProject/img/<%=thisgame.getMainimg() %>" id="gameimg">
				<div id="description">
				<%=thisgame.getDescription() %>
				</div>
			</div>
		</article>
		
		<article id="otherinfo">
			<span class="badge text-bg-primary">가격 : <%=thisgame.getGamePrice() %> 원</span><br>
			<span class="badge text-bg-primary">개발사 : <%=thisgame.getDeveloper() %></span>
			<span class="badge text-bg-primary">배급사 : 
			<% if(thisgame.getPublisher()==null){
				out.print(thisgame.getDeveloper());
			} else {
				out.print(thisgame.getPublisher());
			}	%></span><br>
			<span class="badge text-bg-primary">장르 : 
			<%
			if(thisgame.getGenre()==null){
				out.print("미정");
			} else {
				out.print(thisgame.getGenre());
			}	%></span>
			<span class="badge text-bg-primary">출시일 : <%=thisgame.getReleaseDate() %></span>
			<span class="badge text-bg-primary">DLC유무 : 
			<%
			if(thisgame.getHaveDlc()==false){
				out.print("없음");
			} else {
				out.print("있음");
			}
			%></span>
		</article>
		
		<article>
			<form name="addForm" action="./addCart.jsp?id=<%=thisgame.getGameId() %>" method="POST">
				<a href="#" class="btn btn-info" onclick="addToCart();"> 장바구니에 담기 &raquo;</a>
				<a href="./cart.jsp" class="btn btn-warning">장바구니 &raquo;</a>
				<a href="./gamelist.jsp" class="btn btn-secondary">게임 목록으로 &raquo;</a>
			</form>
		</article>
		
	</section>
</main>

<%@ include file = "footer.jsp" %>
</body>
</html>