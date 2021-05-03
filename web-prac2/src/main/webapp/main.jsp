<%@page import="dto.ProductDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProductDao"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
	.goodsbox{
		display:flex;
		justify-content:center;
		flex-wrap:wrap;
		align-items:center;
		margin-top:20px;
	}
	.goodslist_title{
		width:100%;
		text-align:center;
		margin-bottom:20px;
	}
	.goods_subtitle{
		width:150px;
		border-bottom:solid 4px orange;
	}
	.goodslist{
		width:100%;
		list-style-type:none;
		
	}
	.goodslist li{
		border:solid 1px #757575;
		border-radius:10px;
		padding:5px;
		display:inline-block;
		margin-right:10px;
		margin-top:10px;
	}
	
	.goodslist img:hover{
		transform:scale(1.05);
	}
	.name:hover{
		transform:scale(1.05);
	}
</style>

<body>
<%@include file="menu.jsp" %>
	
	<%
		ProductDao dao = ProductDao.getInstance();
		
		ArrayList<ProductDto> plist = dao.getAllProductList();
		
		
		
	%>
	<div class="container">
		<div class="goodsbox">
			<div class="goodslist_title">
				<h3>Best Products</h3>
				<span class="goods_subtitle">Here are the best items of the year.</span>
			</div>
			<ul class="goodslist">
				<% for(int i=0;i<plist.size();i++){ %>
			
				<li>
					<a href="product/productview.jsp?id=<%=plist.get(i).getId() %>"><img alt="" src="upload/<%=plist.get(i).getFile() %>" height="250px"></a>
					<div class="goods_info" style="text-align:left;">
						<span class="manufacturer"><%=plist.get(i).getManufacturer() %></span><br>
						<a href="productlistController.jsp" style="float:left;text-decoration:none;"><span class="name" style="color:black;"><%=plist.get(i).getName() %></span></a>
						<span class="price" style="float:right;">
							
							<%=df.format(plist.get(i).getPrice()) %>
						
						</span>
					</div>
				
				</li>
				<%} %>
				
			</ul>
		</div>
	
	</div>
	
	
<%@include file="footer.jsp" %>
</body>
</html>