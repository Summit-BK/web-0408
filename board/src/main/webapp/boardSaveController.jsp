<%@page import="java.io.PrintWriter"%>
<%@page import="dao.BoardDao"%>
<%@page import="dto.BoardDto"%>
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
		String title=request.getParameter("title");
		String contents = request.getParameter("contents");
		String author = request.getParameter("author");
		
		BoardDto dto = new BoardDto();
		
		dto.setTitle(title);
		dto.setContents(contents);
		dto.setAuthor(author);
		
		BoardDao dao = BoardDao.getInstance();
		int result = dao.boardSave(dto);
		if(result == 1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('Successfully posted')");
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