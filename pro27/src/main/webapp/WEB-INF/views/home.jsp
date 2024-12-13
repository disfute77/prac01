<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session = "false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
현재시각 : ${serverTime }

이미지첨부하는법 : <img src="${contextPath}/resource/img/fireelement.webp" alt="logo" width="30" height="30">

<%@ include file="footer.jsp" %>
</body>
</html>