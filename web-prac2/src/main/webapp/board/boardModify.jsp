<%@page import="java.io.File"%>
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
	
	BoardDto dto = dao.getBoard(num);
	

	
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

<%@ include file="../footer.jsp" %>	
</body>
</html>