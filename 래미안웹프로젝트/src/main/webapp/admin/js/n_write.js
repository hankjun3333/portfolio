function writeok(){
	if(notice_form.ntitle.value==""){
		alert("제목을 입력해주세요");
	}
	else if(notice_form.mid.value==""){
		alert("아이디 입력바람");
	}
	else{
		notice_form.submit();
	}
}