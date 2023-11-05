<%@page import="admin.productdto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    List<productdto> lists = (List<productdto>)request.getAttribute("product");
    
    %>
 <div class="hero-header"></div>  
    <div class="products">
      <h3>NEW PRODUCTS</h3>
	  <%
	  int w = 0;
	  while(w<lists.size()){
		  
	  
	  %>
      <div class="product-list">
        <a href="#" class="product">
          <img src="<%=lists.get(w).getPimg()%>" width="225" height="225">
          <div class="product-name">
           <%=lists.get(w).getPname()%><br>
           <%=lists.get(w).getPmoney()%> / <%=lists.get(w).getPsmoney() %> 
          </div>
          <div class="product-price">
          </div>
        </a>
		<%
		w++;
	  }
		
		%>
        <div class="clearfix"></div>
      </div>
    </div>