<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "javaBeansPrac.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>장바구니</title>
</head>

<% String cartId = session.getId(); %>

<body>
<%@ include file = "header.jsp" %>

<main>
	<section>
		<article>
			<h1>장바구니</h1>
			<p>Cart</p>
		</article>
		
		<article>
			<div>
				<table width="100%">
				<tr>
					<td align="left"><a href="./deleteCart.jsp?cartId=<%=cartId %>" class="btn btn-danger">삭제하기</a></td>
					<td align="right"><a href="./shippingInfo.jsp?cartId=<%=cartId %>" class="btn btn-success"> 주문하기</a></td>
				</tr>
				</table>				
			</div>
		</article>
		
		<article>
			<table class="table table-hover">
				<tr>
					<th>게임
					<th>가격
					<th>수량
					<th>소계
					<th>비고
				</tr>
				<% int sum = 0;
				ArrayList<Game> cartList = (ArrayList<Game>) session.getAttribute("cartlist");
				if(cartList==null) cartList = new ArrayList<Game>();
				for (int i=0; i<cartList.size(); i++){
					Game game = cartList.get(i);
					int total = game.getGamePrice() * game.getQuantity();
					sum = sum + total;
				%>		
				<tr>
				<td><%=game.getGameId() %> - <%=game.getName() %></td>
				<td><%=game.getGamePrice() %></td>
				<td><%=game.getQuantity() %></td>
				<td><%=total %></td>
				<td><a href="./removeCart.jsp?id=<%=game.getGameId() %>">삭제</a></td>
				</tr>
				<% } %>		
				
				<tr>
				<th></th>
				<th></th>
				<th>총액</th>
				<th><%=sum %></th>
				<th></th>
				</tr>
			</table>
			<a href="./gamelist.jsp" class="btn btn-secondary"> &laquo; 쇼핑 계속하기</a> 
		</article>
		
	</section>

</main>

<%@ include file = "footer.jsp" %>
</body>
</html>