<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	Date dt = new Date();
	DateFormat df = new SimpleDateFormat("yyMMddhhmmss");
	String date = df.format(dt);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/page_default.css?v=<%=date%>">
<link rel="stylesheet" href="./css/admin_css.css?v=<%=date%>">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap">
<!-- 신규추가된 css 파일 -->
<link rel="stylesheet" href="./css/notice.css?v=<%=date%>">
<!-- 신규추가된 css 파일 끝-->
<title>관리자 페이지</title>
<script>
</script>
</head>
<body>
<nav>
<%@ include file="./menu.jsp" %>
</nav>
<!-- 세대정보 입력 시작 -->
<main class="page_main">
<%@ include file="./i_write.jsp" %>
</main>
<!-- 세대정보 입력 끝 -->
<footer>
<%@ include file="./footer.jsp" %>
</footer>
</body>
</html>