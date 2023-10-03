
function adminok(){
	var ck = /[0-9]/g;
	var pass_ck = document.getElementById("pass_ck");
	if(f.marea.value==""){
		alert("소속을 체크해주세요");
	}
	else if(f.mdept.value==""){
		alert("부서를 체크해주세요");
	}
	else if(f.mname.value==""){
		alert("이름을 입력해주세요");
	}
	else if(f.mlevel.value==""){
		alert("직책을 선택해 주세요");
	}
	else if(f.mid.value==""){
		alert("아이디를 입력해주세요");
	}
	else if(f.mpass.value==""){
		alert("패스워드를 입력해주세요");
	}
	else if(f.memail.value==""){
		alert("이메일을 입력해주세요");
	}
	else if(f.mtel1.value=="" ||f.mtel2.value==""||f.mtel3.value=="" ){
		alert("연락처를 입력해주세요");
	}
	else{
		if(ck.test(f.mname.value) == true){
			alert("정상적인 이름입력바랍니다.");
		}
		else if(f.mpass.value !=f.pass_ck.value){
			alert("패스워드가 일치하지 않습니다.");
		}
		else if(f.memail.value.indexOf('@')==-1){
			alert("올바른 이메일 형식 입력바랍니다.");
		}
		else if(ck.test(f.mtel2.value)==false ||ck.test(f.mtel3.value)==false){
			alert("연락처에 숫자만 입력해주세요");
		}
		else{
			f.submit();
		}
	}
}

/*테스트 용임*/
/*
function adminok(){
	f.submit();
}
*/
function area(z){
	var marea = document.getElementById("marea").value;
	marea= z;
	console.log(marea);
}
function dept(z){
	var mdept = document.getElementById("mdept").value;
	mdept= z;
	console.log(mdept);
}
function level(z){
	var mlevel = document.getElementById("mlevel").value;
	mlevel= z;
	console.log(mlevel);
}

function ajax_idck(){
	var mid = document.getElementById("mid");
	var http = new XMLHttpRequest();
	http.onreadystatechange = function(){
		if(http.readyState == XMLHttpRequest.DONE && http.status==200){
			var result = this.response;
			//console.log(result);
			if(result=="no"){
				alert("이 아이디는 사용 가능합니다.");
				mid.readOnly = true;
			}
			else if(result == "yes"){
				alert("해당 아이디 중복입니다");
				mid.readOnly = false;
				mid.value = "";
			}
		}
	}
	http.open("post","./idck.do",true);
	http.setRequestHeader("content-type","application/x-www-form-urlencoded");
	http.send("mid="+mid.value);
	/* 컨트롤러 return 시 view 페이지 만들것!*/	
}