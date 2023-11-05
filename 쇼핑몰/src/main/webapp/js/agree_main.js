
var agree = function(f){
	
var http = new XMLHttpRequest();
console.log(http);
http.open("GET",f,false);
http.send();
return http.response; 
} 
document.getElementById("agreebox1").innerHTML = agree("./agree1.txt"); 
document.getElementById("agreebox2").innerHTML = agree("./agree2.txt"); 
 
function all_ck(e){
	console.log(e);
	var w =1;
	while(w<=2){
    	if(document.getElementById("allAgree").checked == e){
    		document.getElementById("termsAgree"+w).checked = e;
    	}
    	w++;
	}
}
function ck(){
	
	var all = document.getElementById("allAgree"); 
	var w =1;
	var check = true; 
	do{ 
		if(document.getElementById("termsAgree"+w).checked == false){
			check = false;
		}
		
		w++;
	}
	while(w<=2);
	
	if(check==false){ 
		all.checked = false;
	}
	else{ 
		all.checked = true;
	}
}
	
function agreeok(){
	
	var w =1;
	var check = true;  
	do{ 
		if(document.getElementById("termsAgree"+w).checked == false){
			check = false;
		}
		
		w++;
	}
	while(w<=2);

	if(check == false){
		alert("필수사항 체크 바람");
	}
	else{
		agree_join.submit();
	}
}
