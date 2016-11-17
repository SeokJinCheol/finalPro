<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>joinForm</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>
	<div align=center class="w3-container" style="background: #f5f6f7; width: 1350px; height:500px; vertical-align:middle; display:table-cell;">
		<div style="width: 40%;" align=center>
			<div class="w3-rest w3-container w3-round-large w3-card-4" style="background-color: #F0F0f0">
				<div style="margin-bottom:20px; margin-top:20px;">
					<h3>주 의</h3>
					※ 원하시는 회원을 선택하고 회원가입을 계속 진행해주세요. ※
				</div>

				<div style="margin-bottom:20px;">
					<a href="joinForm1" class="join-btn" style="width:40%; height:100px; line-height: 90px;">일반회원용</a>
					&nbsp;&nbsp;&nbsp;
					<a href="joinForm2" class="join-btn" style="width:40%; height:100px; line-height: 90px;">기업회원용</a>
				</div>
			</div>
		</div>	
	</div>
</body>
</html>