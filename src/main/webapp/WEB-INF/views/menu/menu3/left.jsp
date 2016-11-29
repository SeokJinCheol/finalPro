<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>menu3_left</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>
	<div align=center>
		<div  style="background:#6699DC; color:white; width:20%; height:100px; vertical-align:middle; display:table-cell;"><img src="/team4/resources/images/left-location.png"><font size="5">&nbsp;&nbsp;장 소 대 여</font></div><br>
		
		<security:authorize ifAnyGranted="role_master">
			<div class="left-menu"><a href="RRlist" class="rollover">
			<img src="/team4/resources/images/map41.png" style="margin-right:5px;">
			<img src="/team4/resources/images/map42.png" class="imgover" style="margin-right:5px;">
			&nbsp;장 소 등 록 관 리</a></div><br>	
			<div class="left-menu"><a href="menu3_5" class="rollover">
				<img src="/team4/resources/images/map51.png" style="margin-right:5px;">
				<img src="/team4/resources/images/map52.png" class="imgover" style="margin-right:5px;">
				&nbsp;장 소 대 여 관 리</a></div><br>
			<div class="left-menu"><a href="menu3_1" class="rollover">
				<img src="/team4/resources/images/map11.png" style="margin-right:5px;">
				<img src="/team4/resources/images/map12.png" class="imgover" style="margin-right:5px;">
				&nbsp;등 록 하 기</a></div><br>	
			<div class="left-menu"><a href="menu3" class="rollover">
				<img src="/team4/resources/images/map21.png" style="margin-right:5px;">
				<img src="/team4/resources/images/map22.png" class="imgover" style="margin-right:5px;">
				&nbsp;지 도 찾기</a></div><br>	
			<div class="left-menu"><a href="menu3_3" class="rollover">
				<img src="/team4/resources/images/map31.png" style="margin-right:5px;">
				<img src="/team4/resources/images/map32.png" class="imgover" style="margin-right:5px;">
				&nbsp;목 록 찾기</a></div><br>
		</security:authorize>
		
		<security:authorize ifAnyGranted="role_user, role_com">
			<div class="left-menu"><a href="menu3_1" class="rollover">
				<img src="/team4/resources/images/#" style="margin-right:5px;">
				<img src="/team4/resources/images/#" class="imgover" style="margin-right:5px;">
				&nbsp;등 록 하 기</a></div><br>	
			<div class="left-menu"><a href="menu3" class="rollover">
				<img src="/team4/resources/images/#" style="margin-right:5px;">
				<img src="/team4/resources/images/#" class="imgover" style="margin-right:5px;">
				&nbsp;지 도 찾기</a></div><br>	
			<div class="left-menu"><a href="menu3_3" class="rollover">
				<img src="/team4/resources/images/#" style="margin-right:5px;">
				<img src="/team4/resources/images/#" class="imgover" style="margin-right:5px;">
				&nbsp;목 록 찾기</a></div><br>
		</security:authorize>
	</div>
</body>
</html>