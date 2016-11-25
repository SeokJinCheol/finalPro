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
			<img src="/team4/resources/images/#" style="margin-right:5px;">
			<img src="/team4/resources/images/#" class="imgover" style="margin-right:5px;">
			&nbsp;메 일 확 인 하 기</a></div><br>
		<div class="left-menu"><a href="myrequest" class="rollover">
			<img src="/team4/resources/images/#" style="margin-right:5px;">
			<img src="/team4/resources/images/#" class="imgover" style="margin-right:5px;">
			&nbsp;나 의 물 건 보 기</a></div><br>	
		<div class="left-menu"><a href="myrentlist" class="rollover">
			<img src="/team4/resources/images/#" style="margin-right:5px;">
			<img src="/team4/resources/images/#" class="imgover" style="margin-right:5px;">
			&nbsp;나 의 대 여 목 록</a></div><br>
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