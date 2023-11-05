<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    Date dt3 = new Date();
    SimpleDateFormat sf3 = new SimpleDateFormat("yyyyMMddHHmmss");
    String date3 = sf3.format(dt3);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/page_default.css?v=<%=date3%>">
<link rel="stylesheet" href="./css/admin_css.css?v=<%=date3%>">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap">
<!-- 신규추가된 css 파일 -->
<link rel="stylesheet" href="./css/notice.css?v=<%=date3%>">
<!-- 신규추가된 css 파일 끝-->
<title>관리자 페이지</title>
<script>
</script>
</head>
<body>
<nav>
<%@ include file="./menu.jsp" %>
</nav>
<!-- 회원관리 시작 -->
<main class="page_main">
<%@ include file="./mb_main.jsp" %>
</main>
<!-- 회원관리 끝 -->
<footer>
<%@ include file="./footer.jsp" %>    
</footer>
</body>
</html>