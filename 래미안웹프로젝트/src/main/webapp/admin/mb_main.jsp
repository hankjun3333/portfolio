<%@page import="portfolio.userdto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	Date dt4 = new Date();
	SimpleDateFormat sf4 = new SimpleDateFormat("yyMMddHHmmss");
	String date4 = sf4.format(dt4);
    
	List<userdto> lists = (List<userdto>)request.getAttribute("lists");
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
    //out.print(n_page);
    %>
<section class="page_section">
<div class="listbody">
    <div class="protitle">회원 관리</div>
    <div class="procho">
       <section class="search_part">
        <ol >
        <li>회원 검색</li>
        <li>
        <select id="part" name="part" onchange="part_input(this.value)" class="search_select">
       <option value="userid" <%="userid".equals(part_parm) ? "selected" : "" %>>아이디</option>    
	   <option value="username" <%="username".equals(part_parm) ? "selected" : "" %>>이름</option>    
	   <option value="usertel" <%="usertel".equals(part_parm) ? "selected" : "" %>>연락처</option>  
        </select>
        <input type="text" id="sdate2" class="search_input">
        <input type="button" value="검색" class="datebtn" onclick="search_btn()">
        </li>        
        <li></li>
        <li></li> 
        </ol>
       </section> 
       <section class="member_listsview">
       <ul>
        <li>번호</li>
        <li>아이디</li>
        <li>고객명</li>
        <li>연락처</li>
        <li>이메일</li>
        <li>주소</li>
        <li>이메일</li>
        <li>전화</li>
        <li>우편물</li>
        <li>SMS</li>
        <li>삭제</li>
       </ul>
       <%
       int w = 0;
       do{
       %>
       <%if(lists.size() != 0){ %>
       <ul>
        <li><%=cnt-(n_page-1)*20 -w %></li>
        <li><%=lists.get(w).getUid()%></li>
        <li><%=lists.get(w).getUname()%></li>
        <li><%=lists.get(w).getUtel() %></li>
        <li><%=lists.get(w).getUemail() %></li>
        <li style="justify-content: flex-start;"><%=lists.get(w).getUstreet_addr() %></li>
        <li><%=lists.get(w).getMarket_email() %></li>   
        <li><%=lists.get(w).getMarket_tel() %></li>  
        <li><%=lists.get(w).getMarket_post() %></li>   
        <li><%=lists.get(w).getMarket_sms() %></li>   
        <li>
            <input type="button" value="삭제" class="delbtn" onclick="del_btn(<%=lists.get(w).getUidx()%>)">
        </li>
       </ul>
       <%} %>
       <%
       w++;
       }while(w<lists.size());
       %>
       
       <%if(lists.size()==0){ %>
       <ul class="nodatas">
        <li>등록된 회원이 없습니다.</li>
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
<script src="./js/mb_main.js?v=<%=date4%>"></script>