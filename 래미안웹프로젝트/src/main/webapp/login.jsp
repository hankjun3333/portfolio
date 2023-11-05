<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    Date dt3 = new Date();
    SimpleDateFormat sf3 = new SimpleDateFormat("yyyyMMddHHmmss");
    String date3 = sf3.format(dt3);
    %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
<meta property="og:type" content="website">
<meta property="og:title" content="인천검단 레미안">
<title>인천검단 레미안</title>
<!-- css -->
<link rel="stylesheet" type="text/css" href="css/normalize.css?v=<%=date3%>">
<link rel="stylesheet" type="text/css" href="css/slick.css?v=<%=date3%>">
<link rel="stylesheet" type="text/css" href="css/swiper.min.css?v=<%=date3%>">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css?v=<%=date3%>">
<link rel="stylesheet" type="text/css" href="css/cal-style.css?v=<%=date3%>">
<link rel="stylesheet" type="text/css" href="css/common.css?v=<%=date3%>">
<link rel="stylesheet" href="./dadmin/css/sweetalert.min.css?v=<%=date3%>">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js?v=<%=date3%>"></script>
<script src="js/bootstrap.min.js?v=<%=date3%>"></script>
    
<link rel="stylesheet" type="text/css" href="./css/top.css?v=<%=date3%>">
    
<!-- 추가된 css -->
<link rel="stylesheet" type="text/css" href="./css/new_member.css?v=<%=date3%>">
<!-- 추가된 css -->
</head>

<body>
<!-- wrap -->
<div id="wrap">
	<!-- header 로고 & 대메뉴,소메뉴 -->
	<header id="hd">
<%@ include file="./top_menu.jsp" %>
<%@ include file="./top.jsp" %>
	</header>
	<!-- header 로고 & 대메뉴,소메뉴 끝 -->


<div id="container">
<div id="index">
    
<!-- 로그인 화면 시작 -->
<%@ include file="./login_d.jsp" %>
    
<!-- 로그인 화면 종료 -->
</div>
  <!-- 카피라이터 시작 -->
	  	<footer id="ft">
 <%@ include file="./footer.jsp" %>
  	</footer>	
 <!-- 카피라이터 종료 -->
</div>
    </div>
</body>
</html>
