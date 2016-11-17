<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>munu1</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>	
	<div align=center class="w3-container" style="background: #f5f6f7; width: 1350px; height:500px; vertical-align:middle; display:table-cell;">
		<c:forEach items="${registerform}" var="registerform">
			<table>
				<tr>
					<td>제목
					<td>
					<td>${registerform.title}</td>
				<tr>
				<tr>
					<td>대여 시작일</td>
					<td>${registerform.startDate}</td>
				</tr>
				<tr>
					<td>대여종료일</td>
					<td>${registerform.endDate}</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>${registerform.contents}</td>
				</tr>
				<tr>
					<td>보증금/대여료</td>
					<td>${registerform.bill}/${registerform.deposit}</td>
				</tr>
			</table>
			
			<form action="registerboardup" method="post">
				<table>
					<tr>
						<td>대여자 신청일자</td>
						<td><input type="date" name="userstartDate" required min="${registerform.startDate}" max="${registerform.endDate}"></td>
					</tr>
					<tr>
						<td>대여자 종료일자</td>
						<td><input type="date" name="userendDate" required min="${registerform.startDate}" max="${registerform.endDate}" ></td>
					</tr>
				</table>
				<input type="hidden" value="${registerform.codeNum}" name="codeNum">
				<input type="submit" value="신청하기">
			</form>
		</c:forEach>
	</div>
</body>
</html>