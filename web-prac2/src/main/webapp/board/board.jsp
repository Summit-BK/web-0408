<%@page import="dto.BoardDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BoardDao"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	form table,tr,td{
		
		padding:15px;
	
	
	
</style>

</head>
<body>
	<%@ include file="../menu.jsp" %>	
	<%
		int pagenumber = 1;
		if(request.getParameter("pagenumber")!=null){
			pagenumber = Integer.parseInt(request.getParameter("pagenumber"));
		}
	%>
	<div class="container">
		<div>
			<table class="table table-striped" style="text-align:center;border:1px;">
				<thead>
					<tr>
						<th style="background-color:#eeeeee;text-align:center">No.</th>
				
						<th style="background-color:#eeeeee;text-align:center">Title</th>
						<th style="background-color:#eeeeee;text-align:center">Author</th>
						<th style="background-color:#eeeeee;text-align:center">Date</th>
					</tr>
				</thead>
				<tbody>
				<%
					request.setCharacterEncoding("UTF-8");
					String key = request.getParameter("key");
					String keyword = request.getParameter("keyword");
					
				
					BoardDao dao= BoardDao.getInstance();
					ArrayList<BoardDto> list= new ArrayList<>();
					if(key==null || keyword.equals("")){
						list=dao.getBoardList(pagenumber);
						
					}
					
					else{
						list=dao.getBoardSearch(key,keyword);
						
					}
					
					for (int i=0;i<list.size();i++){
						BoardDto dto=list.get(i);
						%>
						<tr onclick="location.href='boarddetail.jsp?num='+<%=dto.getNum()%>">
						<td><%=dto.getNum() %></td>
						
						<td><%=dto.getTitle() %>   <img alt="" src="../upload/<%=dto.getFile() %>" width="50px"></td>
						<td><%=dto.getUserID() %></td>
						<td><%=dto.getDate() %></td>
						
					
					</tr>
						
						
						<% 
					}
				
				%>
				
					
				</tbody>
			
			</table>
			<%
				if(pagenumber != 1){
					%>
					<a href="board.jsp?pagenumber=<%=pagenumber-1 %>" class="btn btn-success btn-arrow-left">previous</a>
					<%
				}
				
				if(dao.nextPage(pagenumber+1)){
					
					%>
					<a href="board.jsp?pagenumber=<%=pagenumber+1 %>" class="btn btn-success btn-arrow-right">next</a>
					<%
				}
			%>
			
			<form action="board.jsp" method="post">
				<table style="float:right;">
					<tr>
						<td>
							<select name="key">
								<option value="board_title">title</option>
								<option value="board_contents">contents</option>
								<option value="board_userID">userID</option>
							</select>
						</td>
						<td>
							<input type="text" name="keyword" placeholder="Search">
							<input type="submit" name="btnsearch" value="Search">	
							
				
						</td>
						<td>
							<a href="boardwrite.jsp" class="btn btn-primary" >Write a Post</a>
						</td>
					</tr>
					
				</table>
				
				
			</form>
			
			
			
		</div>
	</div>


<%@ include file="../footer.jsp" %>	
</body>
</html>