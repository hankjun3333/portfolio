<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집에서 하는 mvc</title>
</head>
<body>
<form id="f" method="post" action="./homeok.do" enctype="application/x-www-form-urlencoded">
아이디 : <input type="text" value="${dto2.get(0).getMid()}" name="mid" ><br>
이름 : <input type="text" value="${dto2.get(0).getMname()}" name="mname"><br>
이메일 : <input type="email" value="${dto2.get(0).getMemail()}" name="memail"><br>
전번 : <input type="text" value="${dto2.get(0).getMtel()}" name="mtel"><br>
<input type="button" value="전송" onclick="abc()">
</form>
<script>
function abc(){
	f.submit();
}
</script>
</body>
</html>