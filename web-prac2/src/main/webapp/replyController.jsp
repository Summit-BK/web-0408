<%@page import="java.io.PrintWriter"%>
<%@page import="dto.ReplyDto"%>
<%@page import="dao.ReplyDao"%>
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
		request.setCharacterEncoding("EUC-KR");
		
		String contents = request.getParameter("contents");
		int num = Integer.parseInt(request.getParameter("num"));
		
		ReplyDao replyDao = ReplyDao.getInstance();
		ReplyDto replyDto = new ReplyDto();
		
		replyDto.setBoard_num(num);
		replyDto.setReply_contents(contents);
		replyDto.setReply_userid("Bob");
		
		int result = replyDao.re_write(replyDto);
		if(result == 1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('Successfully posted the reply.')");
			script.println("location.href='boarddetail.jsp?num="+num+"'");
			script.println("</script>");
			
		}
		else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('DB Error[Contact the admin]')");
			script.println("location.href='board.jsp'");
			script.println("</script>");
			
		}
	
	%>
	

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
</body>
</html>