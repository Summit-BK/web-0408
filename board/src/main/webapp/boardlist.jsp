<%@page import="dto.BoardDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<script type="text/javascript">
		
		function deletePost(num){
			if(confirm("Would you like to delete the post?")){
				location.href='BoardDeleteController.jsp?num='+num
			}
			else{
				location.href='boardlist.jsp'
			}
		}
	</script>

<style type="text/css">
	table,tr,td,th{
		border:solid 1px #eeeeee;
		border-collapse:collapse;
		padding:10px;
	}
	a:link,a:visited,a:active{
		text-decoration:none;
		color:orange;
	}
	a:hover{
		text-decoration:none;
		color:red;
	}
	form{
		padding:20px;
	}

</style>

</head>

<body>

	<table>
		<tr>
			<th>No.</th>
			<th>title</th>
			<th>author</th>
			
		</tr>
		
		<% 
			BoardDao dao = BoardDao.getInstance();
			ArrayList<BoardDto> list = dao.boardList();
		
			for (int i=0;i<list.size();i++){
				
			
			%>
		
		<tr>
			<td><%out.print(list.get(i).getNum()); %></td>
			<td><%out.print(list.get(i).getTitle()); %></td>
			<td><%out.print(list.get(i).getAuthor()); %></td>
			<td><a href="#">Modify</a></td>
			<td><a href="#" onclick="deletePost('<%=list.get(i).getNum()%>')">Delete</a></td>
		</tr>
		
		<% }%>
	</table>
	<a href="boardSave.jsp">Write a post</a>
	


</body>
</html>