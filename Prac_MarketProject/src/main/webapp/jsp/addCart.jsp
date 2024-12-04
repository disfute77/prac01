<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "javaBeansPrac.*" %>

<% 
// 클라이언트의 요청에서 "id" 파라미터를 가져옴
String id = request.getParameter("id");

// "id"가 null이거나 빈 문자열인 경우
if (id == null || id.trim().equals("")) {
    // 사용자를 "gamelist.jsp"로 리다이렉트
    response.sendRedirect("./gamelist.jsp");
    return; // 메서드 종료
}

// GameRepository 객체 생성
GameRepository dao = new GameRepository();

// "id"에 해당하는 게임 정보를 조회
Game game = dao.getGameById(id);

// 게임이 존재하지 않는 경우
if (game == null) {
    // 사용자를 "exceptionNoGameId.jsp"로 리다이렉트
    response.sendRedirect("./exceptionNoGameId.jsp");
}

// 추천 게임 목록을 가져옴
ArrayList<Game> goodsList = dao.getSomeGames();
Game goods = new Game();

// 추천 게임 목록에서 "id"와 일치하는 게임을 찾음
for (int i = 0; i < goodsList.size(); i++) {
    goods = goodsList.get(i);
    if (goods.getGameId().equals(id)) {
        break; // 게임을 찾으면 반복문 종료
    }
}

// 세션에서 장바구니 리스트를 가져옴
ArrayList<Game> list = (ArrayList<Game>) session.getAttribute("cartlist");

// 장바구니 리스트가 null인 경우 새로 생성
if (list == null) {
    list = new ArrayList<Game>();
    // 세션에 장바구니 리스트 저장
    session.setAttribute("cartlist", list);
}

// 장바구니에 이미 추가된 게임의 수량을 체크
int cnt = 0;
Game goodsQnt = new Game();
for (int i = 0; i < list.size(); i++) {
    goodsQnt = list.get(i);
    // 장바구니에 있는 게임의 ID와 요청한 ID가 일치하는 경우
    if (goodsQnt.getGameId().equals(id)) {
        cnt++; // 카운트 증가
        // 수량을 1 증가시킴
        int orderQuantity = goodsQnt.getQuantity() + 1;
        goodsQnt.setQuantity(orderQuantity);
    }
}

// 장바구니에 게임이 없었던 경우
if (cnt == 0) {
    // 새로운 게임 객체의 수량을 1로 설정
    goods.setQuantity(1);
    // 장바구니에 게임 추가
    list.add(goods);
}

// 사용자를 "gamedetail.jsp"로 리다이렉트하여 게임 상세 정보를 보여줌
response.sendRedirect("gamedetail.jsp?id=" + id);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>장바구니</title>
</head>
<body>

</body>
</html>