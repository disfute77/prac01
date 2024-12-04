<%@page language = "java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import = "java.util.ArrayList" %>
<%@page import = "javaBeansPrac.*" %>
<%@page import = "com.oreilly.servlet.*" %>
<%@page import = "com.oreilly.servlet.multipart.*" %>
<%-- <%@page import = "java.util.*" %> --%>
<%-- <%@page import = "java.io.*" %> --%>
<jsp:useBean id = "gameDAO" class="javaBeansPrac.GameRepository" scope="session"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> 게임 목록 </title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<style>
@import url('https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Black+Han+Sans&family=Do+Hyeon&family=Nanum+Gothic&family=Noto+Sans+KR:wght@100..900&display=swap');
main { margin : 20px auto; }
#titletext {padding :40px;
		font-family: "Noto Sans KR", serif;
		font-optical-sizing: auto;
		font-weight: 900;
		font-style: normal;
		}
</style>
<% 
//반복문으로 처리하는거 보고싶으면 예제를 보샘
MultipartRequest multi = new MultipartRequest(request, "E:\\pracGM\\imgupload", 5*1024*1024, "utf-8", new DefaultFileRenamePolicy());

//받은 각종 파라미터들 보쌈해서 게임객체 필드에 넣는중
Game newGame = new Game();
newGame.setGameId(multi.getParameter("gameid"));
newGame.setName(multi.getParameter("name"));
	String gamePriceStr = multi.getParameter("price");
	int gamePrice = Integer.parseInt(gamePriceStr);
newGame.setGamePrice(gamePrice);
newGame.setDeveloper(multi.getParameter("developer"));
newGame.setPublisher(multi.getParameter("publisher"));
newGame.setGenre(multi.getParameter("genre"));
newGame.setReleaseDate(multi.getParameter("releasedate"));

	String haveDlcStr = multi.getParameter("havedlc");
	boolean haveDlc = Boolean.parseBoolean(haveDlcStr);
newGame.setHaveDlc(haveDlc);
newGame.setDescription(multi.getParameter("description"));

newGame.setMainimg(multi.getFilesystemName("mainimg"));
newGame.setSubimg1(multi.getFilesystemName("subimg1"));
newGame.setSubimg2(multi.getFilesystemName("subimg2"));
newGame.setSubimg3(multi.getFilesystemName("subimg3"));
newGame.setSubimg4(multi.getFilesystemName("subimg4"));

int result = gameDAO.insertGameInfo(newGame);

//이제 int값에 따라 다른메시지 출력하기만하면됨.

%>

</head>
<body>
<%@ include file = "header.jsp" %>

<main>
	
	<section>
		<article id="titletext">
			<h1>게임정보 추가 결과</h1>
			<p>newGameDataResult</p>
		</article>
		<article>
		
<%
String resultMsg;
if(result==1){
	resultMsg = "입력 성공";
} else {
	resultMsg = "입력 실패 - 오류 로그 확인";
}
out.println("<h1>"+resultMsg+"</h1>");	
	
%>
		
		</article>
		
	</section>

</main>

<%@ include file = "footer.jsp" %>
</body>
</html>