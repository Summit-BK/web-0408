<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="dto.BoardDto"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
	String realFolder = "/upload";
	MultipartRequest multi = new MultipartRequest(request, realFolder,1024*1024*10,"EUC-KR", new DefaultFileRenamePolicy());

	

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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
</body>
</html>