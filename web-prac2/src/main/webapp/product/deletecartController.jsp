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
	session.setAttribute("cartlist", null);
	response.sendRedirect("http://localhost:6060/web-prac2/product/cart.jsp");
%>
</body>
</html>