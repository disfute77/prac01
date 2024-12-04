<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.net.URLDecoder" %>
<%@ page import = "javaBeansPrac.*" %>
<% request.setCharacterEncoding("utf-8");
String cartId=session.getId();
String shipping_cartId="";
String shipping_name="";
String shipping_shippingDate="";
String shipping_country="";
String shipping_zipCode="";
String shipping_address="";

Cookie[] cookies=request.getCookies();

if(cookies!=null) {
	for (int i=0; i < cookies.length; i++){
		Cookie chocoCookie = cookies[i];
		String n = chocoCookie.getName();
		if(n.equals("Shipping_cartId")) shipping_cartId = URLDecoder.decode(chocoCookie.getValue(), "utf-8");
		if(n.equals("Shipping_name")) shipping_name = URLDecoder.decode(chocoCookie.getValue(), "utf-8");
		if(n.equals("Shipping_shippingDate")) shipping_shippingDate = URLDecoder.decode(chocoCookie.getValue(), "utf-8");
		if(n.equals("Shipping_country")) shipping_country = URLDecoder.decode(chocoCookie.getValue(), "utf-8");
		if(n.equals("Shipping_zipCode")) shipping_zipCode = URLDecoder.decode(chocoCookie.getValue(), "utf-8");
		if(n.equals("Shipping_address")) shipping_address = URLDecoder.decode(chocoCookie.getValue(), "utf-8");
	}
}%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> 주문 정보</title>
<link rel="stylesheet" href="./resource/css/base.css">
</head>
<body>
<main>
	<section>
		<article>
			<h1>주문 정보</h1>
			<p>Order Info</p>
		</article>
	</section>
	
	<section>
		<article>
			<h1>영수증</h1>
		</article>
		<article>
			<strong>배송 주소</strong><br> 
			성명 : <%=shipping_name %><br>
			주소 : <%=shipping_address %><br>
			우편번호 : <%=shipping_zipCode %><br>
		</article>
		<article>
			<em>배송일 : <%=shipping_shippingDate %></em>
		</article>
		
		<article>
			<table>
			<tr>
			<th>도서</th>
			<th>#</th>
			<th>가격</th>
			<th>소계</th>
			</tr>
			<%
			int sum=0;
			ArrayList<Game> cartList = (ArrayList<Game>) session.getAttribute("cartlist");
			if (cartList==null) cartList = new ArrayList<Game>();
			for (int i=0; i<cartList.size(); i++){
				Game game = cartList.get(i);
				int total = game.getGamePrice() * game.getQuantity();
				sum = sum + total;
			%>
			<tr>
			<td><%=game.getName() %></td>
			<td><%=game.getQuantity() %></td>
			<td><%=game.getGamePrice() %></td>
			<td><%=total %> 원</td>
			</tr>
			<%}%>
			<tr>
			<td></td>
			<td></td>
			<td><strong>총액 : </strong></td>
			<td><strong><%=sum %></strong></td>
			</tr>
			</table>
			
			<a href="./shippingInfo.jsp?cartId=<%=shipping_cartId %>">배송정보 재작성</a>
			<a href="./thank.jsp"> 주문 완료 </a>
			<a href="./cancel.jsp"> 취소 </a>
			
		</article>
	</section>
	
	
	
</main>
</body>
</html>