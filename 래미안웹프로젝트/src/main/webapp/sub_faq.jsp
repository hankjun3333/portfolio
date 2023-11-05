<%@page import="java.util.List"%>
<%@page import="portfolio.faqdto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    List<faqdto> lists = (List<faqdto>)request.getAttribute("lists");
    
    %>
    <label class="mbship_title">
        <p>FAQ</p>
        <ul>
          <li>RAEMIAN 자주묻는 질문</li>
        </ul>
      </label>
<fieldset id="faq_field" class="faq_box">
    <%
    for(int w = 0; w < lists.size(); w++){
    %>
    <ul class="node">
        <li class="questionTitle">질문</li>       
        <li  class="question faq_qe"><%=lists.get(w).getF_question() %></li>
        <li  class="answer_field faq_an" style="display: none;"><%=lists.get(w).getF_answer() %></li>
    </ul>
    <%
    }
    %>
</fieldset>
<script src="./js/sub_faq.js?v=1"></script>