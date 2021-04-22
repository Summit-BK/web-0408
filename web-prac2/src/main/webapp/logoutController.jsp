<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	
	session.invalidate();
	
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('Successfully logged out.')");
	script.println("location.href='main.jsp'");
	script.println("</script>");
%>


</body>
</html>