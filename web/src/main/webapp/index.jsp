<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<!-- importing bootstrap(css+js) -->

<!-- �ܺ����� css �������� [��Ʈ��Ʈ��] -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	
	<!-- ����̽� ũ�⿡ ���� ũ�� ���� [��Ʈ��Ʈ��]  -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- �ܺ����� js �������� [��Ʈ��Ʈ��]  -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	
	<!-- �ܺ����� jquery �������� [��Ʈ��Ʈ��] -->
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>	
	<script src="js/bootstrap.js"></script>

</head>
<body>
	<nav class="navbar navbar-default">
	
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="index.jsp">shopping mall</a>
			</div>
		</div>
	</nav>
	
	<%! String title = "hello bootstrap shopping mall"; 
		String semi_title = "hello web shopping mall";	
	%>
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">
				<%= title %>
			</h1>
		</div>
	</div>
	
	<div class="container">
		<div class="text-center">
			<h3><%=semi_title %></h3>
		</div>
	</div>
	
	<footer class="container">
		<p> &copy; web shopping mall</p>p
	</footer>

	
</body>
</html>