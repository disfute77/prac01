<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id = "gameDAO" class="javaBeansPrac.GameRepository" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> 폼 </title>
<link rel="stylesheet" href="../resource/css/form.css">
<style>
#gameid {width:210px;}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../resource/js/gameCheckDupl.js"></script>
<script type="text/javascript" src="../resource/js/gameVali.js"></script>

</head>
<body>
<fmt:setLocale value='<%=request.getHeader("Accept-Language") %>' />
<script>console.log( "콘솔로그 : " + "<%=request.getHeader("Accept-Language") %>" );</script>
<fmt:bundle basename="bundle.message">

	<form action="gameadded.jsp" method="post" name="newGame" enctype="multipart/form-data" accept-charset="utf-8">
		<fieldset>
    <legend>게임 정보 입력</legend>
    <div class="form-biggroup">
	    <div class="form-group">
	        <label for="gameid"> <fmt:message key="gameid"/> </label>
	        <input type="text" id="gameid" name="gameid" autofocus placeholder="<fmt:message key="idplaceholder"/>">
	        <input type="button" value="<fmt:message key="checkdupl"/>" id="checkDupl">
	        <label for="haveCeckDupl"></label>
	        <input type="hidden" value="0" id="haveCheckDupl">
	    </div>
	    <div class="form-group">
	        <label for="name"> <fmt:message key="name"/> </label>
	        <input type="text" id="name" name="name">
	    </div>
	    <div class="form-group">
	        <label for="price"> <fmt:message key="gameprice"/> </label>
	        <input type="number" id="price" name="price" min="0" step="100" value="0" >
	    </div>
	    <div class="form-group">
	        <label> <fmt:message key="mainimg"/> </label>
	        <input type="file" name="mainimg" >
	    </div>
	    <div class="form-group">
	        <label> <fmt:message key="subimg"/> </label>
	        <input type="file" name="subimg1" >
	        <input type="file" name="subimg2">
	        <input type="file" name="subimg3">
	        <input type="file" name="subimg4">
	    </div>
    </div>
    
    <div class="form-biggroup">
	    <div class="form-group">
	        <label for="developer"> <fmt:message key="developer"/> </label>
	        <input type="text" id="developer" name="developer" >
	    </div>
	    <div class="form-group">
	        <label for="publisher"> <fmt:message key="publisher"/> </label>
	        <input type="text" id="publisher" name="publisher">
	    </div>
	    <div class="form-group">
	        <label for="genre"> <fmt:message key="genre"/> </label>
	        <input type="text" id="genre" name="genre">
	    </div>
	    <div class="form-group">
	        <label for="releasedate"> <fmt:message key="releasedate"/> </label>
	        <input type="date" id="releasedate" name="releasedate" >
	    </div>
	    <div class="form-group">
	        <label> <fmt:message key="havedlc"/> </label>
	        <fmt:message key="true"/><input type="radio" value="true" name="havedlc">
	        <fmt:message key="false"/><input type="radio" value="false" name="havedlc" checked>
	    </div>
    </div>
    
    <div class="form-biggroup2">
	    
	        <label for="description"> <fmt:message key="description"/> </label>
	        <textarea id="description" name="description" cols="30" rows="4" placeholder=" <fmt:message key="desplaceholder"/> "></textarea>
	    
	    <div class="form-group">
	        <input type="button" value="<fmt:message key="submitbtn"/>" onclick="gameValiCheck()">
	        <input type="reset" value="<fmt:message key="resetbtn"/>">
	    </div>
    </div>
</fieldset>
	</form>
	</fmt:bundle>
</body>
</html>