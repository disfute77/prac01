<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import = "javaBeansPrac.*" %>

<% String id = request.getParameter("cartId");
if (id==null || id.trim().equals("")){
	response.sendRedirect("cart.jsp");
	return;
}

session.invalidate();
response.sendRedirect("cart.jsp");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> 장바구니 전체 삭제 </title>
</head>
<body>

</body>
</html>