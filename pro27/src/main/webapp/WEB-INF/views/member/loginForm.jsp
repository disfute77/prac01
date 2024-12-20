<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="result" value="${param.result}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> 로그인 </title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap');
body {
font-family: "Noto Sans KR", sans-serif;
font-optical-sizing: auto;
font-weight: <weight>;
font-style: normal;
background-color: #f8f9fa;
}
.form-container {
    max-width: 400px;
    margin: 0 auto;
    padding: 30px;
    background-color: white;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
</style>
<c:choose>
	<c:when test="${result=='loginFailed' }">
		<script>
			window.onload=function(){
				alert("아이디 혹은 비밀번호 오류 발생.");
			}
		</script>
	</c:when>
</c:choose>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>

<div class="form-container">
    <h2 class="text-center mb-4">로그인</h2>
    <form method="post" action = "${contextPath }/member/login.do">
        <div class="mb-3">
            <label for="id" class="form-label">ID</label>
            <input type="text" class="form-control" id="id" name="id" required>
        </div>
        <div class="mb-3">
            <label for="pwd" class="form-label">PW</label>
            <input type="password" class="form-control" id="pwd" name="pwd" required>
        </div>
        <div class="text-center">
            <button type="submit" class="btn btn-primary">로그인</button>
        </div>
    </form>
</div>

	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>