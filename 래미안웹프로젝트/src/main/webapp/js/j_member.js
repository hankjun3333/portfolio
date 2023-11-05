function member_btn(){
	if(f.uname.value==""){
		alert("이름 입력하세요");
		f.uname.focus();
	}
	else if(f.uid.value==""){
		alert("아이디를 입력해주세요");
		f.uid.focus();
	}
	else if(f.upass.value==""){
		alert("비밀번호를 입력해주세요");
		f.upass.focus();
	}
	else if(f.utel.value==""){
		alert("전화번호를 입력해주세요");
		f.utel.focus();
	}
	else{
		//정규식 코드 작성!
		var passck = document.getElementById("passck");
		if(f.uid.value.length<6 || f.uid.value.length>12){
			alert("아이디를 6~12 자리수로 입력해주세요");
			f.uid.focus();
		}
		else if(f.upass.value.length<8 || f.upass.value.length>14){
			alert("패스워드를 8~14 자리수로 입력해주세요");
			f.upass.focus();
		}
		else if(f.upass.value != passck.value){
			alert("패스워드를 동일하게 입력해주세요");
			f.upass.focus();
		}
		else if(f.upost.value == ""){
			alert("주소를 입력해주세요!");
		}
		else{
			f.submit();			
		}
	}
}
function inputval(val){
	//console.log(val);
	var email_checkbox = document.getElementById("email_checkbox");
	var value = val.replaceAll(" ","");
	if(value === ""){
		email_checkbox.disabled = true;
		email_checkbox.checked = false;
	}
	else {
		email_checkbox.disabled = false;
	}
}
function idck(){
	if(f.uid.value == ""){
		alert("아이디를 입력해주세요");
		f.uid.focus();
	}
	else if(f.uid.value.length<6 || f.uid.value.length>12){
		alert("아이디를 6~12 자리수로 입력해주세요");
		f.uid.focus();
	}
	else{
	var uidVal = document.getElementById("uid");
	var http = new XMLHttpRequest();
	http.onreadystatechange = function(){
		if(http.readyState == XMLHttpRequest.DONE){
			if(http.status == 200){
				var result = this.response;
				//console.log(result);
				if(result=="yes"){
					alert("이 아이디는 사용가능합니다.");
					uidVal.readOnly = true;
				}
				else{
					alert("해당 아이디는 중복입니다.");
					uidVal.value = "";
				}
				
			}
			else{
				console.log("상태 번호 : "+http.status);
			}
		}
	}
	http.open("GET","./idck?uid="+uidVal.value,true);
	http.send();
	}
}

window.onload = function() {
    document.getElementById("verification").style.display = "none";
}

var security_code = "";
function send_verification() {
    document.getElementById("verification").style.display = "inline-block";
	
	var sc2 = "";
	var w=0;
	while(w<6){
		sc2 += Math.ceil(Math.random()*6);
		w++;
	}
	
	var usertel = document.getElementById("utel");
	if(usertel.value == ""){
		alert("전화번호를 입력해주세요"); 
	}
	else{
	alert("인증 번호가 발송 되었습니다.");
	var http = new XMLHttpRequest();
	http.onreadystatechange = function(){
		if(http.readyState == XMLHttpRequest.DONE){
			if(http.status == 200){
				var result = this.response;
				if(result=="ok"){
					alert("발송완료되었습니다. 미 수신시 휴대폰번호 확인바랍니다.");
					security_code = sc2;
				}
			}
			else{
				console.log(http.status);
			}
		}
	}
	http.open("POST","./scode.do",true);
	http.setRequestHeader("content-type","application/x-www-form-urlencoded");
	http.send("usertel="+usertel.value+"&scode="+sc2);
	}
}
function verifyok_btn(){
	var code_ck = document.getElementById("scode_ck");
	var usertel = document.getElementById("utel");
	if(!code_ck.value.trim()) { // 인증번호 입력란이 비어있는지 확인
		alert('인증 번호를 입력해주세요');
	}
	else if(code_ck.value != security_code){
		alert('인증 번호를 다시입력해주세요');
	}	
	else if(code_ck.value == security_code){
		alert("인증되었습니다.");
		code_ck.readOnly = true;
		usertel.readOnly = true;
	}
}


function cancel(){
	location.href="./index.do";
}
