<%@page import="dto.ProductDto"%>
<%@page import="dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body onload="init();">
<%@ include file="../menu.jsp" %>
<%
	if(request.getParameter("gotocart")!=null){
		int gotocart = Integer.parseInt(request.getParameter("gotocart"));
		if(gotocart==1){
			response.sendRedirect("http://localhost:6060/web-prac2/product/cart.jsp");
		}
	}

	int id = -1;
	if(request.getParameter("id")!=null){
		id = Integer.parseInt(request.getParameter("id"));
	}
	
	ProductDao dao = ProductDao.getInstance();
	ProductDto dto = dao.getProduct(id);
%>

<div class="container">
	<div class="row">
		<div class="col-md-5">
			<img src="http://localhost:6060/web-prac2/upload/<%=dto.getFile() %>" style="width:100%;">
		</div>
	
		<div class="col-md-7">
		
			<% if (dto.getCondition()==1){
				
				
					
			%>	<p>New Product</p>
				
			
			<%} %>
			
		
			<p><%=dto.getManufacturer() %></p>
			<h3><%=dto.getName() %></h3>
			
			
			<p><%=df.format(dto.getPrice()) %></p>
			
			<form name="form" method="post" action="cartController.jsp">
				<input type="hidden" name="id" value="<%=dto.getId() %>">
				<input type="hidden" name="stock" value="<%=dto.getStock() %>">
				<input type="hidden" name="sell_price" value="<%=dto.getPrice() %>">
				<p>
					Amount
					<input type="button" value="+" onclick="increase();">
					<input type="text" name="amount" value="1" size="3">
					<input type="button" value="-" onclick="decrease();">
				</p>
				<p>
					Total : <input type="text" name="sum" size="10" readonly="readonly"> won
				</p>
				<br>
				<a href="#" class="btn btn-success" onclick="addtocart();">shoppingcart</a>
				<a href="#" class="btn btn-success">purchase</a>
			
			</form>
			
		</div>
	
	</div>

</div>

<%@ include file="../footer.jsp" %>
</body>
</html>