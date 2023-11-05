<%@page import="portfolio.userdto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
userdto dto = null;
String userid = "";
	try{
		dto = (userdto) session.getAttribute("userdto");
		userid = dto.getUid();
	}
	catch(Exception e){
		
	}
%>
   <div class="top_menu">
        <ul class="top_menu_list">
        <% if(userid == null || userid ==""){ %>
        <li><a class="atag" href="./login.do">로그인</a></li>
        <li><a class="atag" href="./join_agree.jsp">회원가입</a></li>
        <%}else{ %>
        <li><%=userid%>님 환영합니다 <a href="./logout.jsp">[로그아웃]</a></li>
        <%} %>
        <li><a href="./client_faq.do">FAQ</a></li>
        <li><a href="./client_notice.do">공지사항</a></li>
        </ul>
    </div>

	
	
	