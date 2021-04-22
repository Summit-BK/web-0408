
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="dao.BoardDao"%>
<%@page import="dto.BoardDto"%>

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

		MultipartRequest multi = new MultipartRequest(request, realFolder, 1024*1024*10, "UTF-8",  new DefaultFileRenamePolicy()  );
	

	
		String title = multi.getParameter("title");
		String contents = multi.getParameter("contents");
		String file = multi.getFilesystemName("file");
		if(file==null){
			file="";
			
		}

		BoardDto boardDto = new BoardDto();
		
		boardDto.setTitle(title);
		boardDto.setContents(contents);
		boardDto.setUserID(user);
		boardDto.setAvailable(1);
		boardDto.setFile(file);

		BoardDao dao = BoardDao.getInstance();
		
		int result = dao.write(boardDto);
		if(result == 1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('Posting Success')");
			script.println("location.href='board.jsp'");
			script.println("</script>");
		}
		else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('Posting Failed[Please contact the admin]')");
			script.println("location.href='board.jsp'");
			script.println("</script>");
			
		}
		%>


<%@ include file="../footer.jsp" %>	
</body>
</html>