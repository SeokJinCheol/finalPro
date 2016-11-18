<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Q&A_content</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>
	<div align=center class="w3-container" style="background: #f5f6f7; width: 1350px; height: 500px; vertical-align: middle; display: table-cell;">
		<div style="margin-bottom: 20px; margin-top: 70px;">
			<h4>- Q & A_Content -</h4>
			
			<table border=1 width="500">
				<c:forEach items="${result}" var="result">
					<c:if test="${result.bNum==result.bgnum }">
						<tr>
							<td width="50px" align="center">bNum</td>
							<td>${result.bNum }</td>
						</tr>

						<tr>
							<td width="50px" align="center">ID</td>
							<td>${result.id }</td>
						</tr>

						<tr>
							<td width="50px" align="center">Category</td>
							<td>${result.category }</td>
						</tr>

						<tr>
							<td width="50px" align="center">Title</td>
							<td>${result.title }</td>
						</tr>

						<tr>
							<td width="50px" align="center">Img</td>
							<td><img src="/team4/resources/QandAImg/${result.img }"
								style="width: 100%; height: 300px;"></td>
						</tr>

						<tr>
							<td width="50px" align="center">Contents</td>
							<td style="width: 100%; height: 200px;" align="center">${result.contents }</td>
						</tr>

						<tr>
							<td width="50px" align="center">bDate</td>
							<td>${result.bDate }</td>
						</tr>
			</table>

			<br>
			<br> 
			<input type="button" value="답글달기" onclick="window.location='insertForm?bNum=${result.bNum}&bgnum=${result.bgnum }&groupnum=${result.groupnum}&ranknum=${result.ranknum} '">
			<input type="button" value="수정하기" onclick="window.location='updateForm?bNum=${result.bNum}&bgnum=${result.bgnum }&id=${result.id } '">
			<input type="button" value="삭제하기" onclick="window.location='deleteForm?bNum=${result.bNum}&bgnum=${result.bgnum }&id=${result.id } '">

			<form action="insertForm" method="post">
				<table>
					<tr>
						<td width="500" colspan="2"><input type="text" name="contents" style="width: 100%; height: 50px;"></td>
					</tr>

					<tr>
						<td>${session_id}님!!</td>
						<td><input type="submit" value="답글"></td>
					</tr>
				</table>

				<input type="hidden" name="bNum" value="${result.bNum }"> 
				<input type="hidden" name="bgnum" value="${result.bgnum }"> 
				<input type="hidden" name="groupnum" value="${result.groupnum }">
				<input type="hidden" name="ranknum" value="${result.ranknum }">
				<input type="hidden" name="id" value="${session_id}" />
			</form>

			<br>
			</c:if>
			</c:forEach>

			<table>
				<c:forEach items="${result}" var="result">
					<c:if test="${result.groupnum != 0}">
						<tr>
							<td width="150"><c:if test="${ result.ranknum>1}">
									<c:forEach begin="1" end="${ result.ranknum -1}">ㅡ>&nbsp;&nbsp;</c:forEach>
								</c:if> ${result.id }</td>

							<td rowspan="1" width="300">${result.contents }</td>

							<td>${result.bDate }</td>

							<td>
								<input type="button" value="답글" onclick="window.location='insertForm?bNum=${result.bNum}&bgnum=${result.bgnum }&groupnum=${result.groupnum}&ranknum=${result.ranknum} '">
								<input type="button" value="수정" onclick="window.location='updateForm?bNum=${result.bNum}&bgnum=${result.bgnum }&id=${result.id } '">
								<input type="button" value="삭제" onclick="window.location='deleteForm?bNum=${result.bNum}&bgnum=${result.bgnum }&id=${result.id } '">
							</td>
						</tr>
					</c:if>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>