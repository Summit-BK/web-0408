<%@page import="java.io.File"%>
<%@page import="dto.BoardDto"%>

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
	int num = Integer.parseInt(request.getParameter("num"));
	BoardDao dao = BoardDao.getInstance();
	
	BoardDto dto = dao.getBoard(num);
	
	File file = new File("C:/Users/User/git/web-0408_4/web-prac2/src/main/webapp/upload/"+dto.getFile());
	
%>
	<div class="container">
		<form action="boardModifyController.jsp?num=<%=num%>" method="post" enctype="multipart/form-data">
			<table class="table table-striped" style="text-align:center;border:1px;">
				<thead>
					<tr>
						
						<th style="background-color:#eeeeee;text-align:center">Title</th>
						<th style="background-color:#eeeeee;text-align:center">Content</th>
						
					</tr>
				</thead>
				<tbody>
					<tr>
						
						<td><input type="text" name="title" value="<%=dto.getTitle() %>"></td>
						<td><textarea cols="60" rows="6" name="contents"><%=dto.getContents() %></textarea></td>
						
						
					
					</tr>
				</tbody>
			
			</table>
			<div class="nav justify-content-end gap-2">
				<input type="file" name="file" class="me-auto">
				<input type="hidden" name="file2" value="<%=dto.getFile() %>">
				<input type="submit" value="Submit" class="btn btn-primary">
				<a href="board.jsp" class="btn btn-primary">Cancel</a>
			</div>
		</form>
	</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
</body>
</html>