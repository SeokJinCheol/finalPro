<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<div  style="background:#6699DC; color:white; width:20%; height:100px; vertical-align:middle; display:table-cell;"><img src="/team4/resources/images/left-out.png"><font size="5">&nbsp;&nbsp;물 품 대 여</font></div><br>
		
		<c:if test="${session_id != 'admin'}">
			<div class="left-menu"><a href="menu2" class="rollover">
				<img src="/team4/resources/images/left-freeboard11.png" style="margin-right:5px;">
				<img src="/team4/resources/images/free_list.png" class="imgover" style="margin-right:5px;">
				&nbsp;전 체 대 여 목 록</a></div><br>
			<div class="left-menu"><a href="menu2_1" class="rollover">
				<img src="/team4/resources/images/left-menu61.png" style="margin-right:5px;">
				<img src="/team4/resources/images/left-menu62.png" class="imgover" style="margin-right:5px;">
				&nbsp;대 여 가 능 현 황</a></div><br>
			<div class="left-menu"><a href="menu2_2" class="rollover">
				<img src="/team4/resources/images/left-menu31.png" style="margin-right:5px;">
				<img src="/team4/resources/images/left-menu32.png" class="imgover" style="margin-right:5px;">
				&nbsp;나 의 대 여 현 황</a></div><br>
		</c:if>
	
		<c:if test="${session_id == 'admin'}">
			<div class="left-menu"><a href="menu2" class="rollover">
				<img src="/team4/resources/images/left-freeboard11.png" style="margin-right:5px;">
				<img src="/team4/resources/images/free_list.png" class="imgover" style="margin-right:5px;">
				&nbsp;전 체 대 여 목 록</a></div><br>
			<div class="left-menu"><a href="rentreadylist" class="rollover">
				<img src="/team4/resources/images/left-menu71.png" style="margin-right:5px;">
				<img src="/team4/resources/images/left-menu72.png" class="imgover" style="margin-right:5px;">
				&nbsp;대　  여　  신　  청</a></div><br>
			<div class="left-menu"><a href="rentoutlist" class="rollover">
				<img src="/team4/resources/images/left-menu81.png" style="margin-right:5px;">
				<img src="/team4/resources/images/left-menu82.png" class="imgover" style="margin-right:5px;">
				&nbsp;반　  납　  신　  청</a></div><br>
		</c:if>
	</div>
</body>
</html>