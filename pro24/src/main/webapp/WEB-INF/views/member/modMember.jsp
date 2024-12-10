<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>회원정보수정</title>
    <style>
        
    </style>
</head>
<body>

    <form method="post" action="${pageContext.request.contextPath}/member/updateMember.do">
        <h1>회원정보 수정</h1>
        <table>
            <tr>
                <td><p align="right">기준 ID</p></td>
                <td><input type="text" name="id" value="<%out.print(request.getParameter("id")); %>" readonly></td>
            </tr>
            <tr>
                <td><p align="right">PW</p></td>
                <td><input type="text" name="pwd"></td>
            </tr>
            <tr>
                <td><p align="right">이름</p></td>
                <td><input type="text" name="name"></td>
            </tr>
            <tr>
                <td><p align="right">이메일</p></td>
                <td><input type="text" name="email"></td>
            </tr>
        </table>
        <input type="submit" value="정보수정" />
    </form>

</body>
</html>
