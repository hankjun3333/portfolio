/*window.onload = function(){
sessionStorage.setItem("inputvalue","");	
}*/
function client_search_btn(){
	f.submit();
}

var dataval = "";
function paging(z){
	//console.log(z);
	dataval = sessionStorage.getItem("inputvalue");
	if(dataval == "null" || dataval == ""){
		location.href="./client_notice.do?ntitle="+"&page="+z;
	}
	else{
		location.href="./client_notice.do?page="+z;	
	}
}