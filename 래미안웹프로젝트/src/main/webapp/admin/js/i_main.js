function config_write(){
	location.href="./info_write.jsp";
}
function del_btn(z){
	if(confirm("정말 삭제 하시겠습니까?")){
	location.href="./delete?cidx="+z;
	}
}
window.onload = function(){
sessionStorage.setItem("type_data","");	
}

function type_btn(){
	var sdate = document.getElementById("sdate2");
	var sdate2 = document.getElementById("sdate2").value;

	sessionStorage.setItem("type_data",sdate2);
	location.href="./info_main.do?search="+sdate2;

}
var type_data = "";
	function paging(z){
		type_data = sessionStorage.getItem("type_data");
		console.log(type_data);
		if(type_data == "" || type_data == "null"){
			location.href="./info_main.do?search="+"&page="+z;
		}
		else{
			location.href="./info_main.do?search="+type_data+"&page="+z;
		}	
	}