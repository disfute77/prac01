function memberInfoValiCheck() {
    const id = document.getElementById("memberId");
    const haveCheckDupl = document.getElementById("haveCheckDupl");
    const pw = document.getElementById("memberPw");
    const name = document.getElementById("memberName");
    const sex = document.getElementById("memberSex");
    const birth = document.getElementById("memberBirth");
    const phone = document.getElementById("memberPhone");
    const mail = document.getElementById("memberMail");
    const address = document.getElementById("memberAddress");
    
    function checkVali(regExp, e, msg) {
        if (regExp.test(e.value)) return true;
        alert(msg);
        e.focus();
        return false;
    }
    
    const regExpId = new RegExp("^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9]{4,}$");
    if(!checkVali(regExpId, id, "아이디는 영어와 숫자로 조합된 4자리 이상 문자열이어야 합니다.")) return false;
   
	if(haveCheckDupl.value==0){
		alert("아이디 중복체크를 실행해 주세요.");
		return false;
	}
   	const regExpPw = new RegExp("^[0-9]{4,}$");
   	if(!checkVali(regExpPw, pw, "비밀번호는 숫자로만 작성해야 하며 4자리 이상이어야 합니다.")) return false;
   
    if(name.value.length < 2) {
        alert("이름은 최소 2글자 이상 입력하세요.");
        name.focus();
        return false;
    }
    
    document.signup.submit();
}
