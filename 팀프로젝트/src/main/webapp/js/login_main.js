function login_btn(){
	if(loginform.mid.value==""){
		alert("아이디를 입력해주세요");
		return false;
		
	}
	else if(loginform.mpass.value==""){
		alert("비밀번호를 입력해주세요");
		return false;
		
	}
	else{
		sessionStorage.setItem("id",loginform.mid.value);
		return;
	}
}
window.onload = function(){
	var userid = sessionStorage.getItem("id");
	document.getElementById("mid").value = userid;
}