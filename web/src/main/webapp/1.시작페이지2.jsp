<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>

<%! int count = 0; %>
<body>

	<% out.print(count); %>
	<%= count %>
	
	<%
	//can declare variables, but not methods.
		int count2=0;
		for(int i=1;i<10;i++){
			out.print(i+"x"+i+"="+2*i+"<br>");
	%>		
	
	
		<img alt="" src="images/pineapple.jpg">
			
	<%		
	//can use a loop for tags. 
		}
	%>
	
 
</body>
</html>