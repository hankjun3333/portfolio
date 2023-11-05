function write_btn(){
	location.href="./notice_write.jsp";
}
function notice_content(z){
	location.href="./notice_view.do?nidx="+z;
}
function delete_btn(z){
	if(confirm("정말 삭제하시겠습니까?")){
		location.href="./notice_delok.do?nidx="+z;
	}
}
var data = "";

window.onload = function(){
sessionStorage.setItem("inputvalue","");	
}

function search_btn(){
	data = document.getElementById("sdate2").value;
	sessionStorage.setItem("inputvalue",data);
	location.href="./notice_main.do?ntitle="+data;
}
var dataval = "";
function paging(z){
	dataval = sessionStorage.getItem("inputvalue");
	if(dataval == "null" || dataval == ""){
		location.href="./notice_main.do?ntitle="+"&page="+z;
	}
	else{
		location.href="./notice_main.do?ntitle="+dataval+"&page="+z;	
	}
	
}
