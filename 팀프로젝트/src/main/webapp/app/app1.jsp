<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정규식 코드 사용법</title>
</head>
<body>
<form id="f">
숫자 입력 : <input type="text" name="mtext" placeholder="숫자만 입력하세요"><br>
고객 명 : <input type="text" name="mname" placeholder="고객명을 입력하세요"><br>
패스워드 : <input type="text" name="mpass" placeholder="패스워드를 입력하세요"><br>
이메일 : <input type="text" name="memail" placeholder="이메일 주소를 입력하세요"><br>
인증번호 : <input type="text" name="mno" placeholder="인증 번호를 입력!"><br>
<input type="button" value="정규식체크" onclick="abc()">
</form>
</body>
<script>
function abc(){
	var word = f.mtext.value;
	//var ck = /[0-9]/g; //정규식 코드는 쌍따옴표 붙이면안됨 0~9 해당 값이 있느냐? 
	var ck = /[a-z | A-Z | ㄱ-ㅎ | ㅏ - ㅣ | 가-힣]/g; //하나라도 문자가 있으면 즉, true가 나오면 alert을 띄우자
	if(ck.test(word) == false){ //정규식 코드에 맞지 않는 문자일 경우 - > false
		//console.log("false");
	}
	else{ //정규식 코드에 맞을경우 -> true가 뜸
		console.log("숫자만 입력하셔야 합니다.");
	}
	/*고객명을 해보자*/
	//영문한글만 입력받는 정규식
	 
	var word2 = f.mname.value;
	var ck2 = /[0-9]/g;
	if(ck2.test(word2) == true){
		alert("정상적인 이름을 입력하세요");
	}	
	
	// \s : spacebar -> 공백체크를 함!
	
	var word3 = f.mpass.value;
	var ck3 = /^\s/g;
	if(ck3.test(word3) == true){
		alert("공백이 확인됩니다.");
	}
	
	/* hong  @  nate  .  com 이렇게 5개로 구분*/
	
	var word = f.memail.value;
	var ck = /[a-zA-Z0-9||_-]+@[a-zA-Z0-9]+[.]+[a-zA-Z0-9]/g
	if(ck.test(word) == false){
		alert("올바른 이메일이 아닙니다.");
	}
	//인증번호 - > 숫자만 입력! 다른방식도 있음
	var word = f.mno.value;
	//var ck = /[a-z]/gi; //A-Z 도 검토를 한다는 것! 
	// gi 에서 i 는 대 소문자 에서 모두 확인!
	var ck = /[^0-9]/g; //[^0-9] 해당 범위 0~9 외에 사용함 부정의 의미!
	if(ck.test(word) == true){
		alert("인증번호는 숫자만 입력하셔야 합니다.");
	}
}
</script>


</html>





