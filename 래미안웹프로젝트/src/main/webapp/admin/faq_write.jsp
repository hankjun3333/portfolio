<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    Date dt1 = new Date();
    DateFormat df1 = new SimpleDateFormat("yyMMddhhmmss");
    String date1 = df1.format(dt1);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/page_default.css?v=<%=date1%>">
<link rel="stylesheet" href="./css/admin_css.css?v=<%=date1%>">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap">
<!-- 신규추가된 css 파일 -->
<link rel="stylesheet" href="./css/notice.css?v=<%=date1%>">
<!-- 신규추가된 css 파일 끝-->
<title>관리자 페이지</title>
<script>
</script>
</head>
<body>
<nav>
<%@ include file = "./menu.jsp" %>
</nav>
<!-- FAQ 등록 시작 -->
<main class="page_main">
<%@ include file="./f_write.jsp" %>
</main>
<!-- FAQ 등록 끝 -->
<footer>
<%@ include file="./footer.jsp" %>
</footer>
</body>
</html>