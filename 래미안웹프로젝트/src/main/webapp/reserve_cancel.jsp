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
    if(rdto==null){
    	%>
    	<script>
    	alert('등록된 예약이 없습니다. 예약 먼저 진행해주세요!');
    	location.href='./reservation_in.jsp';
    	</script>
    	<%
    }
	%>
<% if(dto2 == null ) { %>
<script>
    alert("로그인 후 이용바랍니다.");
    location.href="./login.do"; // 로그인 페이지로 리디렉션
</script>
<% }else{ %>
<%
String uid = (String) request.getParameter("userid");

%>

   <label class="mbship_title">
        <p>RESERVATION CANCEL</p>
        <ul>
          <li style="color: red;">※ 예약취소시 해당 데이터는 복구 되지 않습니다.</li>
        </ul>
      </label>
    <form>
      <fieldset class="mbship_box">
        <h3>예약확인</h3>
        <span class="agree_span">
        <ol class="mbinfos">
        <li><em class="ck_font">■</em> 아이디</li>
        <li>hong</li>
        <li><em class="ck_font">■</em> 고객명</li>
        <li>홍길동</li>
        <li><em class="ck_font">■</em> 예약일자</li>
        <li>2023-10-05</li>
        <li><em class="ck_font">■</em> 예약시간</li>
        <li>09:00</li>
        <li><em class="ck_font">■</em> 휴대전화번호</li>
        <li>
        01012345678
        </li>
        <li><em class="ck_font">■</em> 인원수</li>
        <li>
        <label class="ck_label">1명</label>
        </li>
        </ol>
        </span>
        <span class="span_buttons">
        <button type="button" class="next_btn1_1" onclick="reserve_del('<%=uid%>')">예약취소</button>
        </span>
      </fieldset>
    </form>
    <%}%>
    <script src="./js/reserve_cancel.js?v=<%=date3%>"></script>