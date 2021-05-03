<%@page import="dto.ProductDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../menu.jsp" %>
<%
	
	ArrayList<ProductDto> list = (ArrayList<ProductDto>) session.getAttribute("cartlist");
	if(list==null){
		list = new ArrayList<ProductDto>();
		session.setAttribute("cartlist",list);
	}
%>

<div class="container">
	<table class="table table-hover">
		<tr>
			<th>image</th>
			<th>name</th>
			<th>amount</th>
			<th>delivery fee</th>
			<th>price</th>
			<th>notes</th>
		</tr>
		<%
			int total=0;	
		
			if(list.size()==0){%>
				<tr style="text-align:center;"><td colspan="6">The cart is empty.</td></tr>
			<% }
			else{
				for(int i=0;i<list.size();i++){
					ProductDto temp = list.get(i);
					int sum = temp.getCartamount()*temp.getPrice();
					total += sum;
			
			%>
		<tr>
			<td><img alt="" src="../upload/<%=temp.getFile() %>" width="75px"></td>
			<td><%=temp.getName() %></td>
			<td><%=temp.getCartamount() %></td>
			<td>2,500 won</td>
			<td><%=df.format(sum) %></td>
			<td><a href="#" onclick="deletecartproduct('<%=temp.getId() %>')">Delete</a></td>
			
		</tr>
			<%	}
			} %>
	</table>
	<a href="#" onclick="deletecart()" class="btn btn-info">Delete all</a>
	
	<% int shippingfee= 2500; int payment=total+shippingfee;%>
	<table class="table" style="margin-top:100px;">
		<tr>
			<th>Total price</th>
			<th>Total delivery fee</th>
			<th>SubTotal</th>
			
		</tr>
		<tr>
			<td><%=df.format(total) %></td>
			<td><%=df.format(shippingfee) %></td>
			<td><%=df.format(payment) %></td>	
		</tr>
	</table>
	<a href="../main.jsp" class="btn btn-info">Continue shopping</a>
	<a href="#" class="btn btn-success" style="padding:20px 30px; margin:100px 50px;">Order</a>
	<div>
		The price and availability of items are subject to change. The shopping cart is a temporary place to store a list of your items and reflects each item's most recent price.

Do you have a gift card or promotional code? We'll ask you to enter your claim code when it's time to pay.
	</div>
</div>

<%@ include file="../footer.jsp" %>
</body>
</html>