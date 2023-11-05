<%@page import="admin.datadto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String admin = (String) session.getAttribute("aid");
List<datadto> datalist = (List<datadto>) request.getAttribute("datalist");

%>

    <p>회원 리스트</p>
    <ol class="new_admin_title">
        <li>NO</li>
        <li>고객명</li>
        <li>아이디</li>
        <li>전화번호</li>
        <li>이메일</li>
        <li>이메일 수신</li>
        <li>SMS 수신</li>
        <li>가입일자</li>
        <li>상태</li>
        <li>정지여부</li>
    </ol>
    
    <%
    if(datalist == null ||datalist.size() == 0){
    %>
    <ol class="new_admin_none">
        <li>가입된 회원이 없습니다.</li>
    </ol>
        <%
    }else{
    	 String count = (String) request.getAttribute("ct");
    	int ct = Integer.parseInt(count);
        int w = 0;
    	do{
   		 %>
    <ol class="new_admin_lists">
        <li><%=ct-w%></li>
        <li><%=datalist.get(w).getMname()%></li>
        <li><%=datalist.get(w).getMid()%></li>
        <li><%=datalist.get(w).getMtel()%></li>
        <li><%=datalist.get(w).getMemail()%></li>
        <li><%=datalist.get(w).getEmail_use()%></li>
        <li><%=datalist.get(w).getSms_use()%></li>
        <li><%=datalist.get(w).getMdate().substring(0, 10)%></li>
        <li><%=datalist.get(w).getMuse()%></li>
        <li>
    <form id="useform" method="get" action="./admin_mainok.do">
        <input type="hidden" id="midx" name="midx" value="">
       	 <input type="hidden" id="muse" name="muse" value="">
            <input type="button" value="정지" onclick="use_no('N','<%=datalist.get(w).getMidx()%>')" class="new_addbtn1" title="정지">
            <input type="button" value="해제" onclick="use_yes('Y','<%=datalist.get(w).getMidx()%>')" class="new_addbtn2" title="해제">
        </li>
    </ol>
    </form>
  	<%
		w++;
    	}while(w<datalist.size());
    }
	%>
<script>
	window.onload = function(){    
		var adminid = "<%=admin%>";
		if(adminid =="" || adminid=="null"){
			
			location.href="./index.jsp";
		}
	}
	
	</script> 
	<script src="./js/main.js?v=1"></script> 
 