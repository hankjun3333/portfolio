<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="app" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="menusize">
    <ul id="menus">
        <li class="topmenu1"><a class="atag" href="./admin_main.do">ADMINISTRATOR</a></li>
        <li class="topmenu2"><a class="atag" href="./info_main.do">환경설정</a></li>
        <li class="topmenu2"><a class="atag" href="./member_main.do?part=userid&data=">회원관리</a></li>
        <li class="topmenu2"><a class="atag" href="./notice_main.do?ntitle=">공지사항 관리</a></li>
        <li class="topmenu2"><a class="atag" href="./faq_main.do?f_question=">FAQ</a></li>
        <li class="topmenu2"><a class="atag" href="./reserve_main.do">예약현황</a></li>
        <li class="topmenu2"><a class="atag" href="./config_main.do">관리자 현황</a></li>
        <li class="topmenu3">${sessionScope.mid}님 환영합니다  <a class="atag" href="./logout.jsp">[로그아웃]</a></li>
    </ul>
 </div>
<div class="menuline"></div>