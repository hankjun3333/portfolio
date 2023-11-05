var partVal = document.getElementById("part").value;
	partVal = "userid";
function part_input(z){
	partVal = z;
}

function search_btn(){
	var userdataVal = document.getElementById("sdate2").value;
	
	sessionStorage.setItem("dataVal",userdataVal);	
	location.href="./reserve_main.do?part="+partVal+"&data="+userdataVal;
	
}
var datavalue = "";
window.onload = function(){
sessionStorage.setItem("dataVal","");		
}
function paging(z){
	datavalue = sessionStorage.getItem("dataVal");
	if(datavalue=="null" || datavalue == ""){
	location.href="./reserve_main.do?part="+partVal+"&data="+"&page="+z;
	}
	else{
		location.href="./reserve_main.do?part="+partVal+"&data="+datavalue+"&page="+z;
	}
}

function del_btn(z){
	if(confirm("해당 예약자는 예약이 취소됩니다. 정말 취소하시겠습니까?")){
	location.href="./reserve_delete?ridx="+z;	
	}
	
}