<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import = "java.net.URLEncoder" %>
<% request.setCharacterEncoding("utf-8");
Cookie cartId = new Cookie("Shipping_cartId", URLEncoder.encode(request.getParameter("cartId"), "utf-8"));
Cookie name = new Cookie("Shipping_name", URLEncoder.encode(request.getParameter("name"), "utf-8"));
Cookie shippingDate = new Cookie("Shipping_shippingDate", URLEncoder.encode(request.getParameter("shippingDate"), "utf-8"));
Cookie country = new Cookie("Shipping_country", URLEncoder.encode(request.getParameter("country"), "utf-8"));
Cookie zipCode = new Cookie("Shipping_zipCode", URLEncoder.encode(request.getParameter("zipCode"), "utf-8"));
Cookie address = new Cookie("Shipping_address", URLEncoder.encode(request.getParameter("address"), "utf-8"));
cartId.setMaxAge(60);
name.setMaxAge(60);
shippingDate.setMaxAge(60);
country.setMaxAge(60);
zipCode.setMaxAge(60);
address.setMaxAge(60);
response.addCookie(cartId);
response.addCookie(name);
response.addCookie(shippingDate);
response.addCookie(country);
response.addCookie(zipCode);
response.addCookie(address);
response.sendRedirect("orderConfirmation.jsp");
%>