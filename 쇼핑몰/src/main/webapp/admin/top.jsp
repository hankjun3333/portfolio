<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String adminid = null;
    try{
     adminid = (String) session.getAttribute("aid");
    }
    catch(Exception e){
    	out.print(e);
    }
    
    %>
    <div class="header_div">
        <p><img src="./img/logo.png" class="logo_sm"> ADMINISTRATOR</p>
        <p><%if(adminid !=null || adminid != ""){ %>
			<%=adminid%>
			<%} %>
        <a href="#">[개인정보 수정]</a><a href="./logout.jsp">[로그아웃]</a></p>
    </div>
