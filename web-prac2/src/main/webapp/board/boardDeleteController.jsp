<%@page import="java.io.PrintWriter"%>
<%@page import="dto.BoardDto"%>
<%@page import="dao.BoardDao"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../menu.jsp" %>	
	<% 
		int num = Integer.parseInt(request.getParameter("num"));
		BoardDao dao = BoardDao.getInstance();
		int result = dao.hideBoard(num);
		if(result == 1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
				script.println("alert('Successfully deleted')");
				script.println("location.href='board.jsp'");
			script.println("</script>");
			
		}
		else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
				script.println("alert('Delete Operation Failed, contact the admin')");
				script.println("location.href='board.jsp'");
			script.println("</script>");
			
			
		}
		
		
	
	%>


<%@ include file="../footer.jsp" %>	
</body>
</html>