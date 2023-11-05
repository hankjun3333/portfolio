<%@page import="portfolio.reservedto"%>
<%@page import="portfolio.userdto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    Date dt2 = new Date();
    SimpleDateFormat sf2 = new SimpleDateFormat("yyyyMMddHHmmss");
    String date3 = sf2.format(dt2);
    userdto dto2= (userdto) session.getAttribute("userdto");
    reservedto rdto = (reservedto) request.getAttribute("rdto");
    String user_date = null;
    if(rdto == null){
    	%>
    	<script>
    	alert('등록된 예약이 없습니다. 예약먼저 진행 해주세요!!');
    	location.href='./reservation_in.jsp';
    	</script>
    <%	
    }else {
    
    user_date = (String) rdto.getReserve_date().substring(0,10);
    }
	%>
<% if(dto2 == null || rdto == null) { %>
<script>
    alert("로그인 후 이용바랍니다.");
    location.href="./login.do"; // 로그인 페이지로 리디렉션
</script>
<% }else{ %>
    
    <label class="mbship_title">
        <p>RESERVATION CONFIRM</p>
        <ul>
          <li style="color: red;">※ 예약수정은 1회 변경 가능 합니다.</li>
        </ul>
      </label>
    <form id="f" method="post" action="./reserve_ck">
      <fieldset class="mbship_box">
        <h3>예약확인 <span style="display: inline-block; font-size: 12px; vertical-align: 5px; float: right;">■ 표시는 필수 입력 항목입니다.</span></h3>
        <span class="agree_span">
        <ol class="mbinfos">
        <li><em class="ck_font">■</em> 아이디</li>
        <li>
        <input type="text" name="uid" value="<%=dto2.getUid()%>" class="mbinput1" readonly>
        </li>
        <li><em class="ck_font">■</em> 고객명</li>
        <li>
        <input type="text" name="uname" value="<%=dto2.getUname() %>" class="mbinput2" readonly>
        </li>
        <li><em class="ck_font">■</em> 예약일자</li>
        <li>
        <input type="date" name="reserve_date" value="<%=user_date %>" class="mbinput1">
        </li>
        <li><em class="ck_font">■</em> 예약시간</li>
        <li>
        <select id="reserve_time" name="reserve_time" class="mbinput1">
        <option value="">시간선택</option>    
        <option value="0900" <%if(rdto.getReserve_time().equals("0900")){ %>selected<%} %>>09:00</option>        
        <option value="1000" <%if(rdto.getReserve_time().equals("1000")){ %>selected<%} %>>10:00</option>
        <option value="1100" <%if(rdto.getReserve_time().equals("1100")){ %>selected<%} %>>11:00</option>
        <option value="1400" <%if(rdto.getReserve_time().equals("1400")){ %>selected<%} %>>14:00</option>
        <option value="1500" <%if(rdto.getReserve_time().equals("1500")){ %>selected<%} %>>15:00</option>
        <option value="1600" <%if(rdto.getReserve_time().equals("1600")){ %>selected<%} %>>16:00</option>
        <option value="1700" <%if(rdto.getReserve_time().equals("1700")){ %>selected<%} %>>17:00</option>
        </select>
        </li>
        <li><em class="ck_font">■</em> 휴대전화번호</li>
        <li>
        <input type="text" name="utel" value="<%=rdto.getUtel()%>" class="mbinput2" readonly>
        </li>
        <li><em class="ck_font">■</em> 인원수</li>
        <li>
      	
        <label class="ck_label">
        <input type="radio" name="rnum" value="1" class="ck_label" <%if(Integer.parseInt(rdto.getRnum())==1){ %> checked<%} %>> 1명
        </label>
     	
        <label class="ck_label">
        <input type="radio" name="rnum" value="2" class="ck_label" <%if(Integer.parseInt(rdto.getRnum())!=1){ %> checked<%} %>> 2명
        </label>
     	
        </li>
        </ol>
        </span>
        <span class="span_buttons">
        <%if(Integer.parseInt(rdto.getRcount())==1 ){ %>
        <button type="button" class="next_btn1_1" onclick="reserve_update()">예약수정</button>
        <%} %>
        </span>
      </fieldset>
    </form>
<% }  %>
<script src="./js/reserve_ck.js?v=<%=date3%>"></script>