<%@page import="java.io.PrintWriter"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="dto.ProductDto" %>
<%@page import="dao.ProductDao" %>
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
	String realFolder=request.getServletContext().getRealPath("upload");
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, 1024*1024*10, "UTF-8", new DefaultFileRenamePolicy());
	
	String name = (String) multi.getParameter("name");
	int price = Integer.valueOf(multi.getParameter("price"));
	String manufacturer = (String) multi.getParameter("manufacturer");
	String category = (String) multi.getParameter("category");
	int stock = Integer.valueOf(multi.getParameter("stock"));
	int condition = Integer.valueOf(multi.getParameter("condition"));
	String filename = (String) multi.getFilesystemName("imagefile");
	if(filename==null){
		filename="";
	}
	
	int activation = 0; //0 : preparing 1: selling 2: sold out  
	int soldcount = 0;
	
	ProductDto productDto = new ProductDto(name, price, manufacturer, category, stock, condition, filename,activation,soldcount);
	
	ProductDao dao = ProductDao.getInstance();
	
	int result = dao.productadd(productDto);
	if(result == 1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('The product has been registered')");
		script.println("location.href='http://localhost:6060/web-prac2/main.jsp'");
		script.println("</script>");
		
	}
	else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('DB Error[Please contact the admin]')");
		script.println("location.href='http://localhost:6060/web-prac2/main.jsp'");
		script.println("</script>");
		
	}
	
	
	
	
	
%>

</body>
</html>