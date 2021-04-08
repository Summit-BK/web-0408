<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<!-- 외부파일 css 가져오기 [부트스트랩] -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	
	<!-- 디바이스 크기에 따라 크기 변경 [부트스트랩]  -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- 외부파일 js 가져오기 [부트스트랩]  -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	
	<!-- 외부파일 jquery 가져오기 [부트스트랩] -->
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>	
	<script src="js/bootstrap.js"></script>
	
	<style type="text/css">
		#myCarousel{
			width:1000px;
		
		}
	</style>
	
</head>
<body>

	<%@ include file="menu.jsp" %>
	
	<div class="container">
		<div id="myCarousel" class="carousel slide" data-ride = "carousel" data-interval="3000">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
				
			
			</ol>
			
			<div class="carousel-inner">
				<div class="item active">
					<img alt="" src="images/pineapple.jpg" width=1000px >
						
				</div>
				<div class="item">
					<img alt="" src="images/chocolate.jpg" width=1000px>
						
				</div>
				<div class="item">
					<img alt="" src="images/catbanner3.jpg" width=1000px> 
						
				</div>
			
			
			</div>
			
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</a>
		
			<a class="right carousel-control" href="#myCarousel" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right"></span>
			</a>
		
		</div>
		
	</div>


</body>
</html>