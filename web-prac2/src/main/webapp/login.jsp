<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
main {
    display: flex;
    align-items: center;
    padding-top: 40px;
    padding-bottom: 40px;
    background-color: #f5f5f5;
    
}	
.form-signin form{
	margin:0 auto;
	
	width:400px;
	padding:15px 10px;
	box-shadow:3px 3px 5px #888888;
	border-radius:15px;
}
</style>
</head>


<body class="text-center">
<%@include file="../menu.jsp" %>
<%
	int loginfail = 0;
	if(request.getParameter("loginfail")!=null){
		loginfail = Integer.parseInt(request.getParameter("loginfail"));
	}
%>
<main class="form-signin">
  <form action="loginController.jsp" method="post">

    <h1 class="h3 mb-3 fw-normal">Please sign in</h1>

    <div class="form-floating">
      <input type="text" class="form-control" id="floatingInput" placeholder="ID" name="id">
      <label for="floatingInput">ID</label>
    </div>
    <div class="form-floating">
      <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="password">
      <label for="floatingPassword">Password</label>
    </div>

    <div class="checkbox mb-3">
      <label>
        <input type="checkbox" value="remember-me"> Remember me
      </label>
    </div>
    <button class="w-100 btn btn-lg btn-primary" type="submit">Sign in</button>
    <p style="color:red;"><%if(loginfail==1){out.print("Login failed. Please check your information");} %></p>
    <p class="mt-5 mb-3 text-muted">© 2017–2021</p>
  </form>
</main>


    
  
<%@ include file="footer.jsp" %>
</body>
</html>