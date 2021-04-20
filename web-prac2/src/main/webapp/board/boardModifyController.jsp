<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="dto.BoardDto"%>
<%@page import="java.io.PrintWriter"%>
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
	String realFolder = request.getServletContext().getRealPath("upload");
	MultipartRequest multi = new MultipartRequest(request, realFolder,1024*1024*10,"UTF-8", new DefaultFileRenamePolicy());

	

int num = Integer.parseInt(request.getParameter("num"));
	String title = multi.getParameter("title");
	String contents = multi.getParameter("contents");
	String file = multi.getFilesystemName("file");

	if(file == null){
		file = multi.getParameter("file2");
		
	}
	
	BoardDao dao = BoardDao.getInstance();
	int result = dao.modifyBoard(num,title,contents,file);
	if(result == 1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
			script.println("alert('Successfully modified')");
			script.println("location.href='board.jsp'");
		script.println("</script>");
		
	}
	else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
			script.println("alert('Modify Operation Failed, contact the admin')");
			script.println("location.href='board.jsp'");
		script.println("</script>");
		
	}
%>
<%@ include file="../footer.jsp" %>	
</body>
</html>