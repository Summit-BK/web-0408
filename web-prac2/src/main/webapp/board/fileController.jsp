<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.File"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../menu.jsp" %>	

	<%
		String filename = request.getParameter("file");
		String realFolder = request.getServletContext().getRealPath("upload");
		File file = new File(realFolder+"/"+filename);
		
		response.setHeader("Content-Disposition", "attachment;filename="+filename+";");
		
		byte[] b = new byte[(int)file.length()];
		
		if(file.isFile()){
			
			BufferedInputStream fin = new BufferedInputStream(new FileInputStream(file));
			
			BufferedOutputStream fout = new BufferedOutputStream(response.getOutputStream());
			
			int count ;
			
			while( (count=fin.read(b))!= -1){
				
				fout.write(b,0,count);
			}
			fin.close();
			fout.close();
		}
		
		%>

<%@ include file="../footer.jsp" %>	
</body>
</html>