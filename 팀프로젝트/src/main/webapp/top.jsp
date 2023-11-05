<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String user = (String) session.getAttribute("mid");
%>
<div class="navbar">
      <a href="./index.do" id="logo">
        <img src="images/logo.jpg" width="149">
        </a>
        <ul id="menu">
        <%if(user==null || user==""){ %>
          <li><a href="./login.jsp">LOGIN</a></li>
          <%} else{%>
         <li> <%=user%> 님 환영합니다</li> <li><a href="./logout.jsp">로그아웃</a></li>
          <%} %>
          <%if(user == null || user==""){ %>
          <li><a href="./agree.jsp">MEMBER SHIP</a></li>
          <%}%>
          <li><a href="#">CART</a></li>
          <li><a href="#">CUSTOMER CENTER</a></li>
        </ul>
</div>