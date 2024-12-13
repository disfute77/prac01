<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>회원정보 수정</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
    
    <style>
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
        .form-container h1 {
            text-align: center;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>
    <div class="form-container">
        <h1>회원정보 수정</h1>
        <form method="post" action="${pageContext.request.contextPath}/member/updateMember.do">
            <div class="mb-3">
                <label for="id" class="form-label">기준 ID</label>
                <input type="text" class="form-control" id="id" name="id" value="<%out.print(request.getParameter("id")); %>" readonly>
            </div>
            <div class="mb-3">
                <label for="pwd" class="form-label">PW</label>
                <input type="password" class="form-control" id="pwd" name="pwd">
            </div>
            <div class="mb-3">
                <label for="name" class="form-label">이름</label>
                <input type="text" class="form-control" id="name" name="name">
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">이메일</label>
                <input type="email" class="form-control" id="email" name="email">
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-primary">정보수정</button>
            </div>
        </form>
    </div>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>
