<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	@font-face {
    font-family: 'MaplestoryOTFBold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/MaplestoryOTFBold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
	body{
		font-family: 'MaplestoryOTFBold';
	}

</style>

</head>
<body>
<%
	String user = null;
	if(session.getAttribute("user")!=null){
		user = (String) session.getAttribute("user");	
		
	}
%>
	
	<div class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container">
			
			<a class="navbar-brand" href="http://localhost:6060/web-prac2/main.jsp"><img alt="" src="images/cat.gif" height="40px">The Cat</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-expanded="false" aria-controls="navbarSupportedContent" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			
			<div class="collapse navbar-collapse ms-auto" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item">
						<a class="nav-link active" aria-current="page" href="http://localhost:6060/web-prac2/main.jsp">Home</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="http://localhost:6060/web-prac2/board/board.jsp">Board</a>
					</li>
					
					
				</ul>
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
					<li class="nav-item">
						<% if(user!=null){ %><a href="#" class="nav-link">Hello, <%=user %></a><%} %>
					</li>
					<li class="nav-item">
						<a href="#" class="nav-link"><img alt="" src="images/shoppingcart.png" height="30px";></a>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">Account</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<%
								if(user==null){

							%>
							<li><a class="dropdown-item" href="http://localhost:6060/web-prac2/login.jsp">login</a></li>
							<li><a class="dropdown-item" href="http://localhost:6060/web-prac2/signup.jsp">Sign up</a></li>
							<%}else{ %>
							<li><a class="dropdown-item" href="http://localhost:6060/web-prac2/logoutController.jsp">logout</a></li>
								<%if(user.equals("admin")){ %>
							<li><div class="dropwdown-divider"></div></li>
							<li><a class="dropdown-item" href="http://localhost:6060/web-prac2/product/productadd.jsp">Product Register</a></li>
								<%} %>
							<%} %>
						</ul>
					</li>
					
					
				</ul>
			</div>
			
		</div>
	
	</div>
	


</body>
</html>