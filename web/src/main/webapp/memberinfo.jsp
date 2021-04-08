<%@page import="dto.MemberDto"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="memberinfoController.jsp" method="post">
		<% String logid = (String) session.getAttribute("user"); %>
		<%
			MemberDao dao = MemberDao.getInstance();
			MemberDto memberDto = dao.getMember(logid);
		%>
		<table>
				<tr>
					<td>id</td>
					<td><input type="text" name="id" placeholder="ID" value=<%= memberDto.getId() %>>></td>
					
				</tr>
				<tr>
					<td>password</td>
					<td><input type="password" name="password" placeholder="password" value=<%= memberDto.getPassword() %>></td>
				</tr>
				<tr>
					<td>name</td>
					<td><input type="text" name="name" placeholder="name" value=<%= memberDto.getName() %>></td>
				</tr>
				<tr>
					<td>gender</td>
					<td><input type="radio" name="gender"  checked="checked"><%= memberDto.getGender() %> </td>
					
				</tr>
				<tr>
					<td>email</td>
					<td><input type="text" placeholder="email" name="email1" value=<%= memberDto.getMail() %>>
					</td>
				</tr>
				<tr>
					<td>birthday</td>
					<td><input type="text" name="birthyy" placeholder="YY" value=<%= memberDto.getBirth() %>>
					</td>
					
				</tr>
				
				<tr>
					<td>phone</td>
					<td><input type="text" name="phone1" value=<%= memberDto.getPhone() %>>
					</td>
					
				</tr>
				<tr>
					<td>
						<input type="text" id="sample4_postcode" placeholder="우편번호" name="address1" value=<%= memberDto.getAddress() %>>
						
					</td>
					
				</tr>
				
				<tr>
					<td><button type="submit" name="btnupdate">Update information</button></td>
					
					<td><button type="reset">cancel</button></td>
				
				</tr>
				
				
		</table>
		
		<a href="memberdeleteController.jsp">Quit Membership</a>
	</form>
</body>
</html>