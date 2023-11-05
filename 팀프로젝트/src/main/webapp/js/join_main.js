function ajax_load(){
	var id = document.getElementById("mid");
	
	if(id.value == ""){
		alert("아이디를 입력해주시기 바랍니다.");
	}
	else{
	var http = new XMLHttpRequest();
	http.onreadystatechange = function(){
		if(http.readyState == XMLHttpRequest.DONE && http.status == 200){
			var result = this.response.replaceAll(/\r?\n/g, "");
			//console.log(http)
			//console.log(result);
			
			//yes : 중복 , no : 가능 error : 오류
			if(result == "yes"){
				alert("사용가능한 아이디 입니다");
				id.readOnly = true;
			}
			else if(result == "no"){
				alert("다른 아이디를 입력해 주시길 바랍니다.");
			}
		}
	}
	
	http.open("post","./joinid.do",true);
	http.setRequestHeader("content-type","application/x-www-form-urlencoded")
	http.send("userid="+id.value); 
	}
}


window.addEventListener('message', function(event) {
	  
	  console.log(event);
	  var receivedValues = event.data;
	  var value1 = event.data.code;
	  var value2 = event.data.email;
	document.getElementById("join_code").value = value1;
	document.getElementById("email").value = value2;  
	});

function join_btn(){  
	
    if(join.mid.value==""){
    	alert("아이디 입력 바람");
    	join.mid.focus();
    }
    else if(join.mpass.value == ""){
    	alert("비밀번호 입력 바람");
    	join.mpass.focus();
    }
    else if(join.mpass2.value == ""){
    	alert("비밀번호확인 입력 바람");
    	join.mpass.focus();
    }
    else if(join.mpass.value.length < 6){
    	alert("비밀번호 최소 6자 이상 입력바람");
    	join.mpass.focus();
    }
    else if(join.mname.value == ""){
    	alert("이름 입력 바람");
    	join.mname.focus();
    }
    else if(join.memail.value == ""){
    	alert("이메일 입력 바람");
    	join.memail.focus();
    }
    else if(join.mtel.value == ""){
    	alert("전화번호 입력 바람");
    	join.mtel.focus();
    }
    else{
    	if(join.memail.value.indexOf('@') == -1){
    		alert("올바른 이메일 형식 입력바람");
    		join.memail.focus();
    	}
    	else if(join.mpass.value != join.mpass2.value){
   	    	alert("비밀번호가 일치하지 않음");
   	    	join.mpass.focus();
    	}
    	else{
    		join.submit();
    	}
    }
   
}

