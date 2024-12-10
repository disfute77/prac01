<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> 회원가입 </title>
</head>
<body>
	<form method = "post" action="${pageContext.request.contextPath }/member/addMember.do">
		<h2> 회원가입 </h2>
		<table>
			<tr>
			<td width = "100"> ID  </td>
			<td width = "200"><input type = "text" name = "id"> </td>
			</tr>
			<tr>
			<td width = "100"> PW  </td>
			<td width = "200"><input type = "text" name = "pwd"> </td>
			</tr>
			<tr>
			<td width = "100"> 이름  </td>
			<td width = "200"><input type = "text" name = "name"> </td>
			</tr>
			<tr>
			<td width = "100"> 이메일  </td>
			<td width = "200"><input type = "text" name = "email"> </td>
			</tr>
			<tr>
			<td style = "text-align:center" colspan="4">
			</td>
			<tr>
		</table>
		<input type = "submit" value="가입신청" >
	</form>
</body>
</html>