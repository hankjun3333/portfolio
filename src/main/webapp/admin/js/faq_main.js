document.querySelector("#faq_span").addEventListener("click",function(z){
	var n = document.querySelectorAll("#faq_span > .node");
	this.node = [].indexOf.call(n,z.srcElement.parentNode); // li 자식 노드에서 부모 노드를 찾아서 확인
	
	//Answer의 갯수
	this.ea = document.querySelectorAll("#faq_span > ol").length;
	
	var w = 0;
	//해당 모든 Answer의 display를 숨김
	while(w< this.ea){
		document.querySelectorAll("#faq_span > ol")[w].style["display"] = "none";
		w++;
	}
	//해당 q에 대한 Answer 값만 출력
	document.querySelectorAll("#faq_span > ol")[this.node].style["display"] = "flex";
	//this.value this.name this.style this.id 이런거 속성쓰면안됨 다 -1뜸
	//ul에 잡아놓으면 -1뜸 정확히 li에 대한 핸들링을 해줘야됨!
	//console.log(this.node); //-1뜨는것은 잘못찍엇단 것!
	console.log(this.ea);
	
});
function del_btn(z){
	if(confirm("정말 삭제하시겠습니까?")){
	location.href="./faq_delete?fidx="+z;
	}
}
function search_btn(){
	var search_data = document.getElementById("search_data").value;
	sessionStorage.setItem("searchdata",search_data);
	location.href="./faq_main.do?f_question="+search_data;
}
var searchValue = "";

window.onload = function(){
sessionStorage.setItem("searchdata","");	
}
function paging(z){
	searchValue = sessionStorage.getItem("searchdata");
	if(searchValue == "null" || searchValue == ""){
		location.href="./faq_main.do?f_question="+"&page="+z;
	}
	else{
		location.href="./faq_main.do?f_question="+searchValue+"&page="+z;
	}
	
}
function write_btn(){
	location.href="./faq_write.jsp";
}

