<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dto.ProductDto"%>
<%@page import="dao.ProductDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int id = Integer.parseInt(request.getParameter("id"));
	int amount = Integer.parseInt(request.getParameter("amount"));
	
	ProductDao dao = ProductDao.getInstance();
	
	
	
	ArrayList<ProductDto> list = (ArrayList<ProductDto>) session.getAttribute("cartlist");
	
	if(list==null){
		list = new ArrayList<ProductDto>();
		session.setAttribute("cartlist",list);
	}
	
	int count = 0;
	for(int i=0;i<list.size();i++){
		if(list.get(i).getId()==id){
			list.get(i).setCartamount(list.get(i).getCartamount()+amount);
			count = 1;
		}
		
	}
	if(count==0){
		ProductDto productDto = dao.getProduct(id);
		
		productDto.setCartamount(amount);
		list.add(productDto);
		
	}
	
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('Successfully added to the cart')");
	script.println("location.href='http://localhost:6060/web-prac2/product/productview.jsp?id="+id+"&gotocart=1'");
	script.println("</script>");
	
	
	
	
	
%>
	

</body>
</html>