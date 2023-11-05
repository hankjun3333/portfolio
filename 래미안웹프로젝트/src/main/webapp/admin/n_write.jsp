<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    Date dt2 = new Date();
    SimpleDateFormat sf2 = new SimpleDateFormat("yyyyMMddHHmmss");
    String date2= sf2.format(dt2);
    %>
<section class="page_section">
<div class="listbody">
<form id="notice_form" action="./notice_writeok.do" method="post" enctype="multipart/form-data">
    <div class="protitle">공지사항 등록</div>
    <div class="procho">
       <section class="data_listsview">
       <ol>
       <li>공지제목</li>
       <li><input type="text" name="ntitle" class="notice_in in1"></li>
       <li>글쓴이</li>
       <li><input type="text" name="mid" value="${sessionScope.mid}" class="notice_in in2" readonly></li> <li style="height:520px;">내용</li>
       <li style="height:520px; padding-top: 10px;">
       <textarea class="notice_in in3" id="ntext" rows="10" cols="80" name="ntext"></textarea>
       </li>       
       <li>첨부파일</li>
       <li><input type="file" name="nfile2" accept="image/jpeg,image/jpg,image/png"></li>   
       </ol>
       <span class="notice_btns">
       <input type="button" value="글등록" class="meno_btn2" onclick="writeok()"></span>
       </section>
    </div>
</div>
</form> 
</section>
<script src="./ckeditor/ckeditor.js?v=<%=date2%>"></script>
<script>
window.onload = function(){
	CKEDITOR.replace('ntext',{
		height:390
	});
}
</script>
<script src="./js/n_write.js?v=<%=date2%>"></script> 