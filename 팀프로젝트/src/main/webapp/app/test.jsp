<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사이트 정보 view 파트 출력</title>
</head>
<body>
사이트 제목 : ${dto.getTitle()}<br>
관리자 메일 주소 : ${dto.getAemail()}<br>
<br>
<form id="f" method="post" action="./testok.do" enctype="application/x-www-form-urlencoded">
<input type="text" name="mname" placeholder="이름을 입력하세요"><br>
<input type="text" name="mid" placeholder="아이디를 입력하세요"><br>
</form>

</body>
</html>