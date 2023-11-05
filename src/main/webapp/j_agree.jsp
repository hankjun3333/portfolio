<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    Date dtt = new Date();
    SimpleDateFormat sff = new SimpleDateFormat("yyyyMMddHHmmss");
    String dates = sff.format(dtt);
    
    %>
    <label class="mbship_title">
        <p>MEMBER-SHIP</p>
        <ul>
          <li>01. 약관동의</li>
          <li><img src="./img/step_on.png" /></li>
          <li>02. 정보입력</li>
          <li><img src="./img/step_off.png" /></li>
          <li>03. 가입완료</li>
        </ul>
      </label>
      <fieldset class="mbship_box">
        <h3>약관동의</h3>
        <span class="agree_span">
        <label class="mbship_text">
          <input type="checkbox" id="all_agree" onclick="allagree(this.checked)" /> 의 모든 약관을 확인하고 전체 동의 합니다.
          (전체동의, 선택항목도 포함됩니다.)
        </label>
        <label class="mbship_text">
            <input type="checkbox" id="agree1" onclick="use_agree(this.checked)"><font color="red"> (필수)</font>이용약관
        </label>
        
        <div id="agree_box1" class="agree_text"></div>
        
        <label class="mbship_text">
            <input type="checkbox" id="agree2" onclick="use_agree(this.checked)"><font color="red"> (필수)</font> 개인정보 수집 및 이용
        </label>
        
        <div id="agree_box2" class="agree_text"></div>
        
        </span>
        <button type="button" class="next_btn" onclick="step1ok()">다음단계</button>
      </fieldset>
      <script src="./js/join_step1.js?v=<%=dates%>"></script>
      
      
      
      
      
      
      
      