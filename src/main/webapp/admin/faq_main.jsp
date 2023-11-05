<%@page import="portfolio.faqdto"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ taglib prefix="app" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	Date dt3 = new Date();
	DateFormat df3 = new SimpleDateFormat("yyMMddhhmmss");
	String date33 = df3.format(dt3);
	List<faqdto> lists = (List<faqdto>) request.getAttribute("lists");
	String count = (String) request.getAttribute("ct");
	int totalcount = Integer.parseInt(count);
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
	<%}else{%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/page_default.css?v=<%=date33%>">
<link rel="stylesheet" href="./css/admin_css.css?v=<%=date33%>">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap">
<!-- 신규추가된 css 파일 -->
<link rel="stylesheet" href="./css/notice.css?v=<%=date33%>">
<!-- 신규추가된 css 파일 끝-->
<title>관리자 페이지</title>
<script>
</script>
</head>
<body>
<nav>
<%@ include file="./menu.jsp" %>
</nav>
<!-- FAQ 리스트 시작 -->

<main class="page_main">
<form id="f" method="get" action="./faq_main.do">
<section class="page_section">
<div class="listbody">
    <div class="protitle">FAQ 관리</div>
    <div class="procho">
       <section class="search_part">
        <ol>
        <li>FAQ내용 검색</li>
        <li>
        <input type="text" id="search_data" name="f_question" class="search_input">
        <input type="button" value="검색" class="datebtn" onclick="search_btn()">
        </li>        
        <li></li>
        <li></li> 
        </ol>
       </section> 
       <section class="data_listsview2">
       <ul>
        <li>QA</li>
        <li>질문/답변</li>
        <li>글쓴이</li>
        <li>등록일</li>
        <li>삭제</li>
       </ul>
          
<!-- FAQ 샘플 HTML 코드 시작 -->       

     <span id="faq_span">
	<%
	int w = 0;
	do{
	%>
	<%if(lists.size() != 0){ %>
       <ul class="node">
        <li>Q</li>
        <li style="text-align: left; justify-content: flex-start;"><%=lists.get(w).getF_question() %></li>
        <li>관리자</li>
        <li><%=lists.get(w).getFindate().substring(0,10)%></li>
        <li>
        <input type="button" value="삭제" class="delbtn" onclick="del_btn(<%=lists.get(w).getFidx()%>)">
        </li>
       </ul>
      <!-- display:none 또는 display:flex 로 해야합니다. -->
       <ol style="display: none;">
        <li>A</li>
        <li style="text-align: left; justify-content: flex-start;"><%=lists.get(w).getF_answer() %></li>
       </ol> 
       <%} %>
	<%
	w++;
	}while(w<lists.size());
	%>       
      </span> 
</form>
<!-- FAQ 샘플 HTML 코드 끝 -->          
		<%
		if(lists.size()==0){
		%>        
       <ul class="nodatas">
        <li>등록된 FAQ 내용 없습니다.</li>
       </ul>
       <%
		}
       %>
       <span class="notice_btns">
       <input type="button" value="FAQ 등록" class="meno_btn2" onclick="write_btn()"></span>
       <aside>
        <div class="page_number">
           <ul>
 			<%
 			int pg = (int) Math.ceil(totalcount/10f);
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
</main>
<!-- FAQ 리스트 끝 -->
<footer>
<%@ include file="./footer.jsp" %>    
</footer>
</body>
<script src="./js/faq_main.js?v=<%=date33%>"></script>
</html>
<%}%>