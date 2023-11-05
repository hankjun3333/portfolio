<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Date dt = new Date();
	DateFormat df = new SimpleDateFormat("yyMMddhhmmss");
	String date = df.format(dt);
	//out.print(date);
%>
<?php
 include "session.php";
?>
<meta charset="UTF-8">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/admin_css.css?v=<%=date%>">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap">
<title>관리자 페이지</title>
</head>
<body>
<nav>
	<%@ include file="./menu.jsp" %>
</nav>
<main>
	<%@ include file="./ad_main.jsp" %>
</main>
<footer>
	<%@ include file="./footer.jsp" %>
</footer>
<script src="./js/menus.js?v=<%=date%>"></script>
</body>
</html>