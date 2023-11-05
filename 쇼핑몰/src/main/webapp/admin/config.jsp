<%@page import="admin.configdto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="app" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<%

String aid = (String) session.getAttribute("aid");
List<configdto> lists = (List<configdto>) request.getAttribute("sitelist");

%> 
    <p>홈페이지 가입환경 설정</p>
    <form id="configform" method="post" action="./admin_configok.do">
    <div class="subpage_view">
    <ul class="info_form">
        <li>홈페이지 제목</li>
        <li>
            <input type="text" name="title" value="<%=lists.get(0).getTitle() %>" class="in_form1"> 
        </li>
    </ul>    
    <ul class="info_form">
        <li>관리자 메일 주소</li>
        <li>
            <input type="text" name="aemail" value="<%=lists.get(0).getAemail() %>" class="in_form2"> ※ 관리자가 보내고 받는 용도로 사용하는 메일 주소를 입력합니다.(회원가입,인증메일,회원메일발송 등에서 사용)
        </li>
    </ul> 
    <ul class="info_form">
        <li>포인트 사용 유/무</li>
        <li class="checkcss">
            <em>
            <label>
            <input type="radio" name="ptuse" value="Y" class="ckclass" <app:if test="${'Y' eq sitelist.get(0).getPtuse()}">checked</app:if>>포인트 사용</label>
            </em> 
            <em><label><input type="radio" name="ptuse" value="N" class="ckclass" <app:if test="${'N' eq sitelist.get(0).getPtuse()}">checked</app:if> >포인트 미사용</label></em>
        </li>
    </ul>
    <ul class="info_form2" style="border-bottom:1px solid rgb(81, 61, 61);">
        <li>회원가입시 적립금</li>
        <li>
            <input type="text" name="wpoint" value="<%=lists.get(0).getWpoint() %>" class="in_form3" maxlength="5"> 점
        </li>
        <li>회원가입시 권한레벨</li>
        <li>
            <input type="text" name="wlevel" value="<%=lists.get(0).getWlevel() %>" class="in_form3" maxlength="1"> 레벨
        </li>
    </ul> 
    </div>
    <p>홈페이지 기본환경 설정</p>
    <div class="subpage_view">
    <ul class="info_form2">
        <li>회사명</li>
        <li>
            <input type="text" name="comname" value="<%=lists.get(0).getComname()%>" class="in_form0"> 
        </li>
        <li>사업자등록번호</li>
        <li>
            <input type="text" name="comnum" value="<%=lists.get(0).getComnum() %>" class="in_form0"> 
        </li>
    </ul> 
    <ul class="info_form2">
        <li>대표자명</li>
        <li>
            <input type="text" name="ceoname" value="<%=lists.get(0).getCeoname() %>" class="in_form0"> 
        </li>
        <li>대표전화번호</li>
        <li>
            <input type="text" name="cstel" value="<%=lists.get(0).getCstel() %>" class="in_form0"> 
        </li>
    </ul>
    <ul class="info_form2">
        <li>통신판매업 신고번호</li>
        <li>
            <input type="text" name="comfirmno" value="<%=lists.get(0).getComfirmno() %>" class="in_form0"> 
        </li>
        <li>부가통신 사업자번호</li>
        <li>
            <input type="text" name="addno" value="<%=lists.get(0).getAddno() %>" class="in_form0"> 
        </li>
    </ul>
    <ul class="info_form2">
        <li>사업장 우편번호</li>
        <li>
            <input type="text" name="zipcode" value="<%=lists.get(0).getZipcode() %>" class="in_form0"> 
        </li>
        <li>사업장 주소</li>
        <li>
            <input type="text" name="address" value="<%=lists.get(0).getAddress() %>" class="in_form2"> 
        </li>
    </ul>
    <ul class="info_form2" style="border-bottom:1px solid rgb(81, 61, 61);">
        <li>정보관리책임자명</li>
        <li>
            <input type="text" name="masternm" value="<%=lists.get(0).getMasternm() %>" class="in_form0"> 
        </li>
        <li>정보책임자 E-mail</li>
        <li>
            <input type="text" name="masteremail" value="<%=lists.get(0).getMasteremail() %>" class="in_form1"> 
        </li>
    </ul>
    </div>
    <p>결제 기본환경 설정</p>
    <div class="subpage_view">  
    <ul class="info_form2">
        <li>무통장 은행</li>
        <li>
            <input type="text" name="banknm" value="<%=lists.get(0).getBanknm() %>" class="in_form0"> 
        </li>
        <li>은행계좌번호</li>
        <li>
            <input type="text" name="accountno" value="<%=lists.get(0).getAccountno() %>" class="in_form1"> 
        </li>
    </ul>
    <ul class="info_form">
        <li>신용카드 결제 사용</li>
        <li class="checkcss">
            <em><label><input type="radio" name="carduse" value="Y" class="ckclass" <app:if test="${'Y' eq sitelist.get(0).getCarduse()}">checked</app:if> > 사용</label></em> 
            <em><label><input type="radio" name="carduse" value="N" class="ckclass" <app:if test="${'N' eq sitelist.get(0).getCarduse()}">checked</app:if> > 미사용</label></em> ※ 해당 PG사가 있을 경우 사용으로 변경합니다.
        </li>
    </ul>
    <ul class="info_form">
        <li>휴대폰 결제 사용</li>
        <li class="checkcss">
            <em><label><input type="radio" name="teluse" value="Y" class="ckclass" <app:if test="${'Y' eq sitelist.get(0).getTeluse()}">checked</app:if> > 사용</label></em> 
            <em><label><input type="radio" name="teluse" value="N" class="ckclass" <app:if test="${'N' eq sitelist.get(0).getTeluse()}">checked</app:if> > 미사용</label></em> ※ 주문시 휴대폰 결제를 가능하게 할 것인지를 설정합니다.
        </li>
    </ul>
    <ul class="info_form">
        <li>도서상품권 결제사용</li>
        <li class="checkcss">
            <em><label><input type="radio" name="giftuse" value="Y" class="ckclass"  <app:if test="${'Y' eq sitelist.get(0).getGiftuse()}">checked</app:if> > 사용</label></em> 
            <em><label><input type="radio" name="giftuse" value="N" class="ckclass" <app:if test="${'N' eq sitelist.get(0).getGiftuse()}">checked</app:if> > 미사용</label></em> ※ 도서상품권 결제만 적용이 되며, 그 외에 상품권은 결제 되지 않습니다.
        </li>
    </ul>
    <ul class="info_form2">
        <li>결제 최소 포인트</li>
        <li>
            <input type="text" name="minpoint" class="in_form0" value="<%=lists.get(0).getMinpoint() %>" maxlength="5"> 점
        </li>
        <li>결제 최대 포인트</li>
        <li>
            <input type="text" name="maxpoint" class="in_form0" value="<%=lists.get(0).getMaxpoint() %>" maxlength="5"> 점
        </li>
    </ul>
    <ul class="info_form">
        <li>현금 영수증 발급사용</li>
        <li class="checkcss">
            <em><label><input type="radio" name="receipt" value="Y" class="ckclass"> 사용</label></em> 
            <em><label><input type="radio" name="receipt" value="N" class="ckclass" checked> 미사용</label></em> ※ 현금영수증 관련 사항은 PG사 가입이 되었을 경우 사용가능 합니다.
        </li>
    </ul>
    <ul class="info_form2">
        <li>배송업체명</li>
        <li>
            <input type="text" name="shipcom" value="<%=lists.get(0).getShipcom() %>" class="in_form0"> 
        </li>
        <li>배송비 가격</li>
        <li>
            <input type="text" name="shipfee" value="<%=lists.get(0).getShipfee() %>"  class="in_form0" maxlength="7"> 원
        </li>
    </ul>
    <ul class="info_form" style="border-bottom:1px solid rgb(81, 61, 61);">
        <li>희망배송일</li>
        <li class="checkcss">
            <em><label><input type="radio" name="shipdate" value="Y" class="ckclass" <app:if test="${'Y' eq sitelist.get(0).getShipdate()}">checked</app:if>> 사용</label></em> 
            <em><label><input type="radio" name="shipdate" value="N" class="ckclass" <app:if test="${'N' eq sitelist.get(0).getShipdate()}">checked</app:if>> 미사용</label></em> ※ 희망배송일 사용시 사용자가 직접 설정 할 수 있습니다.
        </li>
    </ul>
    </div>
    <div class="btn_div">
        <button type="button" class="sub_btn1" title="설정 저장" onclick="config_btn()">설정 저장</button>
        <button type="button" class="sub_btn2" title="저장 취소" onclick="config_cancel()">저장 취소</button>
    </div>
    </form>
    <script>
	window.onload = function(){    
		var adminid = "<%=aid%>";
		if(adminid =="" || adminid=="null"){
			location.href="./index.jsp";
		}
	}
    
    function config_btn(){
    	configform.submit();
    }
    function config_cancel(){
    	alert('정말 저장을 취소하시겠습니까? 상품관리페이지로 이동합니다.');
    	location.href="./admin_product.do";
    }
    
    
    
    
    </script>