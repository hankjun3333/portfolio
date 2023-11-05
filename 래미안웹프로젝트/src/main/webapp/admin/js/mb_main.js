var partVal = document.getElementById("part").value;
	partVal = "userid";
function part_input(z){
	partVal = z;
}
window.onload = function(){
sessionStorage.setItem("dataVal","");	
}
function search_btn(){
	var userdataVal = document.getElementById("sdate2").value;
	sessionStorage.setItem("dataVal",userdataVal);	
	location.href="./member_main.do?part="+partVal+"&data="+userdataVal;
}
var datavalue = "";
function paging(z){
	datavalue = sessionStorage.getItem("dataVal");
	if(datavalue=="null" || datavalue == ""){
		location.href="./member_main.do?part="+partVal+"&data="+"&page="+z;
	}
	else{
		location.href="./member_main.do?part="+partVal+"&data="+datavalue+"&page="+z;
	}
	
}

function del_btn(z){
	if(confirm("해당 사용자를 정말 로그인 정지 시키겠습니까?")){
	location.href="./user_delete?uidx="+z;	
	}
	
}