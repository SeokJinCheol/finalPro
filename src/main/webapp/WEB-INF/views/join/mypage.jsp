<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>mypage</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>
	<div align=center class="main-table" style="background: #f5f6f7; width: 1350px; height: 500px; vertical-align:middle; display:table-cell;">
		<div style="width: 40%;" align=center>
			<div class="w3-rest w3-container w3-round-large w3-card-4" style="background-color: #F0F0f0">
				<div style="margin-bottom:20px; margin-top:20px;">
					<h3> My Page </h3>
					※ 원하시는 기능을 선택하여 계속 진행해주세요. ※
				</div>
				
				<div style="margin-bottom:20px;">
					<a href="mypage_update" class="join-btn" style="width:40%; height:100px; line-height: 90px;">회원 정보 수정</a>
					&nbsp;&nbsp;&nbsp;
					<a href="mypage_delete" class="join-btn" style="width:40%; height:100px; line-height: 90px;">회 원 탈 퇴</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>