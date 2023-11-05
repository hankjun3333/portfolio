<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="portfolio.userdto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    Date dt2 = new Date();
    SimpleDateFormat sf2 = new SimpleDateFormat("yyyyMMddHHmmss");
    String date3 = sf2.format(dt2);
	userdto dto2= (userdto) session.getAttribute("userdto");
	%>
<% if(dto2 == null) { %>
<script>
    alert("로그인 후 이용바랍니다.");
    location.href="./login.do"; // 로그인 페이지로 리디렉션
</script>
<% }else{ %>

<!-- 회원가입 화면 시작 -->
    <label class="mbship_title">
        <p>MAKE A RESERVATION</p>
        <ul>
          <li style="color: #000;">※ 예약하실 일자 및 예약자 정보를 입력하세요</li>
        </ul>
      </label>
    <form id="f" method="post" action="./reservationok.do">
      <fieldset class="mbship_box">
        <h3>예약일자 입력 <span style="display: inline-block; font-size: 12px; vertical-align: 5px; float: right;">■ 표시는 필수 입력 항목입니다.</span></h3>
        <span class="agree_span">
        <ol class="mbinfos">
        <li><em class="ck_font">■</em> 아이디</li>
        <li>
        <input type="text" name="uid" value="<%=dto2.getUid()%>" class="mbinput1" readonly>
        </li>
        <li><em class="ck_font">■</em> 고객명</li>
        <li>
        <input type="text" name="uname" value="<%=dto2.getUname()%>" class="mbinput2" readonly>
        </li>
        <li><em class="ck_font">■</em> 예약일자</li>
        <li>
        <input type="date" name="reserve_date" class="mbinput1">
        </li>
        <li><em class="ck_font">■</em> 예약시간</li>
        <li>
        <select id="reserve_time" name="reserve_time" class="mbinput1">
        <option value="">시간선택</option>    
        <option value="0900">09:00</option>        
        <option value="1000">10:00</option>
        <option value="1100">11:00</option>
        <option value="1400">14:00</option>
        <option value="1500">15:00</option>
        <option value="1600">16:00</option>
        <option value="1700">17:00</option>
        </select>
        </li>
        <li><em class="ck_font">■</em> 휴대전화번호</li>
        <li>
        <input type="text" name="utel" value="<%=dto2.getUtel()%>" class="mbinput2" readonly>
        </li>
        <li><em class="ck_font">■</em> 인원수</li>
        <li>
        <label class="ck_label">
        <input type="radio" name="rnum" value="1" class="ck_label" checked> 1명
        </label>
        <label class="ck_label">
        <input type="radio" name="rnum" value="2" class="ck_label"> 2명
        </label>
        </li>
        </ol>
        </span>
        
        <span class="span_buttons">
        <button type="button" class="next_btn1_1" onclick="reserveok()">예약하기</button>
        </span>
      </fieldset>
    </form>
    <script src="./js/reserve.js?v=<%=date3%>"></script>
<%} %>

