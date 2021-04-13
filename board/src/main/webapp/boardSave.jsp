<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	table,tr,th,td{
		border:solid 1px #eeeeee;
		border-collapse:collapse;
		padding:10px;
	}
	
</style>
</head>
<body>

	<form action="boardSaveController.jsp" method="post">
		<table>
			<tr>
				<th>title</th>
				<th>contents</th>
				<th>author</th>
			</tr>
			<tr>
				<td><input type="text" name="title"></td>
				<td><textarea rows="" cols="" name="contents"></textarea></td>
				<td><input type="text" name="author"></td>
			</tr>
			
		
		</table>
		
		<br>
		<input type="submit" value="post"> <input type="reset" value="cancel">	
	
	</form>



</body>
</html>