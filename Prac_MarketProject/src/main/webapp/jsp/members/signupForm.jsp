<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> 회원가입 폼 </title>
<link rel="stylesheet" href="../../resource/css/form.css">
<style>
fieldset {width: 300px;}
#memberId {width:210px;}
</style>
<script type="text/javascript" src="../../resource/js/memberInfoVali.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../../resource/js/memberIdCheckDupl.js"></script>
</head>
<body>
	<form action="signup_process.jsp" method="post" name="signup">
		<fieldset>
    <legend>회원가입</legend>
    <div class="form-biggroup">
	    <div class="form-group">
	        <label for="memberId"> 아이디 </label>
	        <input type="text" id="memberId" name="memberId" autofocus placeholder="중복검사 필수">
	        <input type="button" value="중복검사" id="checkDupl">
	        <label for="haveCeckDupl"></label>
	        <input type="hidden" value="0" id="haveCheckDupl">
	    </div>
	    <div class="form-group">
	        <label for="memberPw"> 비밀번호 </label>
	        <input type="password" id="memberPw" name="memberPw">
	    </div>
	    <div class="form-group">
	        <label for="memberName"> 성함 </label>
	        <input type="text" id="memberName" name="memberName">
	    </div>
	    <div class="form-group">
	        <label for="memberSex"> 성별 </label>
	        남성 <input type="radio" value="male" name="memberSex">
	        여성 <input type="radio" value="female" name="memberSex">
	        기타 <input type="radio" value="other" name="memberSex" checked>
	    </div>
	    <div class="form-group">
	        <label for="memberBirth"> 생년월일 </label>
	        <input type="date" id="memberBirth" name="memberBirth">
	    </div>
	    <div class="form-group">
	        <label for="memberPhone"> 전화번호 </label>
	        <input type="text" id="memberPhone" name="memberPhone" placeholder="-은 빼고 입력해주세요">
	    </div>
	    <div class="form-group">
	        <label for="memberMail"> 이메일 </label>
	        <input type="text" id="memberMail" name="memberMail">
	    </div>
	    <div class="form-group">
	        <label for="memberAddress"> 주소 </label>
	        <input type="text" id="memberAddress" name="memberAddress">
	    </div>
	    <div class="form-group">
	        <input type="button" value="회원가입" onclick="memberInfoValiCheck()">
	        <input type="reset" value="초기화">
	    </div>
    </div>
		</fieldset>
	</form>
	
</body>
</html>