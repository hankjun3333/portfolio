<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
<meta property="og:type" content="website">
<meta property="og:title" content="인천검단 레미안">
<title>인천검단 레미안</title>
<!-- css -->
<link rel="stylesheet" type="text/css" href="css/normalize.css">
<link rel="stylesheet" type="text/css" href="css/slick.css">
<link rel="stylesheet" type="text/css" href="css/swiper.min.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/cal-style.css">
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" href="./dadmin/css/sweetalert.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
    
<link rel="stylesheet" type="text/css" href="./css/top.css?v=2">
    
<!-- 추가된 css -->
<link rel="stylesheet" type="text/css" href="./css/new_member.css?v=26">
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
    
<div class="sub_title">
<section class="sub_image">
<span>
최적의 입주환경을 준비하는 입주 전 서비스<br>
두근두근 설레는 마음, 레미안 입주를 앞둔 고객님을 위한 사전방문 예약 입니다.</span>
</section>    
</div>    
    
<!-- 예약취소 화면 시작 -->
 <%@ include file="./reserve_cancel.jsp" %>
<!-- 예약취소 화면 종료>
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
