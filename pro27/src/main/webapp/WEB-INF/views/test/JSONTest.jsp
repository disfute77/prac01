<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(function() {
	$("#checkJson").click(function(){
		const _id = $("#id").val();
		const _pwd = $("#pwd").val();
		const _name = $("#name").val();
		const _email = $("#email").val();
		var member = { id:_id, name:_name, pwd:_pwd, email:_email};
		$.ajax({
			type:"post",
			url:'${contextPath}/test/info.do',
			contentType:"application/json",
			data:JSON.stringify(member),
			success:function(data,textStatus){},
			error:function(data,textStatus){
				alert("에러발생");
			},
			complete:function(data,textStatus){}
		});	
	});
});
</script>
</head>
<body>
	아디<input type="text" id="id"></input><br>
	비번<input type="text" id="pwd"></input><br>
	이름<input type="text" id="name"></input><br>
	메일<input type="text" id="email"></input><br>
	
	<input type="button" id="checkJson" value="눌러" /><br><br>
	<div id="outpout"></div>
</body>
</html>