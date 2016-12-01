<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>
	<div align=center>
		<div  style="background:#6699DC; color:white; width:20%; height:100px; vertical-align:middle; display:table-cell;"><img src="/team4/resources/images/left-mypage.png"><font size="5">&nbsp;&nbsp;My Page</font></div><br>
		<div class="left-menu"><a href="mymaillist" class="rollover">
			<img src="/team4/resources/images/mail1.png" style="margin-right:5px;">
			<img src="/team4/resources/images/mail2.png" class="imgover" style="margin-right:5px;">
			&nbsp;메 일 확 인 하 기</a></div><br>
		
		
		<!-- 나의 물품 목록 -->
		<div class="left-menu left-admin">
			<ul style="padding: 0px; margin-bottom:0px; margin-top:0px;">
				<li>
					<a href="myrequest" class="rollover ">
						<img src="/team4/resources/images/box1.png" style="margin-right:5px;">
						<img src="/team4/resources/images/box.png" class="imgover" style="margin-right:5px;">
						&nbsp;물　품　목　록
					</a>
		
					<ul style="padding: 0px;" class="left-admin2">
						<li>
							<a href="myrequest" class="rollover ">
								<img src="/team4/resources/images/mywrite1.png" style="margin-right:5px;">
								<img src="/team4/resources/images/mywrite2.png" class="imgover" style="margin-right:5px;">
								&nbsp;나 의 물 품 목 록</a>
						</li>
						
						<li>
							<a href="myrentlist" class="rollover ">
								<img src="/team4/resources/images/lend1.png" style="margin-right:5px;">
								<img src="/team4/resources/images/lend2.png" class="imgover" style="margin-right:5px;">
								&nbsp;나 의 대 여 목 록</a>
						</li>
					</ul>
				</li>
			</ul>
		</div><br>

		<!-- 나의 장소 목록 -->
		<div class="left-menu left-admin">
			<ul style="padding: 0px; margin-bottom:0px; margin-top:0px;">
				<li>
					<a href="myRRBlist" class="rollover ">
						<img src="/team4/resources/images/location1.png" style="margin-right:5px;">
						<img src="/team4/resources/images/left-location.png" class="imgover" style="margin-right:5px;">
						&nbsp;장　소　목　록
					</a>
		
					<ul style="padding: 0px;" class="left-admin2">
						<li>
							<a href="myRRBlist" class="rollover ">
								<img src="/team4/resources/images/mywrite1.png" style="margin-right:5px;">
								<img src="/team4/resources/images/mywrite2.png" class="imgover" style="margin-right:5px;">
								&nbsp;나 의 장 소 목 록</a>
						</li>
		
						<li>
							<a href="myRPBlist" class="rollover ">
								<img src="/team4/resources/images/lend1.png" style="margin-right:5px;">
								<img src="/team4/resources/images/lend2.png" class="imgover" style="margin-right:5px;">
								&nbsp;나 의 대 관 목 록</a>
						</li>
					</ul>
				</li>
			</ul>
		</div><br>

		<!-- 기본정보 수정 & 탈퇴 -->
		<div class="left-menu"><a href="mypage_update" class="rollover">
			<img src="/team4/resources/images/left-mypage11.png" style="margin-right:5px;">
			<img src="/team4/resources/images/left-mypage12.png" class="imgover" style="margin-right:5px;">
			&nbsp;회 원 정 보 수 정</a></div><br>
		<div class="left-menu"><a href="mypage_delete" class="rollover">
			<img src="/team4/resources/images/left-mypage21.png" style="margin-right:5px;">
			<img src="/team4/resources/images/left-mypage22.png" class="imgover" style="margin-right:5px;">
			&nbsp;회　원 　 탈　퇴</a></div><br>
	</div>
</body>
</html>