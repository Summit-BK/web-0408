<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script type="text/javascript">
	function checkadd(){
	
		if(!signupform.id.value){
			alert("Type your id");
			return false;
			
		}
		
		var regx = /^[a-zA-Z0-9]*$/;
		
		if(!regx.test(signupform.id.value)){
			alert("id should be alphabets or numbers");
			return false;
			
		}
	 	if(signupform.password.value!=signupform.passwordconfirm.value){
			alert("Passwords do not match");
			return false;
		} 
		
		if(!signupform.password.value){
			alert("Type your password");
			return false;
		}
		if(!signupform.name.value){
			alert("Type your name");
			return false;
			
		}
	}
	
	function checkadd2(){
		
		if(!productaddform.name.value){
			alert('Please type its name');
			return false;
		}
		if(productaddform.name.value.length<4||productaddform.name.value.length>50){
			alert('Please type its name b/w 4 ~ 50 characters');
			return false;
			
		}
		if(productaddform.price.value.length==0 || isNaN(productaddform.price.value)){
			
		    alert("Please type numbers for price");    
			return false;
		}
		if(productaddform.price.value<0){
			alert("price should be a positive number for price");
			return false;

		}
		if(productaddform.stock.value.length==0 || isNaN(productaddform.stock.value)){
			
			    alert("Please type numbers for stock");    
				return false;
			}
			if(productaddform.stock.value<0){
				alert("price should be a positive number for stock");
				return false;

			}
		
		
	}
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
</body>
</html>