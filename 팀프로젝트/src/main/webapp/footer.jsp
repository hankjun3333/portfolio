<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="footer">
      <a href="http://facebook.com">
        <img src="images/facebook.png"height="20">
      </a>
      <a href="http://instagram.com">
        <img src="images/instagram.png"height="20">
      </a>
      <a href="http://twitter.com">
        <img src="images/twitter.png"height="20">
      </a>
    </div>
    <section class="foot_section"></section>
    <aside class="aside_footer">
        <div class="div_footer">
        <ul>
        <li><a style="cursor: pointer;" href="./index.do"><img src="./images/foot_logo.png"></a></li>
        <li>
회사명 : ${site.get(0).getComname()} 
대표자 : ${site.get(0).getCeoname()} 
주소 : ${site.get(0).getAddress()}  <br>
고객센터 : ${site.get(0).getCstel()}
상담시간 : 09:00 ~ 18 : 00
E-Mail : ${site.get(0).getMasteremail()} 
사업자등록번호 : ${site.get(0).getComnum()} <br>
통신판매업신고번호 : ${site.get(0).getComfirmno()}
개인정보보호책임자 : ${site.get(0).getMasternm()}  <br>
Copyright © 도메인명 All Rights Reserved.
        </li>
        </ul>    
        </div>
    </aside>