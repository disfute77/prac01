<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "javaBeansPrac.*" %>

<% String id = request.getParameter("id");
if (id==null || id.trim().equals("")){
	response.sendRedirect("gamelist.jsp");
	return;
}

GameRepository dao = new GameRepository();

Game game = dao.getGameById(id);
if (game == null) {
	response.sendRedirect("exceptionNoGameID.jsp");
}

ArrayList<Game> cartList = (ArrayList<Game>) session.getAttribute("cartlist");
Game goodsQnt = new Game();
for (int i=0; i<cartList.size(); i++){
	goodsQnt = cartList.get(i);
	if(goodsQnt.getGameId().equals(id)){
		cartList.remove(goodsQnt);
	}
}

response.sendRedirect("cart.jsp");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> 장바구니 게임 삭제 </title>
</head>
<body>

</body>
</html>