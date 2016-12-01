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
		<div  style="background:#6699DC; color:white; width:20%; height:100px; vertical-align:middle; display:table-cell;"><img src="/team4/resources/images/setting99.png"><font size="5">&nbsp;&nbsp;A d m i n</font></div><br>
		<div class="left-menu"><a href="list" class="rollover">
			<img src="/team4/resources/images/left-userlist.png" style="margin-right:5px;">
			<img src="/team4/resources/images/left-userlist2.png" class="imgover" style="margin-right:5px;">
			&nbsp;회 원 목 록</a></div><br>
			
		<div class="left-menu left-admin">
			<ul style="padding: 0px;">
				<li>
					<a href="account" class="rollover ">
						<img src="/team4/resources/images/left-cash1.png" style="margin-right:5px;">
						<img src="/team4/resources/images/left-cash2.png" class="imgover" style="margin-right:5px;">
						&nbsp;정 　 　 산
					</a>
				
					<ul style="padding: 0px;" class="left-admin2">
						<li>
							<a href="account" class="rollover ">
								<img src="/team4/resources/images/box1.png" style="margin-right:5px;">
								<img src="/team4/resources/images/box.png" class="imgover" style="margin-right:5px;">
								&nbsp;물 품 정 산</a>
						</li>
						
						<li>
							<a href="menu3_4" class="rollover ">
								<img src="/team4/resources/images/location1.png" style="margin-right:5px;">
								<img src="/team4/resources/images/left-location.png" class="imgover" style="margin-right:5px;">
								&nbsp;장 소 정 산</a>
						</li>
					</ul>
				</li>
			</ul>
		</div><br>
	</div>
</body>
</html>