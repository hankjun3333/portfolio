
/* 여기는 근무중/퇴직중 선택하는곳 onchange함수! */
var useValue = "Y";
function useck(z){
	useValue = z;
	//console.log(useValue);
}

//var now_pagingnum =document.getElementById("paging_id").value;
function user_text(z){
	var user_input = document.getElementById("user_input");
	var user_inputVal = user_input.value;
	//console.log(user_inputVal);
	usertext = sessionStorage.setItem("usertext",user_inputVal);
}
var usertext = "";
var areaValue = "";
function user_usebtn(midx){
	var page = document.getElementById("pagenum").value;
	var http = new XMLHttpRequest();
	http.onreadystatechange = function(){
		if(http.readyState == XMLHttpRequest.DONE){
			if(http.status==200){
				var result = this.response;
				var member_muse = document.getElementById("member_muse");
				var usertextVal = sessionStorage.getItem("usertext");
				areaValue = sessionStorage.getItem("areaparam");
				if(result=="Y"){
					member_muse.value = "Y";
				}
				else{
					member_muse.value = "N";
				}
				
				if(areaValue =="all"){	
					location.href="./config_main.do?area=all"+"&page="+page;
					
				}
				else if(areaValue != "all"){
					
					location.href="./config_main.do?area="+areaValue+"&page"+page;
				}
			}
			else{
				alert("현황을 체크해주세요");
			}
		}
		else{
			console.log(http.status);
		}
	}
	http.open("GET","./useok?muse="+useValue+"&midx="+midx,true);
	http.send();	
}
/* 여기는 근무중/퇴직중 선택하는곳 -끝 */

function area_list(ar){
	sessionStorage.setItem("areaparam",ar);
	location.href="./config_main.do?area="+ar;
}

function paging(z,now_area){
	var areaValue = sessionStorage.getItem("areaparam");
	//console.log(now_area);
	if(now_area != "all"){
		if(z>=1){
		location.href="./config_main.do?area="+areaValue+"&page="+z;		
		}
		else if(z<1){
			alert("첫번째 페이지입니다.");
		}	
	}
	else if(now_area == "all"){
		location.href="./config_main.do?page="+z;		
	}	
	
}

function paging2(k){
	var areaValue = sessionStorage.getItem("areaparam");
	var indexid = document.querySelectorAll("#indexnum");
	var indexcount = indexid.length;
	if(k>indexcount){
		alert("마지막페이지입니다.");
	}
	else if(k<=indexcount){
		location.href="./config_main.do?area="+areaValue+"&page="+k;
	}
}



function first_page(){
	location.href="./config_main.do?area=all";
}
var search_part = "name";
function member_part(z){
	search_part = z;
	var http = new XMLHttpRequest();
	http.onreadystatechange = function(){
		if(http.readyState == XMLHttpRequest.DONE){
			if(http.status==200){
				var result = this.response;
			}
			else{
				console.log("연결 에러");
			}
		}
	}
	http.open("POST","./config_main.do",true);
	http.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	http.send("search_part="+search_part);
}
