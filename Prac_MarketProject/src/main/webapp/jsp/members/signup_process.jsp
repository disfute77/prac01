<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="dto.Member" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>회원가입 결과</title>
</head>
<body>
    <h1>회원가입 정보</h1>

    <jsp:useBean id="memberInfo" class="dto.Member" scope="request" />
    <% request.setCharacterEncoding("utf-8"); %>
    <jsp:setProperty name="memberInfo" property="id" value="<%= request.getParameter(\"memberId\") %>" />
    <jsp:setProperty name="memberInfo" property="pw" value="<%= request.getParameter(\"memberPw\") %>" />
    <jsp:setProperty name="memberInfo" property="name" value="<%= request.getParameter(\"memberName\") %>" />
    <jsp:setProperty name="memberInfo" property="sex" value="<%= request.getParameter(\"memberSex\") %>" />
    <jsp:setProperty name="memberInfo" property="birth8" value="<%= request.getParameter(\"memberBirth\") %>" />
    <jsp:setProperty name="memberInfo" property="phone" value="<%= request.getParameter(\"memberPhone\") %>" />
    <jsp:setProperty name="memberInfo" property="mail" value="<%= request.getParameter(\"memberMail\") %>" />
    <jsp:setProperty name="memberInfo" property="address" value="<%= request.getParameter(\"memberAddress\") %>" />

    <!-- 입력된 회원 정보를 화면에 출력 -->
    <h2>입력된 회원 정보</h2>
    <p>아이디: <%= memberInfo.getId() %></p>
    <p>비밀번호: <%= memberInfo.getPw() %></p>
    <p>성함: <%= memberInfo.getName() %></p>
    <p>성별: <%= memberInfo.getSex() %></p>
    <p>생년월일: <%= memberInfo.getBirth8() %></p>
    <p>전화번호: <%= memberInfo.getPhone() %></p>
    <p>이메일: <%= memberInfo.getMail() %></p>
    <p>주소: <%= memberInfo.getAddress() %></p>
</body>
</html>
