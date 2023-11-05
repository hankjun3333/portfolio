<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 인증 팝업창</title>
</head>
<body>
	
<form id="f" method="post" action="./popup_email.do">
이름 :<input type="text" name="mname" placeholder="이름 입력"><br>
이메일 : <input type="email" id="email" name="memail" placeholder="이메일 입력"><br><br>
<input type="button" value="인증번호 전송" onclick="mail()"><br><br>

인증코드 : <input type="text" id="code" name="code" value="" placeholder="인증코드6자리 입력"><br>
<input type="hidden" id="security" name="code2" value="${scode2}">
</form>
<input type="hidden" id="c_code" value="">
<input type="button" name="code_ck" value="확인" onclick="code_ckeck()">

<script src="./js/popup.js?v=2"></script>


</body>
</html>