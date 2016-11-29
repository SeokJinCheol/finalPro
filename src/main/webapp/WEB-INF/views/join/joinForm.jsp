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
	<div class="row" style="background:#6699DC; color:white; height:100px; text-align: right;line-height: 130px;">
		<img src="/team4/resources/images/joinForm.png" style="margin-right:10px;">
		<font style="margin-right: 30px;font-family: 'Hanna', fantasy; font-style: bold; font-size: 30px; ">회 원 가 입</font>
	</div>

	<div align=center class="w3-container" style="background: #f5f6f7; width: 1350px; height:500px; vertical-align:middle; display:table-cell;">
		<div style="width: 40%;" align=center>
			<div class="w3-rest w3-container w3-card-8 w3-round-large" style="background-color: #fff">
				<div style="margin-bottom:20px; margin-top:20px;">
					<h3>주　　　　의</h3><br>
					※ 원하시는 회원을 선택하고 회원가입을 계속 진행해주세요. ※
				</div>

				<div style="margin-bottom:20px;">
					<a href="joinForm1" class="join-btn w3-card-4" style="width:40%; height:100px; line-height: 90px;">일반회원용</a>
					&nbsp;&nbsp;&nbsp;
					<a href="joinForm2" class="join-btn w3-card-4" style="width:40%; height:100px; line-height: 90px;">기업회원용</a>
				</div>
			</div>
		</div>	
	</div>
</body>
</html>