<%@page import="dto.BoardDto"%>
<%@page import="java.util.ArrayList"%>
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
<style type="text/css">
	form table,tr,td{
		
		padding:15px;
	
	
	
</style>

</head>
<body>
	
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
					request.setCharacterEncoding("EUC-KR");
					String key = request.getParameter("key");
					String keyword = request.getParameter("keyword");
					
				
					BoardDao dao= BoardDao.getInstance();
					ArrayList<BoardDto> list= new ArrayList<>();
					if(key==null || keyword.equals("")){
						list=dao.getBoardList();
						
					}
					
					else{
						list=dao.getBoardSearch(key,keyword);
						
					}
					
					for (int i=0;i<list.size();i++){
						BoardDto dto=list.get(i);
						%>
						<tr onclick="location.href='boarddetail.jsp?num='+<%=dto.getNum()%>">
						<td><%=dto.getNum() %></td>
						<td><%=dto.getTitle() %></td>
						<td><%=dto.getUserID() %></td>
						<td><%=dto.getDate() %></td>
						
					
					</tr>
						
						
						<% 
					}
				
				%>
				
					
				</tbody>
			
			</table>
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
</body>
</html>