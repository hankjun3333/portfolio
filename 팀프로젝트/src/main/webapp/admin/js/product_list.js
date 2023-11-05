function ajax_code(){
	var pid = document.getElementById("pid");
	var http = new XMLHttpRequest();
	http.onreadystatechange = function(){
		if(http.readyState == XMLHttpRequest.DONE && http.status == 200){
			var result = this.response;
			if(result == "no"){
				alert("해당 코드는 사용 가능합니다.");
				pid.readOnly = true;
			}
			else if(result == "yes"){
				alert("해당 코드는 중복입니다");
				pid.value = "";
			}
		}
	}
	http.open("post","./codeck.do",true);
	http.setRequestHeader("content-type","application/x-www-form-urlencoded");
	http.send("pid="+pid.value);
}


window.onload=function(){
		var sc = "";
		var sc2 = "";
		for(var i = 0; i< 6; i++){
			sc =Math.ceil(Math.random()*9);
			sc2 +=sc;
		}
		document.getElementById("pid").value=sc2;
		
		
}

var aa = 0;
var cc = 0;
var bb = 0;



function b(z){
	aa= Number(z);
	if(isNaN(z)==true){
		f.psmoney.value=0;
	}else if(Number(z)==0){
		f.psmoney.value="0";
	}
	else{
		//bb= Number(z)-((100-Number(cc))*0.01);
		bb=Number(z)-(Number(z)*(Number(cc)*0.01));
		console.log(cc);
		f.psmoney.value=Math.ceil(bb);
	}
	
}

function a(z){
	console.log(z);
	//cc=Number(z);
	if(isNaN(z)==true){
		f.psmoney.value=0;
	}else if(Number(z)==0){
		f.psmoney.value=f.pmoney.value;
	}else{
		bb= Number(aa)-(Number(aa)*(Number(z)*0.01));
		cc=Number(z);
		f.psmoney.value=Math.ceil(bb);
	}
	
}


document.querySelector("#list1").addEventListener("click",function(){
	location.href="./admin_product.do";
});




 function abc(){
	
	if(f.pdm.value==""){
		alert("대메뉴 카테고리를 입력하세요");
		return false;
	}else if(f.psm.value==""){
		alert("소메뉴 카테고리를 입력하세요");
		return false;
	}else if(f.pid.value==""){
		alert("상품코드를 입력하세요");
		return false;
	}else if(f.pname.value==""){
		alert("상품 이름을 입력하세요");
		return false;
	}else if(f.ptext.value ==""){
		alert("상품 부가설명을 입력하세요");
		return false;
	}else if(f.pmoney.value ==""){
		alert("상품 금액을 입력하세요");
		return false;
	}else if(f.psale.value ==""){
		alert("상품 할인율을 입력하세요");
		return false;
	}else if(f.pnum.value==""){
		alert("상품재고을 입력하세요");
		return false;
	}else if(f.pimg1.value=="" || f.pimg1.value==" "){
		alert("상품 이미지를 로드하세요");
		return false;
	}else if(f.ptext1.value==""){
		alert("상품설명을 입력하세요");
		return false;
	}else{
		if(f.pdm.value == f.psm.value){
			alert("해당 카테코리 이름이 동일합니다. 다시 입력해주세요");
			return false;
		}else if(isNaN(f.pmoney.value)== true){
			alert("숫자만 입력하세요");
			return false;
		}else if(isNaN(f.psale.value)== true){
			alert("숫자만 입력하세요");
			return false;
		}else if(isNaN(f.pnum.value)== true){
			alert("숫자만 입력하세요");
			return false;
		}else{
			f.submit();
		}
		
	}
	
}