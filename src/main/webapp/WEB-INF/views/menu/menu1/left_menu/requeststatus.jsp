<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>requeststatus</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>	
	<div align=center class="w3-container" style="background: #f5f6f7; width: 1350px; height:500px; vertical-align:middle; display:table-cell;">
		<div style="margin-bottom:20px; margin-top:70px;">
			<h4> - requeststatus - </h4>
		
			<table border="1">
				<tr>
					<td>글번호</td>
					<td>이미지</td>
					<td>제목</td>
					<td>상황</td>
					<td>작업</td>
				</tr>
				
				<c:forEach items="${requestboardstatus}" var="requestboardstatus">
					<tr>
						<td>${requestboardstatus.codeNum}</td>
						<td style="width: 20%"><img src="/team4/resources/RequestImg/${requestboardstatus.img }" style="width: 100%; height: 100px;"></td>
						<td>${requestboardstatus.title}</td>
						<td>${requestboardstatus.packageStatus}</td>
						<td>
						<c:if test="${requestboardstatus.packageStatus == '심사중'}">
							<form action="RegisterBoardwrite" method="post">
								<input type="hidden" name="codeNum" value="${requestboardstatus.codeNum}"> 
								<input type="submit" value="심사하기">
							</form>
						</c:if>
						<c:if test="${requestboardstatus.packageStatus == '대여종료신청'}">
							<form action="Requestboardend" method="post">
								<input type="hidden" name="codeNum" value="${requestboardstatus.codeNum}">
								<input type="submit" value="대여종료">
							</form>
						</c:if>
						</td>
					<tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>