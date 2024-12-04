<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> 배송 정보 </title>
<link rel="stylesheet" href="./resource/css/base.css">
</head>
<body>
<%@ include file = "header.jsp" %>
<main>
	<section>
		<article id="titletext">
			<h1>배송 정보</h1>
			<p>Shipping Info</p>
		</article>
		
		<article>
			<form action="./processShippingInfo.jsp" method="post">
				<input type = "hidden" name = "cartId" value = "<%=request.getParameter("cartId") %> ">
				
				<div>
					<label>성명</label>
					<div>
						<input type="text" name="name">
					</div>
				</div>
				
				<div>
					<label>배송일</label>
					<div>
						<input type="text" name="shippingDate">(yyyy/mm/dd)
					</div>
				</div>
				
				<div>
					<label>국가명</label>
					<div>
						<input type="text" name="country">
					</div>
				</div>
				
				<div>
					<label>우편번호</label>
					<div>
						<input type="text" name="zipCode">
					</div>
				</div>
				
				<div>
					<label>주소</label>
					<div>
						<input type="text" name="address">
					</div>
				</div>
				
				<div>
					<div>
						<a href="./cart.jsp?cartId=<%=request.getParameter("cartId") %>">이전</a>
						<input type="submit" value="등록"/>
						<a href="./cancel.jsp">취소</a>
					</div>
				</div>
				
			</form>
		</article>
		
	</section>
</main>
<%@ include file = "footer.jsp" %>
</body>
</html>