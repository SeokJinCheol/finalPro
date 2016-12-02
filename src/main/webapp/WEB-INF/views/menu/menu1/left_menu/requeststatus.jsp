<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>관리자 - 심사대기현황</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>
	<!-- 심사대기현황 타이틀 -->
	<c:if test="${status == '심사중'}">
		<div class="row" style="background:#6699DC; color:white; height:100px; text-align: right; line-height: 130px;">
			<img src="/team4/resources/images/left-menu42.png" style="margin-right:10px;">
		    <font style="margin-right: 30px;font-family: 'Hanna', fantasy; font-style: bold; font-size: 30px; ">심 사 대 기 현 황</font>
		</div>
	</c:if>
	
	<!-- 대여종료대기 타이틀 -->
	<c:if test="${status == '대여종료신청'}">
		<div class="row" style="background:#6699DC; color:white; height:100px; text-align: right; line-height: 130px;">
			<img src="/team4/resources/images/left-menu52.png" style="margin-right:10px;">
		    <font style="margin-right: 30px;font-family: 'Hanna', fantasy; font-style: bold; font-size: 30px; ">대 여 종 료 대 기</font>
		</div>
	</c:if>

	<div align=center style="background: #f5f6f7; width: 1350px; height: 500px; vertical-align: middle; display: table-cell;">
		<div style="margin-bottom: 20px; width:550px; background-color: #fafafa;" class="w3-card-8">
			<table style="height:403px; width:550px; padding: 20px; text-align:center; border-collapse: collapse; border-spacing: 0; padding-top: 5px; padding-bottom: 10px;">
				<thead style="height:30px; table-layout:fixed">
					<tr class="bottom-border2" style=" height:30px; margin-bottom: 20px; background-color: #80b5ea; color:white; text-align: center;">
			        	<td width=80 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">No.</td>
			        	<td width=140 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">물품사진</td>
			         	<td width=140 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">제　목</td>
			        	<td width=110 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">현　황</td>
			         	<td width=80 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000;">비　고</td>
			    	</tr>
				</thead>
			    
				<tbody style="height:370px; overflow-y: auto; position: absolute;">
					<c:forEach items="${requestboardstatus}" var="requestboardstatus">
						<tr onMouseOver="this.style.backgroundColor='#requestboardstatus'" onMouseOut="this.style.backgroundColor='#fafafa'" style="height:30px;">
					    	<td width=80 style="border-bottom: 3px solid #fff;">${requestboardstatus.codeNum}</td>
					    	<td width=140 style="border-bottom: 3px solid #fff;">
								<img src="/team4/resources/RequestImg/${requestboardstatus.img}" style="width: 100%; height: 110px;">
							</td>
					    	
							<!-- 제목이 12자 이상일 경우 줄여쓰기 기능 -->
		             		<c:choose>
			             		<c:when test="${fn:length(requestboardstatus.title) > 12}">
									<td width=140 style="border-bottom: 3px solid #fff; font-size: 1;">
										<c:out value="${fn:substring(requestboardstatus.title,0,12)}" />...
									</td>
								</c:when>
								
								<c:otherwise>
									<td width=140 style="border-bottom: 3px solid #fff; font-size: 1;">
										<c:out value="${requestboardstatus.title}"/>
									</td>
								</c:otherwise>
							</c:choose>

							<td width=110 style="border-bottom: 3px solid #fff;">${requestboardstatus.packageStatus}</td>
							
							<td width=80 style="border-bottom: 3px solid #fff;">
				            	<c:if test="${requestboardstatus.packageStatus == '심사중'}">
									<form action="RegisterBoardwrite" method="post">
										<input type="hidden" name="codeNum" value="${requestboardstatus.codeNum}"> 
										
										<input type="submit" value="" class="update-btn98 w3-card-4">
									</form>
								</c:if>
				            	
				        		<c:if test="${requestboardstatus.packageStatus == '대여종료신청'}">
									<form action="Requestboardend" method="post">
										<input type="hidden" name="codeNum" value="${requestboardstatus.codeNum}">
										
										<input type="submit" value="" class="update-btn97 w3-card-4">
									</form>
								</c:if>
							</td>
						<tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>