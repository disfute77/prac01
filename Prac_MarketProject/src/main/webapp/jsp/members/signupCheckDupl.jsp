<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="dao.*" %>
<%
    String id = request.getParameter("id");
    
	MemberJanitor mj = MemberJanitor.getInstance();
	int r = mj.isDupl(id);
	
	out.print(r);
	
//     if (r==1) {
//         out.print("이미 존재하는 게임ID입니다.");
//     } else if (r==0) {
//         out.print("사용 가능한 게임ID입니다.");
//     } else {
//     	out.print("sql 오류가 발생했습니다.");
//     }
%>
