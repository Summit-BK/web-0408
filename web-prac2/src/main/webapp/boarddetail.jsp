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

	<% int num = Integer.parseInt(request.getParameter("num")); 
		BoardDao dao = BoardDao.getInstance();
		BoardDto dto = dao.getBoard(num);
		
	
	%>
	<div class="container">
		<div>
			<table class="table table-striped" style="text-align:center;border:1px;">
				<thead>
					<tr>
						<th colspan="3" style="background-color:#eeeeee;text-align:center;">No. <%=dto.getNum() %></th>
					</tr>
					<tr>
						<td style="font-size:11px;"><%=dto.getCount()%> views</td>
					</tr>
				</thead>
				
				<tbody>
					<tr>
						<td>Title</td><td colspan="2" style="text-align:left;"><%=dto.getTitle() %></td>
					</tr>
					<tr>
						<td>Author</td><td colspan="2" style="text-align:left;"><%=dto.getUserID() %></td>
					</tr>
					<tr>
						<td>Attached File</td><td colspan="2" style="text-align:left;"><a href="fileController.jsp?file=<%=dto.getFile()%>"><%=dto.getFile() %></a></td>
						
					</tr>
					<tr>
						<td>Content</td><td colspan="2" style="height:300px;text-align:left;"><img alt="" src="upload/<%=dto.getFile()%>" height="100%" style="margin-bottom:10px"><textarea cols="150" rows="20"><%=dto.getContents() %></textarea></td>
					</tr>
				</tbody>
				
			</table>
			<div class="nav justify-content-end gap-2">
				<a href="boardModify.jsp?num=<%=dto.getNum() %>" class="btn btn-primary">Modify</a>
				<a href="boardDeleteController.jsp?num=<%=dto.getNum() %>" class="btn btn-primary">Delete</a>		
				<a href="board.jsp" class="btn btn-primary">List</a>	
			</div>	
		</div>	
		
	
	</div>
	
	<!-- ////////////////////////////////////////////////////////////////////// -->
	<div class="container mt-5">
		<form action="replyController.jsp" method="post">
			<table class="table table-striped" style="text-align:center;border:1px;">
				<thead>
					<tr>
						
						<th style="background-color:#eeeeee;text-align:center" colspan="2">Reply</th>
						
						
					</tr>
				</thead>
				<tbody>
					<tr>
						
						
						<td><textarea cols="150" rows="1" name="contents" colspan="2"></textarea></td>
						
						
					
					</tr>
				</tbody>
			
			</table>
			<div class="nav justify-content-end gap-2"> 
				
				<input type="submit" value="Submit" class="btn btn-primary">
				<a href="board.jsp" class="btn btn-primary">Cancel</a>
			</div>
		</form>
	</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
</body>
</html>