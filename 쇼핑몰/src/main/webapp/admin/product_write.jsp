<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.fasterxml.jackson.databind.module.SimpleAbstractTypeResolver"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    Date df2 = new Date();
    SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddHHmmss");
    String date = sf.format(df2);
    %>
  <p>상품 등록 페이지</p>
<form id ="f" method="post" action="./p_insert.do" onsubmit="return abc()" enctype="multipart/form-data">
 
	<div class="product_insert">
	
	    <ul>
	        <li>대메뉴 카테고리</li>
	        <li>
	            <input type="text" name ="pdm" class="product_input1"> 
	        </li>
	    </ul>
	    <ul>
	        <li>소메뉴 카테고리</li>
	        <li>
	            <input type="text" name ="psm" id ="psm" class="product_input1" > 
	        </li>
	    </ul>
	    <ul>
	        <li>상품코드</li>
	        <li>
	            <input type="text" name ="pid" id ="pid" class="product_input1"> 
	            <input type="button" value="중복확인" title="중복확인" onclick="ajax_code()" class="product_btn" name="pck" id="pck"> <span class="help_text">※ 상품코드는 절대 중복되지 않도록 합니다.</span>
	        </li>
	    </ul>
	    <ul>
	        <li>상품명</li>
	        <li>
	            <input type="text" class="product_input2" maxlength="100" name ="pname" id ="pname"> <span class="help_text">※ 상품명은 최대 100자까지만 적용할 수 있습니다.</span>
	        </li>
	    </ul>
	    <ul>
	        <li>상품 부가설명</li>
	        <li>
	            <input type="text" class="product_input4" maxlength="200" name ="ptext" id ="ptext"> <span class="help_text">※ 상품명은 최대 200자까지만 적용할 수 있습니다.</span>
	        </li>
	    </ul>
	    <ul>
	        <li>판매가격</li>
	        <li>
	            <input type="text" class="product_input3" onchange="b(this.value)"maxlength="7" name ="pmoney" id ="pmoney" value="0"> <span class="help_text">※ , 없이 숫자만 입력하세요 최대 7자리</span>
	        </li>
	    </ul>
	    <ul>
	        <li>할인율</li>
	        <li>
	            <input type="text" class="product_input3" onchange="a(this.value)" maxlength="2" value="0" name ="psale" id ="psale">% <span class="help_text">※ 숫자만 입력하세요</span>
	        </li>
	    </ul>
	    <ul>
	        <li>할인가격</li>
	        <li>
	            <input type="text" class="product_input3" onchange="c()"  maxlength="7" value="0" name ="psmoney" id ="psmoney" readonly="readonly"> <span class="help_text">※ 할인율이 0%일 경우 할인가격은 0으로 처리 합니다.</span>
	            
	        </li>
	    </ul>
	    <ul>
	        <li>상품재고</li>
	        <li>
	            <input type="text" name ="pnum" id ="pnum" class="product_input3" maxlength="4" value="0">EA <span class="help_text">※ 숫자만 입력하세요. 재고가 0일 경우 soldout이 됩니다.</span>
	        </li>
	    </ul>
	    <ul>
	        <li>판매 유/무</li>
	        <li>
	            <label class="product_label">
	            <input type="radio" name="penum" value="Y"  style="vertical-align:-1px;" checked> 판매시작
	            </label>
	            <label class="product_label">
	            <input type="radio" name="penum" value="N" style="vertical-align:-1px;"> 판매종료
	            </label> <span class="help_text">※ 숫자만 입력하세요. 재고가 0일 경우 soldout이 됩니다.</span>
	           
	        </li>
	    </ul>
	    <ul>
	        <li>조기품절</li>
	        <li>
	            <label class="product_label">
	                <input type="radio" name="psold" style="vertical-align:-1px;" value="Y"> 사용
	            </label>
	            <label class="product_label">
	                <input type="radio" name="psold" style="vertical-align:-1px;" value="N" checked> 미사용
	            </label>
	            
	        </li>
	    </ul>
	    <ul style="height: 160px;">
	        <li>상품 대표이미지</li>
	        <li>
	            <ol style="width:100%; height: auto;">
	            <li style="width:100%; height:45px;">
	            <input type="file" name ="pimg1">
	            <span class="help_text">※ 상품 대표이미지 이며, 이미지 용량은 2MB 까지 입니다.</span>
	            </li>
	            </ol>
	        </li>
	    </ul>
	    <ul style="height: 400px;">
	        <li>상품 상세설명</li>
	        <li>
	            <textarea class="product_text1" name ="ptext1" id ="ptext1"></textarea>
	        </li>
	    </ul>
	</div>
	<div class="subpage_view4" style="text-align:center;">
	    <input type="button" id = "list1" value="상품 리스트" title="상품 리스트" class="p_button p_button_color1" style="margin-right: 5px;">
	    <input type="submit"  value="상품 등록" title="상품 등록" class="p_button p_button_color2">
	   
	</div>
</form>
<script src="./js/product_list.js?v=<%=date%>"></script>