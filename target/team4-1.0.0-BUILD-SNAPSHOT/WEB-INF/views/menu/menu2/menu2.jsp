<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>menu2</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>	
	<div align=center class="w3-container" style="background: #f5f6f7; width: 1350px; height:500px; vertical-align:middle; display:table-cell;">
		<div style="margin-bottom:20px; margin-top:70px;">
			<h4> - menu2 - </h4>	

			<table border="1">
				<tr>
					<td>글번</td>
					<td>이미지</td>
					<td>카테고리</td>
					<td>제목</td>
					<td>상황</td>
					<td>신청</td>
				<tr>
				
				<c:forEach items="${Registerselect}" var="Registerselect">
					<tr>
						<td>${Registerselect.codeNum}</td>
						<td style="width: 20%"><img src="/team4/resources/RequestImg/${Registerselect.img }" style="width: 100%; height: 100px;"></td>
						<td>${Registerselect.category}</td>
						<td>${Registerselect.title}</td>
						<td>${Registerselect.packageStatus}</td>
	
						<!-- 일반유저 -->
						<c:if test="${session_id != 'admin'}">
							<c:if test="${Registerselect.packageStatus == '대여가능'}">
								<td>
									<form action="RegisterUpForm" method="post">
										<input type="hidden" value="${Registerselect.codeNum}" name="codeNum">
										<input type="submit" value="신청하기">
									</form>
								</td>
							</c:if>
							
							<c:if test="${Registerselect.packageStatus != '대여가능'}">
								<td>신청불가</td>
							</c:if>
						</c:if>
						
						<!-- admin 버튼 -->
						<c:if test="${session_id == 'admin'}">
							<c:if test="${Registerselect.packageStatus == '대여신청'}">
								<td>
									<form action="startrentForm" method="post">
										<input type="hidden" value="${Registerselect.codeNum}" name="codeNum">
										<input type="submit" value="대여시작">
									</form>
								</td>
							</c:if>
							
							<c:if test="${Registerselect.packageStatus == '반납신청'}">
								<td>
									<form action="storageendrent" method="post">
										<input type="hidden" value="${Registerselect.codeNum}" name="codeNum">
										<input type="submit" value="반납완료하기">
									</form>
								</td>
							</c:if>
							
							<c:if test="${Registerselect.packageStatus == '대여종료신청'}">
								<td>
									<form action="" method="post">
										<input type="hidden" value="${Registerselect.codeNum}" name="codeNum">
										<input type="submit" value="대여종료">
									</form>
								</td>
							</c:if>
						</c:if>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>