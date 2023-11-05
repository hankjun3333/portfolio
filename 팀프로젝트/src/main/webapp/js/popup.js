
function code_ckeck(){
var code = sessionStorage.getItem("code");
var email = document.getElementById("email").value;
sessionStorage.setItem("email", email);

var clientcode = document.getElementById("code").value;
	if(clientcode == code){
		alert("인증코드가 일치 합니다");
		window.opener.postMessage({ code: code, email: email }, '*');
		window.close();
	}
	else{
		alert("인증코드가 일치하지 않습니다");
	}
}

function mail(){
	var sc = "";
	var w =0;
	while(w<8) {
		var code = Math.ceil(Math.random()*6);
		sc +=(code);
		w++;	
	}
	sessionStorage.setItem("code", sc);
	if(f.mname.value==""){
		alert("내용 입력해주세요");
	}
	else if(f.memail.value == ""){
		alert("이메일 입력바람");
	}
	else{
		f.code2.value = sc;	
		f.submit();
	}
}

//console.log(code);
