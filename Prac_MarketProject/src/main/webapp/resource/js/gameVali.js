function gameValiCheck() {
    const gameId = document.getElementById("gameid");
    const haveCheckDupl = document.getElementById("haveCheckDupl").value;
    const name = document.getElementById("name");
    const price = document.getElementById("price");
    console.log(price);
    const mainimg = document.getElementsByName("mainimg");
    const subimg1 = document.getElementsByName("subimg1");
    
    const developer = document.getElementById("developer");
    const releasedate = document.getElementById("releasedate");
    
    function checkVali(regExp, e, msg) {
        if (regExp.test(e.value)){
            return true;
        }
        alert(msg);
        e.focus();
        return false;
    }
    
    const regExpGameId = new RegExp("^\\d{1,}0$"); // 수정된 부분
    if(!checkVali(regExpGameId, gameId, "게임 코드는 2자리 이상이여야 하며 숫자로만 이루어져야 하고 0으로 끝나야 합니다.")) return false;
   
    if(haveCheckDupl==0){
		alert("게임명 중복체크를 실행해 주세요.");
		return false;
	}
    
    if(name.value.length < 2) {
        alert("[게임명]\n최소 2글자 이상 입력하세요.");
        name.focus();
        return false;
    }
    
    const regExpPrice = new RegExp("^[0-9]+$"); // 수정된 부분
    if(!checkVali(regExpPrice, price, "가격은 숫자만으로 입력해 주세요.")) return false;
    
    const regExpImg = new RegExp("/\.(jpg|jpeg|png|webp)$/i");
    
    const mainimgFile = mainimg[0];
    if (mainimgFile.files.length === 0) {
	    alert("메인 이미지는 반드시 첨부해야 합니다.");
	    return false;
	}
    
	const subimg1File = subimg1[0];
	if (subimg1File.files.length === 0) {
	    alert("설명 이미지-1은 반드시 첨부해야 합니다.");
	    return false;
	}
	
    if(developer.value.length < 1) {
		alert("개발사는 반드시 입력해야 합니다.");
		developer.focus;
		return false;
	}
    
    function checkRdVali(inputdate, msg) {
        const date1 = new Date(inputdate);
        const date2 = new Date();
        if (date1 <= date2){
            return true;
        }
        alert(msg);
        releasedate.focus(); // 수정된 부분: e를 releasedate로 변경
        return false;
    }
    
    if(!checkRdVali(releasedate.value, "출시일을 미래로 설정할 수 없습니다.")) return false;
    
    document.newGame.submit();
}
