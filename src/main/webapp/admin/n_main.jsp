<%@page import="java.util.List"%>
<%@page import="portfolio.noticedto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Date dt = new Date();
SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddHHmmss");
String date = sf.format(dt);

String cnt = (String) request.getAttribute("cnt");
int count = Integer.parseInt(cnt);
List<noticedto> lists = (List<noticedto>) request.getAttribute("lists");
String now_page = (String) request.getParameter("page");
//out.print(now_page);
int n_page = 1;
if(now_page == null || now_page==""){
	n_page = 1;
}
else{
	n_page = Integer.parseInt(now_page);
}
String userid= (String) session.getAttribute("mid");
if(userid == null){
	%>
		<script>
		location.href='./index.jsp';
		</script>
<% }else{ %>


<section class="page_section">
<div class="listbody">
    <div class="protitle">공지사항 관리</div>
    <div class="procho">
       <section class="search_part">
        <ol>
        <li>공지사항 검색</li>
        <li>
        <form id="f" method="get" action="./notice_main.do">
        <input type="text" id="sdate2" name="ntitle" class="search_input">
        <input type="button" value="검색" class="datebtn" onclick="search_btn()">
        </form>
        </li>        
        <li></li>
        <li></li> 
        </ol>
       </section> 
       <section class="data_listsview">
       <ul>
        <li>번호</li>
        <li>제목</li>
        <li>첨부파일 유/무</li>
        <li>조회수</li>
        <li>글쓴이</li>
        <li>등록일</li>
        <li>삭제</li>
       </ul>
       <%if(lists.size() == 0){ %>
        <ul class="nodatas">
        <li>등록된 공지사항이 없습니다.</li>
       </ul>
       <% }else{%>
       <%
	       int w = 0;
	       do{
       %>
            
	       <ul>
	        <li><%=count-(n_page-1)*10 - w %></li>
	        <li style="text-align: left; justify-content: flex-start;" onclick="notice_content(<%=lists.get(w).getNidx()%>)">
	        <%= lists.get(w).getNtitle()%></li>
	        <%if(lists.get(w).getNfile()==null ||lists.get(w).getNfile()==""||lists.get(w).getNfile()=="null"){ %>
	         <li>X</li>
	        <%}else{ %>
	        <li>O</li>
	        <%} %>
	        <li><%=lists.get(w).getNcount()%></li>
	        <li><%= lists.get(w).getMid()%></li>
	        <li><%=lists.get(w).getNindate().substring(0,10) %></li>
	        <li>
	            <input type="button" value="삭제" class="delbtn" onclick="delete_btn(<%=lists.get(w).getNidx()%>)">
	        </li>
	       </ul>
       <%
       		w++;
	       }while(w<lists.size());
       }
       %>
       <span class="notice_btns">
       <input type="button" value="글쓰기" class="meno_btn2" onclick="write_btn()"></span>
       <aside>
        <div class="page_number">
           <ul>
           <%
           int pg = (int) Math.ceil(count/10f);
           int k = 1;
           while(k<=pg){
           %>
           <li onclick="paging(<%=k%>)"><%=k%></li>
           <%
           k++;
           }
           %>      
           </ul>
        </div>
       </aside>
       </section>
    </div>
</div> 
</section>
<script src="./js/n_main.js?v=<%=date%>"></script>
<%}%>