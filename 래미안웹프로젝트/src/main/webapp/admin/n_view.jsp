<%@page import="portfolio.noticedto"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	Date dt2 = new Date();
	DateFormat df2 = new SimpleDateFormat("yyMMddhhmmss");
	String date2 = df2.format(dt2);
	List<noticedto> lists = (List<noticedto>) request.getAttribute("lists");
    %>
<section class="page_section">
<div class="listbody">
    <div class="protitle">공지사항 확인</div>
    <div class="procho">
       <section class="data_listsview">
       <ol>
       <li>공지제목</li>
       <li class="text_in">${lists.get(0).getNtitle()}</li>
       <li>글쓴이</li>
       <li class="text_in">${lists.get(0).getMid()}</li> 
       <li style="height:800px;">내용</li>
       <li style="height:800px; padding-top: 10px;">${lists.get(0).getNtext()}
       <div class="text_in2"></div>
       </li>
       <%if(lists.get(0).getNfile() != null){ %>
       <li>첨부파일</li>
       <li class="text_in" onclick="file(<%=lists.get(0).getNidx()%>)">${lists.get(0).getNfile()}</li>
       <%} %>   
       </ol>
       <span class="notice_btns">
       <input type="button" value="목록" class="meno_btn2" onclick="list_btn()"></span>
       </section>
    </div>
</div> 
</section>
<script src="./js/n_view.js?v=<%=date2%>"></script>