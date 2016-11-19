<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>rantendForm</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>	
	<div align=center class="w3-container" style="background: #f5f6f7; width: 1350px; height:500px; vertical-align:middle; display:table-cell;">
		<div style="margin-bottom:20px; margin-top:70px;">
			<h4> - rantendForm - </h4>

			<table>
				<tr>
					<td>대여횟수</td>
					<td>글번호</td>
					<td>판매자</td>
					<td>판매자시작날짜</td>
					<td>판매자종료날짜</td>
					<td>대여자</td>
					<td>대여자시작날짜</td>
					<td>대여자종료날짜</td>
					<td>대여비</td>
					<td>보증금</td>
				</tr>
				
				<c:forEach items="${rentstartlist}" var="rentstartlist">
					<c:forEach items="${storagecount1}" var="storagecount1">
						<tr>
							<td>${storagecount1.sNum}</td>
							<td>${rentstartlist.codeNum}</td>
							<td>${rentstartlist.resister}</td>
							<td>${rentstartlist.startDate}</td>
							<td>${rentstartlist.endDate}</td>
							<td>${rentstartlist.rentter}</td>
							<td>${rentstartlist.userstartDate}</td>
							<td>${rentstartlist.userendDate}</td>
							<td>${rentstartlist.bill}</td>
							<td>${rentstartlist.deposit}</td>
							<td>
								<form action="rentcancelend" method="post">
									<input type="hidden" name="codeNum" value="${rentstartlist.codeNum}">
									<input type="hidden" name="sNum"  value="${storagecount1.sNum}">
									<input type="submit" value="반납완료">
								</form>
							</td>
						</tr>
					</c:forEach>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>