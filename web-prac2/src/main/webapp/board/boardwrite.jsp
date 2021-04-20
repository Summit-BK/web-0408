
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../menu.jsp" %>	
	<div class="container">
		<form action="boardwriteController.jsp" method="post" enctype="multipart/form-data">
			<table class="table table-striped" style="text-align:center;border:1px;">
				<thead>
					<tr>
						
						<th style="background-color:#eeeeee;text-align:center">Title</th>
						<th style="background-color:#eeeeee;text-align:center">Content</th>
						
					</tr>
				</thead>
				<tbody>
					<tr>
						
						<td><input type="text" name="title"></td>
						<td><textarea cols="60" rows="6" name="contents"></textarea></td>
						
						
					
					</tr>
				</tbody>
			
			</table>
			<div class="nav justify-content-end gap-2">
				<input type="file" name="file" class="me-auto">
				<input type="submit" value="Submit" class="btn btn-primary">
				<a href="board.jsp" class="btn btn-primary">Cancel</a>
			</div>
		</form>
	</div>
<%@ include file="../footer.jsp" %>	
</body>
</html>