
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<title>account</title>
<head>
<!-- CSS 연결-->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>	
	<div align=center class="w3-container" style="background: #f5f6f7; width: 1350px; height:500px; vertical-align:middle; display:table-cell;">		
		<table border=1>
			<tr>
				<td>대여자</td>
				<td>대여일</td>
				<td>반납일</td>
				<td>대여비</td>
				<td>대여일수</td>
				<td>결제금액</td>
			</tr>
		 
			<c:forEach items="${storagelist}" var="storagelist" begin="0" end="${fn:length(storagelist)}" varStatus="status">
				<tr>
					<td>${storagelist.rentter}</td>
					<td>${storagelist.startDate}</td>
					<td>${storagelist.endDate}</td>
					<td>${storagelist.bill}</td>
					<td>${rentDate[status.index]}</td>
					<td>${pay[status.index]}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>