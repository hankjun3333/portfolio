<%@page import="portfolio.reservedto"%>
<%@page import="portfolio.userdto"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	Date dt4 = new Date();
	SimpleDateFormat sf4 = new SimpleDateFormat("yyMMddHHmmss");
	String date4 = sf4.format(dt4);
    
	List<reservedto> lists = (List<reservedto>)request.getAttribute("lists");
    String count = (String) request.getAttribute("count");
    //out.print(count);
    int cnt = Integer.parseInt(count); 
    
    String part_parm = (String) request.getParameter("part");
    //out.print(part_parm);
    
    String pages = (String) request.getParameter("page");
    if(pages ==null){
    	pages = "1";
    }
    int n_page = Integer.parseInt(pages);
    
    String userid= (String) session.getAttribute("mid");
    if(userid==null){
    	%>
    	<script>
    	location.href='./index.jsp';
    	</script>
    	<%}else{ %>
    
<main class="page_main">
<section class="page_section">
<div class="listbody">
    <div class="protitle">사전예약 회원 관리</div>
    <div class="procho">
       <section class="search_part">
        <ol >
        <li>회원 검색</li>
        <li>
        <select id="part" name="part" class="search_select" onchange="part_input(this.value)">
        <option value="userid" <%="userid".equals(part_parm) ? "selected" : "" %>>아이디</option>    
        <option value="username" <%="username".equals(part_parm) ? "selected" : "" %>>이름</option>    
        <option value="usertel" <%="usertel".equals(part_parm) ? "selected" : "" %>>연락처</option>    
        </select>
        <input type="text" id="sdate2" class="search_input">
        <input type="button" value="검색" onclick="search_btn()" class="datebtn">
        </li>        
        <li></li>
        <li></li> 
        </ol>
       </section> 
       <section class="reserve_listsview">
       <ul>
        <li>번호</li>
        <li>아이디</li>
        <li>고객명</li>
        <li>연락처</li>
        <li>예약일자</li>
        <li>예약시간</li>
        <li>인원수</li>
        <li>예약취소</li>
       </ul>
       
       <%
       int w = 0;
       do{
       %>
       <%if(lists.size() != 0){ %>
       <ul>
        <li><%=cnt-(n_page-1)*20 -w %></li>
        <li><%=lists.get(w).getUid() %></li>
        <li><%=lists.get(w).getUname() %></li>
        <li><%=lists.get(w).getUtel() %></li>
        <li><%=lists.get(w).getReserve_date().substring(0,10)%></li>
        <li><%=lists.get(w).getReserve_time().substring(0, 2) 
        + ":" + lists.get(w).getReserve_time().substring(2, 4)%></li>
        <li><%=lists.get(w).getRnum() %></li>    
        <li>
            <input type="button" value="취소" class="delbtn" onclick="del_btn(<%=lists.get(w).getRidx()%>)">
        </li>
       </ul>
       <%} %>
       <%
       w++;
       }while(w<lists.size());
       %>
       
       <%if(lists.size()==0){ %>
       <ul class="nodatas">
        <li>사전예약 신청 회원이 없습니다.</li>
       </ul>
       <%} %>
       <aside>
        <div class="page_number">
           <ul>
           <%
           int pg = (int) Math.ceil(cnt/20f);
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
<script src="./js/res_main.js?v=<%=date4%>"></script>
<% } %>