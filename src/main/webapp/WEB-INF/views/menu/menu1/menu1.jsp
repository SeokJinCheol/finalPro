<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>munu1</title>
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
	<div align=center class="w3-container"
		style="background: #f5f6f7; width: 1350px; height: 500px; vertical-align: middle; display: table-cell;">
		<a href="requestwriteform">글쓰기</a>
		<div>
			<c:forEach items="${requestlist}" var="requestlist">
				<div style="width: 33.33%">
					<table border="1">
		<tr><td colspan="2">No. ${requestlist.codeNum} </td></tr>
		<tr><td colspan="2">
		<a   href="requestcontent?codeNum=${requestlist.codeNum}">
		<img src="/team4/resources/RequestImg/${requestlist.img }" style="width: 100%; height: 130px;"></a></td></tr>
		</table>

					<table border="1">

						<tr>
							<td style="width: 50%">${requestlist.reaquestId}</td>
							<td style="width: 50%">${requestlist.title}</td>
							<td style="width: 50%">${requestlist.packageStatus}</td>
							<c:if test="${session_id == 'admin'}">
								<c:if test="${requestlist.packageStatus =='심사중'}">
									<td>
										<form action="RegisterBoardwrite" method="post">
											<input type="hidden" name="codeNum"
												value="${requestlist.codeNum}"> <input type="submit"
												value="심사하기">
										</form>
									</td>
								</c:if>

								<c:if test="${requestlist.packageStatus =='대여종료신청'}">
									<td>
										<form action="Requestboardend" method="post">
											<input type="hidden" name="codeNum"
												value="${requestlist.codeNum}"> <input type="submit"
												value="대여종료">
										</form>
									</td>
								</c:if>
							</c:if>
						</tr>
					</table>
					<br>
					<br>
				</div>
		</div>
		<!-- 중간 공간확보용 -->
		<div>
			<p></p>
			</c:forEach>
		</div>
</body>
</html>