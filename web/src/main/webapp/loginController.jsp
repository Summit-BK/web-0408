<%@page import="java.io.PrintWriter"%>
<%@page import="dao.MemberDao"%>
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
	String id = request.getParameter("id");
	String password= request.getParameter("password");
	
	MemberDao dao = MemberDao.getInstance();
	int result = dao.login(id, password);
	if(result == 1){
		session.setAttribute("user",id);
			//session id, argument
			
		PrintWriter script = response.getWriter();
		script.println("<script>");
			script.println("alert('안녕하세요');");
			script.println("location.href='main.jsp'");
		script.println("</script>");
		
		
		
	}
	if(result == 2){
		out.print("Wrong information");
	}
	if(result == -1){
		out.print("DB Error");
	}
	
	%>
	
</body>
</html>