<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
    <h1>회원목록</h1>
    <table>
        <tr>
            <th>ID</th>
            <th>PW</th>
            <th>이름</th>
            <th>메일</th>
            <th>가입일</th>
            <th>수정</th>
            <th>삭제</th>
        </tr>

        <c:forEach var="member" items="${membersList}">
            <tr>
                <td>${member.id}</td>
                <td>${member.pwd}</td>
                <td>${member.name}</td>
                <td>${member.email}</td>
                <td>${member.joinDate}</td>
                <td><a href="${pageContext.request.contextPath}/member/modMember.do?id=${member.id}">수정</a></td>
                <td><a href="${pageContext.request.contextPath}/member/removeMember.do?id=${member.id}">삭제</a></td>
            </tr>
        </c:forEach>
    </table>

    <div class="link-container">
        
        <p><a class="button" href="${pageContext.request.contextPath}/member/memberForm.do">회원가입</a></p>
    </div>
</body>
</html>