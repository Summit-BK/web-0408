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
<%
	int id = -1;
	if(request.getParameter("id")!=null){	
		id = Integer.parseInt(request.getParameter("id"));
	}
	ArrayList<ProductDto> list = (ArrayList<ProductDto>) session.getAttribute("cartlist");
	
	for(int i=0;i<list.size();i++){
		if(list.get(i).getId()==id){
			list.remove(i);
		}
	}
	
	response.sendRedirect("http://localhost:6060/web-prac2/product/cart.jsp");
%>


</body>
</html>