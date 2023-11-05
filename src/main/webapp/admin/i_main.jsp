<%@page import="portfolio.configdto"%>
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
	List<configdto> lists = (List<configdto>) request.getAttribute("lists");
	int cnt = (int) request.getAttribute("cnt");
	String now_page = (String) request.getParameter("page");
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
	<%}else{ %>	
	
    
<section class="page_section">
<div class="listbody">
    <div class="protitle">환경설정 관리</div>
    <div class="procho">
       <section class="search_part">
        <ol>
        <li>세대정보 검색</li>
        <li>
        <input type="text" id="sdate2" class="search_input">
        <input type="button" value="검색" class="datebtn" onclick="type_btn()">
        </li>        
        <li></li>
        <li></li> 
        </ol>
       </section> 
       <section class="data_listsview">
       <ul>
        <li>번호</li>
        <li>세대타입 및 면적</li>
        <li>사용 유/무</li>
        <li>출력순서</li>
        <li>글쓴이</li>
        <li>등록일</li>
        <li>삭제</li>
       </ul>
       <%if(lists.size()==0 || lists.isEmpty()){ %>
       <ul class="nodatas">
        <li>등록된 세대타입 내용이 없습니다.</li>
       </ul>
        <%}else{ %>
    	
       <%
       int w =0;
       do{
       %>
       <ul style="height:140px;">
        <li><%=cnt-(n_page-1)*4 -w %></li>
        <li style="text-align: left; justify-content: flex-start;">
        <div class="info_img">
        <img src="<%=lists.get(w).getImg_url()%>" width="150" height="90">  
        </div>
        <div class="info_text">
        <span>주거타입 : <%=lists.get(w).getCtype()%></span>
        <span>주거전용 : <%=lists.get(w).getC_private()%>m²</span>
        <span>주거공용 : <%=lists.get(w).getC_public()%>m²</span>
        <span>기타공용 : <%=lists.get(w).getEtc_public()%>m²</span>
        <span>계약면적 : <%=lists.get(w).getContract_area()%>m²</span>
        </div>
        </li>
        <%if(lists.get(w).getCuse().equals("Y")){ %>
        <li>O</li>
        <%}else{ %>
        <li>X</li>
        <%} %>
        <li><%=lists.get(w).getDisplay_order()%></li>
        <li><%=lists.get(w).getMid()%></li>
        <li><%=lists.get(w).getCindate().substring(0,10)%></li>
        <li>
            <input type="button" value="삭제" class="delbtn" onclick="del_btn(<%=lists.get(w).getCidx()%>)">
        </li>
       </ul>
       <%
       w++;
       }while(w<lists.size());
       
       %>
       <span class="notice_btns">
       <input type="button" value="세대타입 생성" class="meno_btn2" onclick="config_write()"></span>
       <aside>
        <div class="page_number">
           <ul>
           <%
           int pg = (int) Math.ceil(cnt/4f);
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
<script src="./js/i_main.js?v=<%=date2%>"></script>
<%}%>
<%}%>