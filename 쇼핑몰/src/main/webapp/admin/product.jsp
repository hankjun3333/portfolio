<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="admin.productdto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
Date dt =new Date();
SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddHHmmss");
String date = sf.format(dt);
String admin_id = (String) session.getAttribute("aid");
List<productdto> lists = (List<productdto>)request.getAttribute("lists");
String option = (String) request.getParameter("part");
String ct = (String) request.getAttribute("ct");
int count = Integer.parseInt(ct);
if(option == null || option ==""){
	option = "";
}
String search = (String) request.getParameter("search");
if(search == null || search == ""){
	search ="";
}

String now_page= (String) request.getParameter("page");
 %>
 <p>상품관리 페이지</p>
    <div class="subpage_view">
        <span>등록된 상품 <%=ct %>건</span>
        <span>
            <form id="f" method="get" onsubmit="data_search()" action="./admin_product.do">
            <select class="p_select1" name="part">
                <option value="pname" <%= (option.intern() == "pname") ? "selected" : "" %>>상품명</option>
                <option value="pcode" <%= (option.intern() == "pcode") ? "selected" : "" %>>상품코드</option>
            </select>
            <input type="text" name="search" class="p_input1" value="<%=search%>" placeholder="검색어를 입력해 주세요" >
            <input type="submit"  value="검색" title="상품검색" class="p_submit">
            </form>
        </span>
    </div>
    <div class="subpage_view2">
        <ul>
            <li><input type="checkbox" name="all" id ="all" onclick="all_box(this.checked)"></li>
            <li>코드</li>
            <li>이미지</li>
            <li>상품명</li>
            <li>카테고리 분류</li>
            <li>판매가격</li>
            <li>할인가격</li>
            <li>할인율</li>
            <li>재고현황</li>
            <li>판매유/무</li>
            <li>품절</li>
            <li>관리</li>
        </ul>
      <%
      	if(lists.size()==0){
      %>
      <ul>
      	<li style="width: 100%; text-align: center;">등록된 상품이 없습니다.</li>
      </ul>
      <%
      	}else{
    	  int w=0;
    	  while(w < lists.size()){
      %>
      	 <ul><input type="hidden" name="pidx" id="pidxValues" value="<%=lists.get(w).getPidx()%>">
            <li><input type="checkbox" id="ck<%=w%>" name="pidx" onclick="boxes(this.checked)"></li>
            <li><%=lists.get(w).getPid() %></li>
            <li><img src="<%=lists.get(w).getPimg()%>" width="25" height="25"></li> 
            <li><%=lists.get(w).getPname() %></li>
            <li><%=lists.get(w).getPdm() %>/<%=lists.get(w).getPsm() %></li>
            <li><%=lists.get(w).getPmoney() %></li>
            <li><%=lists.get(w).getPsmoney() %></li>
            <li><%=lists.get(w).getPsale() %></li>
            <li><%=lists.get(w).getPnum() %></li>
            <li><%=lists.get(w).getPenum() %></li>
            <li><%=lists.get(w).getPsold() %></li>
            <li>관리</li>
        </ul>
        <%
        w++;
    	  }
      	}
        %>
    </div>
    
    <div class="subpage_view3">
        <ul class="pageing">
            <li onclick="first_page()"><img src="./ico/double_left.svg"></li>
            <li onclick="prev_page(<%=now_page%>-1)"><img src="./ico/left.svg"></li>
				<%
				int w = 1;
				int pg = (int) Math.ceil(count/5f);
				while(w<=pg){
				%>
           		 <li onclick="paging(<%=w%>)"><%=w %></a></li>
				<%
				w++;
				}
				%>

            <li onclick="next_page(<%=now_page%>+1)"><img src="./ico/right.svg"></li>
            <li onclick="final_page(<%=pg%>)"><img src="./ico/double_right.svg"></li>
        </ul>
    </div>
    <div class="subpage_view4">
        <input type="button" id="p_delete"  onclick="pd_delete()" value="선택상품 삭제" title="선택상품 삭제" class="p_button">
        <span style="float: right;">
        <input type="button" id="p_insert" onclick="pd_write()" value="신규상품 등록" title="신규상품 등록" class="p_button p_button_color1">
        </span>
    </div>
 <script>
 window.onload = function(){
	 var adminid = "<%=admin_id%>";
	 if(adminid == "" || adminid=="null"){
		
		 location.href="./index.jsp";
	 }
 }

 function prev_page(z){
	 	if(z < 1){
	 		alert('첫번째 페이지 입니다.');
	 			 		
	 	}
	 	else{
	 		location.href="./admin_product.do?page="+z;
	 	}
	}
 
 function next_page(z){
	
	if(z <= <%=pg%>){
		location.href = "./admin_product.do?page="+z;		
	}
	else{
		alert('마지막 페이지 입니다.');
	}
}
function final_page(z){
	location.href = "./admin_product.do?page="+z;
}
function first_page(){
	location.href="./admin_product.do?page=1";
} 

function boxes(z){

    var i = 0;
    var allck = true;
    var totalListSize = <%=lists.size()%>;
    while (i < totalListSize) {
        if (document.getElementById("ck" + i).checked == false) {
        	allck = false;
        }
        i++;
    }
    if(allck == true){
    	document.getElementById("all").checked = true;
    }
    else if(allck == false){
    	document.getElementById("all").checked = false;
    }
}

function all_box(z){
	console.log(z);
	let checkboxes = document.querySelectorAll('input[name="pidx"]');
	var w =0;
	if(document.getElementById("all").checked == z){
		while(w<checkboxes.length){
			checkboxes[w].checked = z;
			w++;
		}
	}	
}



 </script>   
 <script src="./js/product.js?v=<%=date%>"></script>   