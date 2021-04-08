<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<p> JSP </p>
	1. declaration statement %! %
	2. script  % % 
	3. expression -> output %= %
	
	<%! //declaration statement (can declare variables and methods)  //can be written outside
		int count = 3;
		String lowerCase(String string){
			return string.toLowerCase();
			
			
		}
	%>
	
	<p> java output

	<% for(int i=1;i<=count;i++){ //script 
		out.print("java server pages "+i+".<br>");
	}%>
	
	<%= lowerCase("HELLO JSP") %>
	
	
	

</body>
</html>