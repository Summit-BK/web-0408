<%@page import="java.io.PrintWriter"%>
<%@page import="dao.BoardDao"%>
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
		request.setCharacterEncoding("EUC-KR");
	
		int num = Integer.parseInt(request.getParameter("num"));
	
		BoardDao dao = BoardDao.getInstance();
		int result = dao.deletePost(num);
		if(result ==1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('Successfull deleted')");
			script.println("location.href='boardlist.jsp'");
			script.println("</script>");
						
		}
		else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('DB Error, please contact the admin')");
			script.println("location.href='boardlist.jsp'");
			script.println("</script>");
		}
		
	%>

</body>
</html>