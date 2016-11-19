<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>menu1_2</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>	
	<div align=center class="w3-container" style="background: #f5f6f7; width: 1350px; height:500px; vertical-align:middle; display:table-cell;">
		<div style="margin-bottom:20px; margin-top:70px;">
			<h4> - menu1_2 - </h4>
		
			<table border="1">
				<tr>
					<td>글번호</td>
					<td>이미지</td>
					<td>제목</td>
					<td>반납일</td>
					<td>신청</td>
				</tr>
				<c:forEach items="${MyRegisterselect}" var="MyRegisterselect">
					<tr>
						<td>${MyRegisterselect.codeNum}</td>
						<td style="width: 20%"><img src="/team4/resources/RequestImg/${MyRegisterselect.img }" style="width: 100%; height: 100px;"></td>
						<td>${MyRegisterselect.title}</td>
						<td>${MyRegisterselect.userendDate}</td>
						<td>
							<c:if test="${MyRegisterselect.packageStatus == '대여중'}">
								<form action="endrent" method="post">
									<input type="hidden" value="${MyRegisterselect.codeNum}" name="codeNum">
									<input type="submit" value="반납신청">
								</form>
							</c:if>
							<c:if test="${MyRegisterselect.packageStatus == '대여신청'}">
								<form action="rentcancel" method="post">
									<input type="hidden" value="${MyRegisterselect.codeNum}" name="codeNum">
									<input type="hidden" name="pagecheck" value="user">
									<input type="submit" value="신청취소">
								</form>
							</c:if>
							<c:if test="${MyRegisterselect.packageStatus != '대여신청'}">
							<c:if test="${MyRegisterselect.packageStatus != '대여신청'}">
								${MyRegisterselect.packageStatus}
							</c:if>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>