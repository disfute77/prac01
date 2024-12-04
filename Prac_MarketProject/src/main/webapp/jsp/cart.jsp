<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "javaBeansPrac.*" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>장바구니</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>

<% String cartId = session.getId(); %>

<body>
<%@ include file = "header.jsp" %>

<main class="container mt-5">
    <section>
        <article>
            <h1 class="text-center">장바구니</h1>
            <p class="text-center">Cart</p>
        </article>
        
        <article class="mb-4">
            <div class="d-flex justify-content-between">
                <a href="./deleteCart.jsp?cartId=<%=cartId %>" class="btn btn-danger">삭제하기</a>
                <a href="./shippingInfo.jsp?cartId=<%=cartId %>" class="btn btn-success">주문하기</a>
            </div>
        </article>
        
        <article>
            <table class="table table-hover">
                <thead class="thead-dark">
                    <tr>
                        <th>게임</th>
                        <th>가격</th>
                        <th>수량</th>
                        <th>소계</th>
                        <th>비고</th>
                    </tr>
                </thead>
                <tbody>
                    <% int sum = 0;
                    ArrayList<Game> cartList = (ArrayList<Game>) session.getAttribute("cartlist");
                    if (cartList == null) cartList = new ArrayList<Game>();
                    for (int i = 0; i < cartList.size(); i++) {
                        Game game = cartList.get(i);
                        int total = game.getGamePrice() * game.getQuantity();
                        sum += total;
                    %>		
                    <tr>
                        <td><%= game.getGameId() %> - <%= game.getName() %></td>
                        <td><%= game.getGamePrice() %></td>
                        <td><%= game.getQuantity() %></td>
                        <td><%= total %></td>
                        <td><a href="./removeCart.jsp?id=<%= game.getGameId() %>" class="btn btn-danger btn-sm">삭제</a></td>
                    </tr>
                    <% } %>		
                    
                    <tr class="font-weight-bold">
                        <td colspan="3" class="text-right">총액</td>
                        <td><%= sum %></td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
            <a href="./gamelist.jsp" class="btn btn-secondary"> &laquo; 쇼핑 계속하기</a> 
        </article>
        
    </section>
</main>

<%@ include file = "footer.jsp" %>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
