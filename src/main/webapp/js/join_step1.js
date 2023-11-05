var all_agree = document.getElementById("all_agree");
function allagree(z){
	
	if(all_agree.checked == z){
		var w = 1;
		while(w<=2){
			document.getElementById("agree"+w).checked=z;
			w++;
		}
	}
}

function use_agree(z){
	var w = 1;
	var ck = true;
	while(w<=2){
		if(document.getElementById("agree"+w).checked==false){
			ck = false;
		}		
		w++;
	}
	if(ck == true){
		all_agree.checked = true;
	}
	else{
		all_agree.checked = false;
	}
}
window.onload = function(){
	var w = 1;
	while(w<=2){
		text(w);
		w++;
	}	
}

var text =  function(w){
	var http = new XMLHttpRequest();
	http.onreadystatechange = function(){
		if(http.readyState == XMLHttpRequest.DONE){
			if(http.status==200){
				var result = this.response;
				//console.log(result);
				var agree_box1 = document.getElementById("agree_box1");
				var agree_box2 = document.getElementById("agree_box2");
				if(w==1){
					agree_box1.innerText = result;
				}
				else if(w==2){
					agree_box2.innerText = result;
				}
			}
			else{
				console.log("통신 상태 오류");
			}
		}
	}
	http.open("GET","./agree/agree"+w+".txt",false);
	http.send();
}

function step1ok(){
	console.log("test");
	var agree1 = document.getElementById("agree1");
	if(agree1.checked == false){
		alert("이용약관은 필수 사항입니다.");
	}
	else if(agree2.checked == false){
		alert("개인정보 수집 및 이용 사항은 필수입니다.");
	}
	else{
		//위치나오는대로 변경할것!
		location.href="./join_member.jsp";
	}
}









