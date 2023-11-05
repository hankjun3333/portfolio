<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    Date dt3 = new Date();
	DateFormat df3 = new SimpleDateFormat("yyMMddhhmmss");
	String date3 = df3.format(dt3);
    %>
<section class="page_section">
<div class="listbody">
    <div class="protitle">환경설정 등록</div>
    <div class="procho">
    <form id="cf" method="post" action="./writeok.do">
       <section class="data_listsview">
       <ol>
       <li>주거타입</li>
       <li><input type="text" name="ctype" class="notice_in in2"> ※ 예) 74A 타입</li>
       <li>글쓴이</li>
       <li><input type="text" class="notice_in in2" name="mid" value="${sessionScope.mid}" readonly></li>
	   <li>주거전용</li>
       <li><input type="text" name="c_private" class="notice_in in2">㎡&nbsp;&nbsp;&nbsp;※ 숫자만 입력하세요</li>
       <li>주거공용</li>
       <li><input type="text" name="c_public" class="notice_in in2">㎡&nbsp;&nbsp;&nbsp;※ 숫자만 입력하세요</li>
       <li>기타공용</li>
       <li><input type="text" name="etc_public" class="notice_in in2">㎡&nbsp;&nbsp;&nbsp;※ 숫자만 입력하세요</li>
       <li>계약면적</li>
       <li><input type="text" name="contract_area" class="notice_in in2">㎡&nbsp;&nbsp;&nbsp;※ 숫자만 입력하세요</li>
       <li>이미지 URL</li>
       <li><input type="text" name="img_url" class="notice_in in1">&nbsp;&nbsp;&nbsp;예시) http://abc.co.kr/123.jpg</li> 
       <li>사용 유/무</li>
       <li>
       <input type="radio" name="cuse" value="Y" class="radio_txt" checked>사용함 
       <input type="radio" name="cuse" value="N" class="radio_txt">사용안함
       </li>
       <li>출력순서</li>
       <li>
       <input type="text" name="display_order" class="notice_in in2">&nbsp;&nbsp;&nbsp;※ 숫자만 입력하세요 단, 동일한 이름일 경우 데이터 등록된 순으로 출력 됩니다.</li>
       </ol>
       <span class="notice_btns">
       <input type="button" value="주거타입 등록" class="meno_btn2" onclick="config_writeok()"></span>
       </section>
       </form>
    </div>
</div>
</section>
<script src="./js/i_write.js?v=<%=date3%>"></script>