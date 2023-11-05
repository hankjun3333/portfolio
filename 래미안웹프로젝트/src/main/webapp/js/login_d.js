function join(){
	location.href="./join_agree.jsp";
}

function loginok(){
	if(f.uid.value==""){
		alert("아이디를 입력해주세요");
		return false;
	}
	else if(f.upass.value==""){
		alert("비밀번호를 입력해주세요");
		return false;
	}
	else{
		return;
	}
	
}