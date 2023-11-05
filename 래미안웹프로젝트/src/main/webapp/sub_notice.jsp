<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="portfolio.noticedto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Date dt33 = new Date();
SimpleDateFormat sf33 = new SimpleDateFormat("yyyyMMddHHmmss");
String date22 = sf33.format(dt33);

String cnt = (String) request.getAttribute("cnt");
int count = Integer.parseInt(cnt);
List<noticedto> lists = (List<noticedto>) request.getAttribute("lists");
String now_page = (String) request.getParameter("page");

String value = (String) request.getParameter("ntitle");
int n_page = 1;
if(now_page == null || now_page==""){
	n_page = 1;
}
else{
	n_page = Integer.parseInt(now_page);
}
%>  <form id="f" method="post" onsubmit="return client_search_btn()" action="./client_notice.do">
    <label class="mbship_title">
        <p>NOTICE</p>
        <ul>
          <li>RAEMIAN 새로운 소식을 확인하세요</li>
        </ul>
      </label>
      <fieldset class="mbship_box">
        <ul>
        <li>번호</li>  
        <li>제목</li>  
        <li>조회수</li>     
        <li>글쓴이</li>  
        <li>등록일</li>      
        </ul>

       <%if(lists.size() != 0){%>
       <%
	       int w = 0;
	       do{
       %>      
        <ul>
        <li><%= count-(n_page-1)*10-w%></li>  
        <li style="text-align: left;"><%= lists.get(w).getNtitle()%></li>  
        <li><%=lists.get(w).getNcount()%></li>     
        <li><%= lists.get(w).getMid()%></li>  
        <li><%=lists.get(w).getNindate().substring(0,10) %></li>      
        </ul>  
        <%
       		w++;
	       }while(w<lists.size());
       }
       %>       
       <span class="pages">
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
        </span>
          
        <span class="search_css">
        <input type="text" id="sdate2" name="ntitle" class="search_in" placeholder="검색할 제목을 입력하세요">
        <input type="submit" value="검색" class="search_btn">
        </span>
      </fieldset>
      </form>
    <script src="./js/sub_notice.js?v=<%=date22%>"></script>