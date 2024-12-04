<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>배송 정보</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<%@ include file = "header.jsp" %>
<main class="container mt-5">
    <section>
        <article id="titletext" class="text-left mb-4">
            <h1>배송 정보</h1>
            <p>Shipping Info</p>
        </article>
        
        <article>
            <form action="./processShippingInfo.jsp" method="post" style="width: 300px">
                <input type="hidden" name="cartId" value="<%=request.getParameter("cartId") %>">
                
                <div class="form-group">
                    <label for="name">성명</label>
                    <input type="text" class="form-control" id="name" name="name" required>
                </div>
                
                <div class="form-group">
                    <label for="shippingDate">배송일</label>
                    <input type="text" class="form-control" id="shippingDate" name="shippingDate" placeholder="yyyy/mm/dd" required>
                </div>
                
                <div class="form-group">
                    <label for="country">국가명</label>
                    <input type="text" class="form-control" id="country" name="country" required>
                </div>
                
                <div class="form-group">
                    <label for="zipCode">우편번호</label>
                    <input type="text" class="form-control" id="zipCode" name="zipCode" required>
                </div>
                
                <div class="form-group">
                    <label for="address">주소</label>
                    <input type="text" class="form-control" id="address" name="address" required>
                </div>
                
                <div class="d-flex justify-content-between">
                    <a href="./cart.jsp?cartId=<%=request.getParameter("cartId") %>" class="btn btn-secondary">이전</a>
                    <a href="./cancel.jsp" class="btn btn-danger">취소</a>
                    <input type="submit" class="btn btn-primary" value="등록"/>
                </div>
                
            </form>
        </article>
        
    </section>
</main>
<%@ include file = "footer.jsp" %>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
