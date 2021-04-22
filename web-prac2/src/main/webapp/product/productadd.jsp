<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../menu.jsp" %>
<% if(!user.equals("admin")){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('Not allowed access')");
		script.println("location.href='http://localhost:6060/web-prac2/main.jsp'");
		script.println("</script>");
	

	}		
%>

	<div class="container">
	
		<div class="row">
			<div class="col-3">
			
			
			</div>
			<div class="col-6">
			
			
				<form name="productaddform" onsubmit="return checkadd2()" action="productaddController.jsp" method="post" enctype="multipart/form-data">
					<div class="form-group row">
						<label>name</label>
						<div>
							<input type="text" name="name" class="form-control">
						</div>
					</div>
					<div class="form-group row">
						<label>price</label>
						<div>
							<input type="text" name="price" class="form-control">
						</div>
					</div>
					<div class="form-group row">
						<label>manufacturer</label>
						<div>
							<input type="radio" name="manufacturer" checked="checked" value="A"> A
							<input type="radio" name="manufacturer" value="B"> B
							<input type="radio" name="manufacturer" value="C"> C
						</div>
					</div>
					<div class="form-group row">
						<label>category</label>
						<div>
							<input type="radio" name="category"  checked="checked" value="food"> food
							<input type="radio" name="category"  value="toy"> toy
							
							<input type="radio" name="category" value="bed"> bed
						</div>
					</div>
					<div class="form-group row">
						<label>stock</label>
						<div>
							<input type="text" name="stock" class="form-control">
						</div>
					</div>
					<div class="form-group row">
						<label>condition</label>
						<div>
							<input type="radio" name="condition" checked="checked" value="1"> New
							<input type="radio" name="condition" value="2"> Used
						</div>
					</div>
					<div class="form-group row">
						<label>image</label>
						<div>
							<input type="file" name="imagefile" class="form-control">
						</div>
					</div>
					<div class="ms-auto">
					<input class="btn btn btn-success" type="submit" value="Register">
					<input class="btn btn btn-success" type="reset" value="Cancel">
				</div>
					
				</form>
				
				
			</div>
		</div>
	</div>
	




<%@ include file="../footer.jsp" %>

</body>
</html>