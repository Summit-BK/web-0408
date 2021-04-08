<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>
</head>
<body>
	<%@ include file = "menu.jsp" %>
	<%
		if(logid !=null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
				script.println("alert('Not allowed to access the page)");
				script.println("history.back()");
			script.println("</script>");
			
			
		}
	
	%>


	<form action="signupController.jsp" method="post">
		<table>
			<tr>
				<td>id</td>
				<td><input type="text" name="id" placeholder="ID"></td>
				<td><button>check availability</button></td>
			</tr>
			<tr>
				<td>password</td>
				<td><input type="password" name="password" placeholder="password"></td>
			</tr>
			<tr>
				<td>name</td>
				<td><input type="text" name="name" placeholder="name"></td>
			</tr>
			<tr>
				<td>gender</td>
				<td><input type="radio" name="gender"  value="male" checked="checked">male</td>
				<td><input type="radio" name="gender" value="female">female</td>
			</tr>
			<tr>
				<td>email</td>
				<td><input type="text" placeholder="email" name="email1">@<select name="email2">
					<option>naver.com</option>
					<option>google.com</option>
					<option>daum.net</option>
					
				</select></td>
			</tr>
			<tr>
				<td>birthday</td>
				<td><input type="text" name="birthyy" placeholder="YY">
				<input type="text" name="birthmm" placeholder="MM">
				<input type="text" name="birthdd" placeholder="DD">
				</td>
				
			</tr>
			
			<tr>
				<td>phone</td>
				<td><input type="text" name="phone1">
				<input type="text" name="phone2">
				<input type="text" name="phone3">
				</td>
				
			</tr>
			<tr>
				<td>
					<input type="text" id="sample4_postcode" placeholder="우편번호" name="address1">
					<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="sample4_roadAddress" placeholder="도로명주소"	name="address2">
					<input type="text" id="sample4_jibunAddress" placeholder="지번주소">
					<span id="guide" style="color:#999;display:none"></span>
					<input type="text" id="sample4_detailAddress" placeholder="상세주소" name="address3">
					<input type="text" id="sample4_extraAddress" placeholder="참고항목">
				</td>
				
			</tr>
			
			<tr>
				<td><button type="submit">register</button></td>
				<td><button type="reset">cancel</button></td>
			
			</tr>
			
			
		</table>
	</form>
</body>
</html>