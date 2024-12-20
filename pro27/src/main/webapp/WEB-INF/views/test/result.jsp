<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<h1> 업로드 완료 </h1>
<label>아이디:</label>
<input type = "text" name = "id" value = "${map.id }" readonly><br>
<label>이름:</label>
<input type= "text" name = "name" value = "${map.name }" readonly><br> 

<div class = "result-images">
<c:forEach var="imageFileName" items="${map.fileList}">
	<img src="${contextPath }/download.do?imageFileName=${imageFileName}">
	<br><br>
</c:forEach>
</div>

<div class = "result-images-thumbnail">
<c:forEach var="imageFileName" items="${map.fileList}">
	<img src="${contextPath }/downloadT.do?imageFileName=${imageFileName}">
	<br><br>
</c:forEach>
</div>


<a href='${contextPath }/form.do'> 추가 업로드 </a>

</body>
</html>