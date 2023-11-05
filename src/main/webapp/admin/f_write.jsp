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
    <div class="protitle">FAQ 등록</div>
    <div class="procho">
    <form id="f" method="post" action="./faq_write">
       <section class="data_listsview">
       <ol>
       <li>질문 제목</li>
       <li><input type="text" name="f_question" class="notice_in in1"></li>
       <li>글쓴이</li>
       <li><input type="text" name="mid" value="${sessionScope.mid}" class="notice_in in2" readonly></li> <li style="height:520px;">질문 내용</li>
       <li style="height:520px; padding-top: 10px;">
       <textarea class="notice_in in3" id="f_answer" name="f_answer" rows="10" cols="80"></textarea>
       </li>      
       </ol>
       <span class="notice_btns">
       <input type="button" value="FAQ 등록" class="meno_btn2" onclick="faq_write()"></span>
       </section>
    </form>
    </div>
</div> 
</section>
<script src="./ckeditor/ckeditor.js?v=<%=date3%>"></script>
<script>
function faq_write(){
	if(f.f_question.value==""){
		alert("제목을 입력해주세요!");
	}
	else{
		f.submit();
	}
}
	window.onload = function(){
		CKEDITOR.replace('f_answer',{
			height:390
		});
	}

</script>