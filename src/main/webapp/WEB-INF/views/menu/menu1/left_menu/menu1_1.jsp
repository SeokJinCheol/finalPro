<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>업체 등록 현황</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/w3.css"
	type="text/css" media="screen">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/login.css"
	type="text/css" media="screen">
</head>
<body>
	<div align=center class="w3-container" style="background: #f5f6f7; width: 1350px; height: 500px; vertical-align: middle; display: table-cell;">
		<table border="1">
			<tr>
				<td>글번호</td>
				<td>이미지</td>
				<td>글쓴이</td>
				<td>제목</td>
				<td>상황</td>
			</tr>
			<c:forEach items="${requestlist}" var="requestlist">
				<tr>
					<td>${requestlist.codeNum}</td>
					<td style="width: 20%"><img src="/team4/resources/RequestImg/${requestlist.img}" style="width: 100%; height: 100px;"></td>
					<td>${requestlist.reaquestId}</td>
					<td>${requestlist.title}</td>
					<td>${requestlist.packageStatus}</td>
				</tr>
			</c:forEach>
		</table>
		
		<a href="requestwriteform">글쓰기</a>
	</div>
</body>
</html>