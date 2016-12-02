<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>menu1_left</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>
	<div align=center>
		<div  style="background:#6699DC; color:white; width:20%; height:100px; vertical-align:middle; display:table-cell;"><img src="/team4/resources/images/left-in.png"><font size="5">&nbsp;&nbsp;물 품 등 록</font></div><br>
		
		<c:if test="${session_id != 'admin'}">
			<div class="left-menu"><a href="menu1" class="rollover">
				<img src="/team4/resources/images/left-freeboard11.png" style="margin-right:5px;">
				<img src="/team4/resources/images/free_list.png" class="imgover" style="margin-right:5px;">
				&nbsp;전 체 등 록 목 록</a></div><br>

			<div class="left-menu"><a href="menu1_1" class="rollover">
				<img src="/team4/resources/images/left-menu11.png" style="margin-right:5px;">
				<img src="/team4/resources/images/left-menu12.png" class="imgover" style="margin-right:5px;">
				&nbsp;업 체 별 등 록 현 황</a></div><br>
			
			<div class="left-menu"><a href="menu1_2" class="rollover">
				<img src="/team4/resources/images/left-menu21.png" style="margin-right:5px;">
				<img src="/team4/resources/images/left-menu22.png" class="imgover" style="margin-right:5px;">
				&nbsp;개 인 별 등 록 현 황</a></div><br>

			<div class="left-menu"><a href="menu1_3" class="rollover">
				<img src="/team4/resources/images/left-menu31.png" style="margin-right:5px;">
				<img src="/team4/resources/images/left-menu32.png" class="imgover" style="margin-right:5px;">
				&nbsp;나 의 등 록 현 황</a></div><br>
  		</c:if>
	
		<c:if test="${session_id == 'admin'}">
			<div class="left-menu"><a href="menu1" class="rollover">
				<img src="/team4/resources/images/left-freeboard11.png" style="margin-right:5px;">
				<img src="/team4/resources/images/free_list.png" class="imgover" style="margin-right:5px;">
				&nbsp;전 체 등 록 목 록</a></div><br>

			<div class="left-menu"><a href="rentready" class="rollover">
				<img src="/team4/resources/images/left-menu41.png" style="margin-right:5px;">
				<img src="/team4/resources/images/left-menu42.png" class="imgover" style="margin-right:5px;">
				&nbsp;심 사 대 기 현 황</a></div><br>
			<div class="left-menu"><a href="rentend" class="rollover">
				<img src="/team4/resources/images/left-menu51.png" style="margin-right:5px;">
				<img src="/team4/resources/images/left-menu52.png" class="imgover" style="margin-right:5px;">
				&nbsp;대 여 종 료 대 기</a></div><br>	
  		</c:if>
	</div>
</body>
</html>