<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

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


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
</body>
</html>