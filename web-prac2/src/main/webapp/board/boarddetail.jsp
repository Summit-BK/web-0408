<%@page import="java.util.ArrayList"%>
<%@page import="dto.ReplyDto"%>
<%@page import="dao.ReplyDao"%>
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
						<td>Content</td><td colspan="2" style="height:300px;text-align:left;"><img alt="" src="../upload/<%=dto.getFile()%>" height="100%" style="margin-bottom:10px"><textarea cols="150" rows="20"><%=dto.getContents() %></textarea></td>
					</tr>
				</tbody>
				
			</table>
			<div class="nav justify-content-end gap-2">
				<% if(dto.getUserID().equals(user)){ %>
				<a href="boardModify.jsp?num=<%=dto.getNum() %>" class="btn btn-primary">Modify</a>
				<a href="boardDeleteController.jsp?num=<%=dto.getNum() %>" class="btn btn-primary">Delete</a>		
				<%} %>
				<a href="board.jsp" class="btn btn-primary">List</a>	
			</div>	
		</div>	
		
	
	</div>
	
	<!-- ////////////////////////////////////////////////////////////////////// -->
	<div class="container mt-5">
		<form action="replyController.jsp?num=<%=dto.getNum() %>" method="post">
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
	
	<div class="container">
		<div>
			<table class="table table-striped" style="text-align:center;border:1px;">
				
					<%
						ReplyDao replyDao = ReplyDao.getInstance();
										
						ArrayList<ReplyDto> list = replyDao.getReplyList(dto.getNum());
						
						for (int i=0;i<list.size();i++){
							%>
							<tr>
								<td><%=list.get(i).getReply_userid() %></td><td><%=list.get(i).getReply_contents() %></td>
							</tr>
							<%
							
							
						}
						
						
					%> 
				
			</table>
		</div>
		
	</div>
<%@ include file="../footer.jsp" %>	
</body>
</html>