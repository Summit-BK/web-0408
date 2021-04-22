<%@page import="java.io.PrintWriter"%>
<%@page import="dao.MemberDao"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	String address = request.getParameter("address1")+request.getParameter("address2")+request.getParameter("address3");
	
	MemberDto dto = new MemberDto();
	dto.setMember_id(id);
	dto.setMember_password(password);
	dto.setMember_name(name);
	dto.setMember_phone(phone);
	dto.setMember_email(email);
	dto.setMember_address(address);
	
	MemberDao dao = MemberDao.getInstance();
	int result = dao.signUp(dto);
	if(result == 1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('Successfully signed up.')");
		script.println("location.href='login.jsp'");
		script.println("</script>");
		
	}
	else{
		response.sendRedirect("signup.jsp?idcheck=1");
		
	}
	
%>



</body>
</html>