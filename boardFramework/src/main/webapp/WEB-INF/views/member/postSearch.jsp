<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$('#zipcodeBtn').on("click",function(){
		window.open("/searchPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	});
});

</script>

</head>
<body>
	<div id="callBackDiv">
		<table>
			<tr>
				<td>우편번호</td>
				<td>
					<input type="text" style="width: 325px;" id="zipcode"name="zipcode" /> 
					<a href="#" id="zipcodeBtn">검색하기</a>
				</td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" style="width: 400px;" id="addr1"
					name="addr1" /></td>
			</tr>
			<tr>
				<td>상세주소</td>
				<td><input type="text" style="width: 400px;" id="addr2"
					name="addr2" /></td>
			</tr>
		</table>
	</div>
</body>
</html>