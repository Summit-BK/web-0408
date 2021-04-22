<%@page import="java.io.PrintWriter"%>
<%@page import="dto.ReplyDto"%>
<%@page import="dao.ReplyDao"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%
		request.setCharacterEncoding("UTF-8");
		String user = (String) session.getAttribute("user");
		String contents = request.getParameter("contents");
		int num = Integer.parseInt(request.getParameter("num"));
		
		ReplyDao replyDao = ReplyDao.getInstance();
		ReplyDto replyDto = new ReplyDto();
		
		replyDto.setBoard_num(num);
		replyDto.setReply_contents(contents);
		replyDto.setReply_userid(user);
		
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
	

</body>
</html>