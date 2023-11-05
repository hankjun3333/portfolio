<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    Date dt2 = new Date();
    SimpleDateFormat sf2 = new SimpleDateFormat("yyyyMMddHHmmss");
    String date2 = sf2.format(dt2);
    %>
    
    <label class="mbship_title">
        <p>MEMBER-LOGIN</p>
        <ul>
          <li>로그인하시면, 회원 별 다양한 맞춤 서비스를 이용하실 수 있습니다.</li>
        </ul>
      </label>
      <form id="f" method="post" action="./loginok.do" onsubmit="return loginok()">
      <fieldset class="mbship_box">
        <span class="agree_span">
        <ul class="mblogin">
            <li><img src="./img/mainlogin.png"></li>
            <li>
                <span>EXPERIENCE OF PRIDE <br> LOGIN</span>
                <span>
                    <ol class="login_ols">
                        <li><input type="text" name="uid" class="login_input" placeholder="아이디를 입력하세요"></li>
                        <li><input type="password" name="upass" class="login_input"  placeholder="패스워드를 입력하세요"></li>
                        <li><button type="submit"  class="login_btn1">로그인</button></li>
                        <li><button type="button" class="login_btn2" onclick="join()">회원가입</button></li>
                        <li style="cursor: pointer;">아이디 찾기 / 비밀번호 찾기</li>
                    </ol>
                </span>
            </li>
        </ul>
        </span>
      </fieldset>
      </form>
      <script src="./js/login_d.js?v=<%=date2%>"></script>