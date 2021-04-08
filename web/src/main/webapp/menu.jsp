<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>


	
<!-- �ܺ����� css �������� [��Ʈ��Ʈ��] -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	
	<!-- ����̽� ũ�⿡ ���� ũ�� ���� [��Ʈ��Ʈ��]  -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- �ܺ����� js �������� [��Ʈ��Ʈ��]  -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	
	<!-- �ܺ����� jquery �������� [��Ʈ��Ʈ��] -->
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>	
	<script src="js/bootstrap.js"></script>
	<style type="text/css">
		body{
			width:1000px;
			margin:0 auto;
		}
	</style>
</head>
<body>

	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
			aria-expanded="false">
			
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				
				
				
			</button>
		
			<a class="navbar-brand" href="main.jsp"><img src="images/logo.png" width="30px"></a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="#">All products</a></li>
					<li><a href="#">Top 30</a></li>
					<li><a href="#">Notice</a></li>
					<li><a href="#">Community</a></li>
				</ul>
				
				<ul class="nav navbar-nav navbar-right">
				
					<% String logid = (String) session.getAttribute("user"); 	
						if(logid!=null){
						
						out.print(logid);
						%>
						<li><a href="logout.jsp">logout</a></li>
						<li><a href="memberinfo.jsp">myAccount</a></li>
						
							<% if(logid.equals("admin")){ %>
								<li><a href="#">admin page</a></li>
							<% }
						}
					
						else{%>
							<li><a href="login.jsp">login</a></li>
							<li><a href="signup.jsp">signup</a></li>
						<% }%>
						
						
					
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">menu<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="login.jsp">login</a></li>
							<li><a href="logout.jsp">logout</a></li>
							<li><a href="memberinfo.jsp">myAccount</a></li>
						</ul>
					</li>
				</ul>
		</div>	
			
		
	</nav>



</body>
</html>