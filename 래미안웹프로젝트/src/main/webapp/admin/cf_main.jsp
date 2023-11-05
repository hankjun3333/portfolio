<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="portfolio.memberdto"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="app" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<memberdto> lists = (List<memberdto>)request.getAttribute("lists");
	Date dt2 = new Date();
	SimpleDateFormat sf2 = new SimpleDateFormat("yyMMddHHmmss");
	String date2 = sf2.format(dt2);
	String totalcount = (String) request.getAttribute("totalcount");
	//out.print(totalcount);
	String now_page = (String) request.getParameter("page");
	if(now_page == null || now_page==""){
		now_page = "1"; 
	}
	String now_area = (String) request.getParameter("area");
	String part = (String) request.getParameter("search_part");
	
	String userid= (String) session.getAttribute("mid");
	if(userid == null){
		%>
		<script>
		location.href='./index.jsp';
		</script>
		<% } else{%>

<!-- 관리자 리스트 시작 -->
<section class="page_section">
<form id="frm" name="frm" method="post" onsubmit="return member_search()" action="./config_main.do">    
<div class="listbody">
 <div class="adlisttitle">관리자 현황</div>
 <div class="procho">
    <ul>
        <li class="prochoL procfont">소속</li>
        <li class="prochoL">
            <select class="adlistcsel1" id="mb_area" name="marea" onchange="area_list(this.value)">
            <option id="all" value="all">전체</option>
                <option value="본사" <% if ("본사".equals(now_area)) { %>selected<% } %>>본사</option>
                <option value="경기도" <% if ("경기도".equals(now_area)) { %>selected<% } %>>경기도</option>
                <option value="인천" <% if ("인천".equals(now_area)) { %>selected<% } %>>인천</option>
                <option value="대전" <% if ("대전".equals(now_area)) { %>selected<% } %>>대전</option>
                <option value="세종" <% if ("세종".equals(now_area)) { %>selected<% } %>>세종</option>
                <option value="광주" <% if ("광주".equals(now_area)) { %>selected<% } %>>광주</option>
                <option value="대구" <% if ("대구".equals(now_area)) { %>selected<% } %>>대구</option>
                <option value="울산" <% if ("울산".equals(now_area)) { %>selected<% } %>>울산</option>
                <option value="전라남도" <% if ("전라남도".equals(now_area)) { %>selected<% } %>>전라남도</option>
                <option value="전라북도" <% if ("전라북도".equals(now_area)) { %>selected<% } %>>전라북도</option>
                <option value="충청남도" <% if ("충청남도".equals(now_area)) { %>selected<% } %>>충청남도</option>
                <option value="충청북도" <% if ("충청북도".equals(now_area)) { %>selected<% } %>>충청북도</option>
                <option value="경상남도" <% if ("경상남도".equals(now_area)) { %>selected<% } %>>경상남도</option>
                <option value="경상북도" <% if ("경상북도".equals(now_area)) { %>selected<% } %>>경상북도</option>
                <option value="제주도" <% if ("제주도".equals(now_area)) { %>selected<% } %>>제주도</option>  
            </select>
        </li>
    </ul>
 </div>
 <div class="procho">
    <ul>
        <li class="prochoL procfont">검색형식</li>
        <li class="prochoL">
            <select class="adlistcsel1" id="search_part" name="search_part" onchange="member_part(this.value)">
                <option value="mname" <% if ("mname".equals(part)) { %>selected<% } %>>이름</option>
                <option value="mid" <% if ("mid".equals(part)) { %>selected<% } %>>아이디</option>
                <option value="mtel" <% if ("mtel".equals(part)) { %>selected<% } %>>연락처</option>
            </select>
        </li>
        <li class="prochoL"><input type="text" id="user_input" name="usertext" onkeyup="user_text()" class="adlistcsel1"></li>
        <li class="prochoL"><input type="submit" class="proclick"  value="검색"></li>
        <li class="prochoL"><button type="button" class="proclick" onclick="first_page()">전체</button></li>
    </ul>
 </div>
 <div class="protaball">
    <table width="1100">
        <thead>
            <tr style="color: white; background-color:rgb(67, 66, 66);">
                <td class="listcenter" width=50>NO</td>
                <td class="listcenter" width=150>구분</td>
                <td class="listcenter" width=150>아이디</td>
                <td class="listcenter" width=120>이름</td>
                <td class="listcenter" width=80>직책</td>
                <td class="listcenter" width=200>이메일</td>
                <td class="listcenter" width=120>연락처</td>
                <td class="listcenter" width=120>현황</td>
                <td class="listcenter" width=110>적용</td>
            </tr>
        </thead>
        <tbody>
        <%if(lists.size()==0){ %>
            <tr style="height: 30px;">
            	<td class="listcenter" colspan="9">등록된 관리자가 없습니다.</td>
            </tr>
            <%}else{ %>
            <app:forEach var="w" begin="0" end="${fn:length(lists)-1}" step="1">
            <app:set var="now" value="<%=now_page%>"></app:set>
            <app:set var="ww" value="${totalcount-(now-1)*10}"></app:set>
            <tr id="master_list" class="master_list">
                <td class="listcenter" width=50>${ww-w}</td>
                <td class="listcenter" id="admin_dept" width=150>${lists.get(w).getMdept()}</td>
                <td class="listcenter" id="admin_mid" width=150>${lists.get(w).getMid()}</td>
                <td class="listcenter" id="admin_mname" width=120>${lists.get(w).getMname()}</td>
                <td class="listcenter" id="admin_mlevel" width=80>${lists.get(w).getMlevel()}</td>
                <td class="listcenter" id="admin_memail" width=200>${lists.get(w).getMemail()}</td>
                <td class="listcenter" id="admin_mtel" width=120>${lists.get(w).getMtel()}</td>
                <td class="listcenter" width=120>
            <app:set var="ww" value="${ww-1}"></app:set>    
                    <select name="muse" id="member_muse" onchange="useck(this.value)" class="adlistsel3">
					<app:choose>
	                    <app:when test="${lists.get(w).getMuse() == 'Y'}">
	                        <option value="Y" selected>근무중</option>
	                        <option value="N">퇴직중</option>
	                    </app:when>
	                    <app:otherwise>
	                        <option value="Y">근무중</option>
	                        <option value="N" selected>퇴직중</option>
	                    </app:otherwise>
	                </app:choose> 
	                </select>   
                </td>
                <td class="listcenter" width=110>	
                <button type="button" class="listclick" onclick="user_usebtn(${lists.get(w).getMidx()})">적용</button></td>
            </tr>
            <!-- 갯수 하나씩 감소! -->
			</app:forEach>
        </tbody>
    </table>
 </div>
<%} %>
 <div class="propagebt">
    <ul>
        <li onclick="paging(<%=now_page%>-1,'<%=now_area%>')"> < </li>
        <app:forEach varStatus="no" begin="1" end="${totalcount % 10 == 0 ? totalcount/10 : (totalcount/10) + 1}" step="1">
        <li id="indexnum" onclick="paging(${no.index})"> ${no.index}</li>
        </app:forEach>
        <li style="margin-right: 0px;" onclick="paging2(<%=now_page%>+1)"> > </li>
        <input type="hidden" id="pagenum" value="<%=now_page%>">
    </ul>
 </div>
</div>
</form>
<!-- 관리자 리스트 끝 -->    
</section>
<script src="./js/cf_main.js?v=<%=date2%>"></script>
<%}%>