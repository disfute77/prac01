<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import = "java.net.URLDecoder" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> 주문 완료 </title>
<link rel="stylesheet" href="./resource/css/base.css">
</head>
<body>
<%@ include file = "header.jsp" %>
<%
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
<main>
	<section>
		<article>
			<h1>주문 완료</h1>
			<p>Order Confirmed</p>
		</article>
		<article>
			<p> 배송시작 예정일 : <%=shipping_shippingDate %> </p>
			<p> 주문번호 : <%=shipping_cartId %> </p> 
		</article>
	</section>
</main>
<%@ include file = "footer.jsp" %>
</body>
</html>

<%
session.invalidate();
for(int i=0; i<cookies.length; i++) {
	Cookie chocoCookie = cookies[i];
	String n = chocoCookie.getName();
	if(n.equals("Shipping_cartId")) chocoCookie.setMaxAge(0);
	if(n.equals("Shipping_name")) chocoCookie.setMaxAge(0);
	if(n.equals("Shipping_shippingDate")) chocoCookie.setMaxAge(0);
	if(n.equals("Shipping_country")) chocoCookie.setMaxAge(0);
	if(n.equals("Shipping_zipCode")) chocoCookie.setMaxAge(0);
	if(n.equals("Shipping_address")) chocoCookie.setMaxAge(0);
	response.addCookie(chocoCookie);
}
%>
