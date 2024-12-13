<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>회원 목록</title>
    
    <!-- 부트스트랩 CSS 추가 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- 스타일 추가 (옵션) -->
    <style>

		@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap');

        body {
          font-family: "Noto Sans KR", sans-serif;
		  font-optical-sizing: auto;
		  font-weight: <weight>;
		  font-style: normal;
		  background-color: #f8f9fa;
        }
        .table th { background-color: yellow;}
        .table th, .table td {
            vertical-align: middle;
            text-align: center;
        }
        .link-container {
            text-align: right;
            margin-top: 20px;
        }
        .button {
            text-decoration: none;
        }
    </style>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>

    <div class="container mt-5">
        <h1 class="text-center mb-4"> 회원 목록 </h1>
        <table class="table table-striped table-bordered table-hover">
            <thead class="thead-dark">
                <tr>
                    <th>ID</th>
                    <th>PW</th>
                    <th>이름</th>
                    <th>메일</th>
                    <th>가입일</th>
                    <th>수정</th>
                    <th>삭제</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="member" items="${membersList}">
                    <tr>
                        <td>${member.id}</td>
                        <td>${member.pwd}</td>
                        <td>${member.name}</td>
                        <td>${member.email}</td>
                        <td>${member.joinDate}</td>
                        <td><a href="${pageContext.request.contextPath}/member/modMember.do?id=${member.id}" class="btn btn-warning btn-sm">수정</a></td>
                        <td><a href="${pageContext.request.contextPath}/member/removeMember.do?id=${member.id}" class="btn btn-danger btn-sm">삭제</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <div class="link-container">
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/member/memberForm.do">회원가입</a>
        </div>
    </div>

    <!-- 부트스트랩 JS와 Popper.js 추가 -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
    
<%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>
