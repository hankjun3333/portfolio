<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="portfolio.userdto"%>
<%@page import="java.util.List"%>
<%@page import="portfolio.reservedto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    List<reservedto> lists = (List<reservedto>)request.getAttribute("lists");
    List<userdto> user_lists = (List<userdto>) request.getAttribute("user_lists");
   //String now_date= user_lists.get(0).getUindate().substring(0,10).replaceAll("-", "");
    Date dt77 = new Date();
    SimpleDateFormat sf77 = new SimpleDateFormat("yyyyMMdd");
    String now_date = sf77.format(dt77);
    String userid= (String) session.getAttribute("mid");
    if(userid == null){
    	%>
    	<script>
    	location.href='./index.jsp';
    	</script>
    <%	
    }else{
    %>
<section>
   <div class="ad_top" ></div>
   
 <div class="ad_mainall">
   <div class="ad_main">
<!-- 일반회원 리스트 시작(추가) -->
       <div class="ad_main1">
         <ul>
            <li class="ad_maintitle">일반회원</li>
            <li class="ad_mainbox">
            
            <ol>
                <li>아이디</li>
                <li>고객명</li>
                <li>연락처</li>
                <li>이메일</li>
                <li>주소</li>
            </ol>
            <%
            int kk= 0;
          
            do{
           	 if(user_lists.get(kk).getUindate().substring(0,10).replaceAll("-","").equals(now_date)){
           		 
            %>
            
            <ol class="bgcancel">
                <li><%=user_lists.get(kk).getUid() %></li>
                <li><%=user_lists.get(kk).getUname()%></li>
                <li><%=user_lists.get(kk).getUtel() %></li>
                <li><%=user_lists.get(kk).getUemail() %></li>
                <li style="text-align: left;">(05611) <%=user_lists.get(kk).getUstreet_addr() %></li>
            </ol>
            <%} %>
            <%
            kk++;
            }while(kk<user_lists.size()); %>
            
              
            </li>
         </ul>
      </div>
<!-- 일반회원 리스트 끝(추가) -->
   </div>
   <div class="ad_main">
      <div class="ad_main1">
         <ul>
            <li class="ad_maintitle">1:1 문의사항</li>
            <li class="ad_mainbox"></li>
         </ul>
      </div>
   </div>
   <div class="ad_main">
      <div class="ad_main1">
         <ul>
            <li class="ad_maintitle">예약현황</li>
            <li class="ad_mainbox2">
            <ol>
                <li>아이디</li>
                <li>고객명</li>
                <li>연락처</li>
                <li>예약일자</li>
                <li>예약시간</li>
                <li>예약인원</li>
            </ol>
            <%
            int w = 0;
            do{
            	if(lists.get(w).getRindate().substring(0,10).replaceAll("-","").equals(now_date)){
            %>
            <ol class="bgcancel">
                <li><%=lists.get(w).getUid() %></li>
                <li><%=lists.get(w).getUname() %></li>
                <li><%=lists.get(w).getUtel() %></li>
                <li><%=lists.get(w).getRindate().substring(0,10) %></li>
                <li><%=lists.get(w).getReserve_time().substring(0,2)+":"+ lists.get(w).getReserve_time().substring(2,4)%></li>
                <li><%=lists.get(w).getRnum()%>명</li>
            </ol>
            <%} %>
            <%
            w++;
            }while(w<lists.size());
            %>  
            </li> 
         </ul>
      </div>
   </div>
 </div>
<!-- 관리자 메인 파트 끝 -->
   <div class="ad_botom"></div>
</section>
<%}%>