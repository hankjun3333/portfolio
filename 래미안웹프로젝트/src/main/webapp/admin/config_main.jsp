<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Date dt = new Date();
	DateFormat df = new SimpleDateFormat("yyMMddhhmmss");
	String date = df.format(dt);
	String admin_id = (String) session.getAttribute("mid");
	if(admin_id == null || admin_id =="" || admin_id =="null"){
		response.sendRedirect("/admin/index.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/page_default.css?v=<%=date%>">
<link rel="stylesheet" href="./css/admin_css.css?v=<%=date%>">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap">
<title>관리자 페이지</title>
</head>
<body>
<nav>
<%@ include file="./menu.jsp" %>
</nav>    
<main class="page_main">
<%@ include file="./cf_main.jsp" %>
</main>
<footer>
<%@ include file="./footer.jsp" %>
</footer>
</body>
</html>